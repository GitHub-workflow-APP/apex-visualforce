## Introduction

Apex is the server-side language for apps running on Salesforce's web framework (alternately known as the "Force.com platform", "Lightning Platform", "SFDC" among other names).  It is coupled tightly with several server-side and client-side markup technologies (Visualforce and Lightning), and often used in conjunction with client-side JS and web services.

This document covers all versions of Apex; the latest version at the time of this writing was 38.0.  (Note that Visualforce and Lightning versions are different from Apex and various versions of Salesforce APIs.)  An emphasis on backwards compatibility over the long term has resulted in very few changes to the core Apex API reflected in this document.


## Entry Points

The following methods in Apex classes should be considered entry points:

### 1) All trigger functions

These are called by the Apex platform on various data-access operations; there are no direct references from other Apex code.

### 2) All public or global methods with no arguments

Any of these methods may be called directly from Visualforce markup constructs, such as `<apex:commandButton>` or `<apex:commandLink>`.

### 3) All methods annotated with these:

- `@AuraEnabled`
- `@HttpDelete`
- `@HttpGet`
- `@HttpPatch`
- `@HttpPost`
- `@HttpPut`
- `@InvocableMethod`
- `@RemoteAction`

These are exposed to REST services, Lightning controllers, or other client-side JS (and therefore, to the network in general).


## Taint Sources


### Class properties and setters

All public or global properties with public setters that are located in a public or global Apex class should be considered network-tainted. 

For example, in this class, both `bad1` and `good1` are String properties; but only `bad1` has a public setter, so it should be considered tainted.  This is true even if there are other assignments (e.g. in constructors or initialization blocks).

```
public with sharing class VFTest2Controller {
    public String bad1 { get; set; }
    public String good1 { get; private set; }

    public VFTest2Controller() {
        this.bad1 = 'bad1';
        this.good1 = 'good1';
    }
    public void runcmd1() {
        List<List<sobject>> res1 = search.query('FIND \'' + bad1 + '\' in all fields returning account(name, id)');     // CWEID 943
        List<List<sobject>> res2 = search.query('FIND \'' + good1 + '\' in all fields returning account(name, id)');
    }
}
```

### Public setter functions

Any public or global non-static method with a name that begins with 'set' (case-insensitive, like all Apex) and a single argument can be treated as a property setter and called by Visualforce pages.  This is true even when there is no corresponding property object declared on the class; the method can do whatever it likes with the data.

Here's an example method `setSomething` that happens to set a property that's not called `something`.  

```
public with sharing class VFTest2Controller {
    public String bad2 { get; private set; }

    public VFTest2Controller() {
        this.bad2 = 'bad2';
    }

    public void setSomething(String n) {
        this.bad2 = n;
    }
    public void runcmd1() {
        List<List<sobject>> res1 = search.query('FIND \'' + bad2 + '\' in all fields returning account(name, id)');     // CWEID 943
    }
}
```


### Parameters to exposed functions

All parameters passed to methods with the following annotations should be considered network-tainted:

- `@AuraEnabled`
- `@HttpPost`
- `@InvocableMethod`
- `@RemoteAction`

For example:

```
@RemoteAction
global static String remoteA(String foo, Book__c book, List<String> bar) {
    List<sobject> objs;
    if(foo.contains('foo1')) {
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + foo + '%\'');        // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(foo) + '%\'');
        return 'foo1' + objs.size();
    } else if(foo.contains('foo2')) {
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + book.name + '%\'');        // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(book.name) + '%\'');
    }
    // ...
}
```

### Properties to objects used in method-invocation objects

All properties in objects annotated with the `@InvocableVariable` annotation should be considered tainted.

### Additional network taint sources from function calls

```
* Map<String, Cookie> T = PageReference.getCookies()
    - both keys and all properties of values are tainted
* Map<String, String> T = PageReference.getHeaders()
    - both keys and values are tainted
* Map<String, String> T = PageReference.getParameters()
    - both keys and values are tainted
* String T = PageReference.getUrl()
* String T = HTTPResponse.getHeader(String key)
* String[] T = HTTPResponse.getHeaderKeys()
* String T = HTTPResponse.getBody()
* Blob T = HTTPResponse.getBodyAsBlob()
* RestRequest T = RestContext.request
```


## Type Info

- `Search.find()` returns an instance of `Search.SearchResults`
- `ApexPages.currentPage()` returns an instance of `PageReference`
- `ESAPI.encoder()` returns an instance of `SFDCEncoder`
- `PageReference.forResource()` returns an instance of `PageReference`
- All properties of `System.Page` or `Page` (e.g. `System.Page.vftestdata`, `Page.vftest1`) are instances of `PageReference`
- `http.send()` returns an instance of `HttpResponse`



## Taint Sinks

#### CWEID 601 (when T = Taint.Network)
    - Network.forwardToAuthPage(T)

#### CWEID 918 (when T = Taint.Network)
    - HttpRequest.setEndpoint(T)

#### CWEID 943 (when T = Taint.Network)
    - Database.query(T)
    - Database.countQuery(T)
    - Database.getQueryLocator(T)
    - Search.query(T)
    - Search.find(T)
    - Search.suggest(T, x, x)

#### CWEID 472 (when T = Taint.Network)
    - Search.SearchResults.get(T)
    - Search.suggest(x, T, x)

#### CWEID 99 (when T = Taint.Network)
    - Type.forName(T)
    - Type.forName(T, T)
    - Type.equals(T)
    - PageReference(T)
    - PageReference.forResource(T,T)

#### CWEID 80 (when T = Taint.Network)
    - SObject.addError(T, V)    <-- only when V is false 

## Taint Propagators

```
- (Map<String, String>)OUT = RestRequest.headers
- (Map<String, String>)OUT = RestRequest.params
- (Blob)OUT = Blob.valueOf(IN)
- (String)OUT = (Blob)IN.toString()
- OUT = (String)IN.abbreviate(x)
- OUT = (String)IN.abbreviate(x,x)
- OUT = (String)IN.capitalize()
- OUT = (String)IN.center(x)
- OUT = (String)IN.center(x, IN)
- OUT = (String)IN.deleteWhitespace()
- OUT = (String)IN.difference(IN)
- OUT = (String)IN.escapeCsv()
- OUT = (String)IN.escapeEcmaScript()
- OUT = (String)IN.escapeHTML3()
- OUT = (String)IN.escapeHTML4()
- OUT = (String)IN.escapeJava()
- OUT = (String)IN.escapeUnicode()
- OUT = (String)IN.escapeXml()
- OUT = (String)IN.getChars()
- OUT = String.fromCharArray(IN)
- OUT = String.getCommonPrefix(IN)
- OUT = String.join(IN, IN)
- OUT = (String)IN.left(x)
- OUT = (String)IN.leftPad(x)
- OUT = (String)IN.leftPad(x, IN)
- OUT = (String)IN.mid(x, x)
- OUT = (String)IN.normalizeSpace()
- OUT = (String)IN.remove(x)
- OUT = (String)IN.removeEnd(x)
- OUT = (String)IN.removeEndIgnoreCase(x)
- OUT = (String)IN.removeStart(x)
- OUT = (String)IN.removeStartignorecase(x)
- OUT = (String)IN.repeat(x)
- OUT = (String)IN.repeat(IN, x)
- OUT = (String)IN.replace(x, IN)
- OUT = (String)IN.replaceAll(x, IN)
- OUT = (String)IN.replaceFirst(x, IN)
- OUT = (String)IN.reverse()
- OUT = (String)IN.right(x)
- OUT = (String)IN.rightPad(x)
- OUT = (String)IN.rightPad(x, IN)
- OUT = (String)IN.split(x)
- OUT = (String)IN.split(x, x)
- OUT = (String)IN.splitByCharacterType()
- OUT = (String)IN.splitByCharacterTypeCamelCase()
- OUT = (String)IN.stripHtmlTags()
- OUT = (String)IN.substring(x)
- OUT = (String)IN.substring(x, x)
- OUT = (String)IN.substringAfter(x)
- OUT = (String)IN.substringAfterLast(x)
- OUT = (String)IN.substringBefore(x)
- OUT = (String)IN.substringBeforeLast(x)
- OUT = (String)IN.substringBetween(x)
- OUT = (String)IN.substringBetween(x, x)
- OUT = (String)IN.swapCase()
- OUT = (String)IN.toLowerCase()
- OUT = (String)IN.toLowerCase(x)
- OUT = (String)IN.toUpperCase()
- OUT = (String)IN.toUpperCase(x)
- OUT = (String)IN.trim()
- OUT = (String)IN.uncapitalize()
- OUT = (String)IN.unescapeCsv()
- OUT = (String)IN.unescapeEcmaScript()
- OUT = (String)IN.unescapeHTML3()
- OUT = (String)IN.unescapeHTML4()
- OUT = (String)IN.unescapeJava()
- OUT = (String)IN.unescapeUnicode()
- OUT = (String)IN.unescapeXml()
- OUT = String.valueOf(IN)
- OUT = EncodingUtil.base64Decode(IN)
- OUT = EncodingUtil.convertFromHex(IN)
- OUT = EncodingUtil.convertToHex(IN)
- OUT = EncodingUtil.urlDecode(IN, x)
- OUT = EncodingUtil.urlEncode(IN, x)
```

## Taint Cleansers
##### CLEAN = `String.escapeSingleQuotes(T)`

If possible, we should apply some limited heuristics to the expressions in which this call is used, in order to make it conditional.  Briefly, escaping all the single quotes in a tainted string is only effective if the escaped string will be used.  

Here's an illustration of how this can be misused.  In the first place, `String.escapeSingleQuotes` is being used correctly to escape a quoted string.  In the second, it's not -- and a tainted variable there can manipulate the query directly.

```
this.outval += ' ' + search.query('FIND \'' + String.escapeSingleQuotes(bad1) + '\' in all fields returning account(name, id)').size();
this.outval += ' ' + search.query('FIND \'%Oi\' in all fields returning account(' + String.escapeSingleQuotes(bad1) + ', id)').size();        // CWEID 943
```

Here's a suggested heuristic: If escapeSingleQuotes() is used in a string-concatenation expression, and no terms after the call to escapeSingleQuotes() are a string literal that contain a single quote, then we should treat it as a propagator.  Otherwise, it's a cleanser.


##### CLEAN = `SFDCEncoder.SFDC_HTMLENCODE(T)`
##### CLEAN = `SFDCEncoder.SFDC_JSENCODE(T)`
##### CLEAN = `SFDCEncoder.SFDC_JSINHTMLENCODE(T)`


## New Scans

### CWEID 321: Use of Hard-coded Cryptographic Key

When a `Blob` derived from a string literal is passed as one of the bolded parameters to these functions, flag the function call with a CWE 321.

Functions (CWE 321):

* Crypto.decrypt(String algorithm, **Blob privateKey**, Blob IV, Blob ciphertext)
* Crypto.decryptWithManagedIV(String algorithm, **Blob privateKey**, Blob ciphertext)
* Crypto.encrypt(String algorithm, **Blob privateKey**, Blob IV, Blob plaintext)
* Crypto.encryptWithManagedIV(String algorithm, **Blob privateKey**, Blob plaintext)
* Crypto.generateMac(String algorithm, Blob input, **Blob privateKey**)
* Crypto.sign(String algorithm, Blob input, **Blob privateKey**)
* Crypto.verifyMac(String algorithm, Blob input, **Blob privateKey**, Blob macToVerify)

Examples:

```
String anotherkey = 'secretpassword00';
Blob cipher2 = Crypto.encrypt('AES128', Blob.valueOf(anotherkey), ivblob, Blob.valueOf(plaintext));    // CWEID 321

Blob cipher3 = Crypto.encrypt('AES128', Blob.valueOf('anothersecret999'), ivblob, Blob.valueOf(plaintext));    // CWEID 321

Blob generatedKey = Crypto.generateAESKey(128);      // This is a safe way to generate a new key.  A key could also be retrieved from an external location; we assume that's safe.
Blob cipher4 = Crypto.encrypt('AES128', generatedKey, Blob.valueOf('1234567890123456'), Blob.valueOf(plaintext));
```

### CWEID 329: Not using a Random IV with CBC Mode

When a `Blob` derived from a string literal is passed as one of the bolded parameters to these functions, flag the function call with a CWE 329.

Functions (CWE 329):

* Crypto.decrypt(String algorithm, Blob privateKey, **Blob IV**, Blob ciphertext)
* Crypto.encrypt(String algorithm, Blob privateKey, **Blob IV**, Blob plaintext)


## Notes for future research

This spec covers Apex code only; we're not at this time going to parse Visualforce- or Lightning-specific markup tags and elements.  Similarly, while we currently analyze JavaScript, we don't support the Aura/Lightning framework, so our coverage of the client-side aspects of Salesforce applications will be limited.

On the apex side, lack of this support will cause FNs and FPs.  In the FN realm, the most significant issue is XSS flaws: without knowing which Apex class properties are written without escaping by Visualforce pages or Lightning controllers, we can't reliably flag XSS in those.

With respect to FPs, we're making the assumption above that all properties that can be set externally (e.g. by a Lightning controller or Visualforce tag) are in fact exposed.  This can affect all taint-related CWEs.

If this is a pain point for customers, we should incorporate some parsing of these objects (e.g. a normalizer pass) to extract relevant data for later processing by the Apex scanner.

## References

Many of the security issues described here (along with client-side issues as well) are covered in Salesforce's excellent security guide: [https://resources.docs.salesforce.com/214/latest/en-us/sfdc/pdf/secure_coding.pdf](https://resources.docs.salesforce.com/214/latest/en-us/sfdc/pdf/secure_coding.pdf).

Most of the classes in the API are documented in the [Apex Language Reference](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_reference.htm), though many important parts about server-side dataflow are located in various sections in the [Visualforce Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_intro.htm) and the [Lightning Platform](https://developer.salesforce.com/docs/atlas.en-us.fundamentals.meta/fundamentals/adg_simple_app.htm) documentation.




