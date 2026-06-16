global with sharing class VFTestDataController {
    public Contact goodcontact { get; private set; }

    public string badfield { get; set; }
    public String goodfield { get; private set; }
    public String outmsg { get; private set; }
    
    public VFTestDataController() {
    	this.goodcontact = (Contact) [SELECT id, firstname, lastname from contact].get(0);
        this.goodcontact.addError('this is an error <b>hi</b>', false);
        this.badfield = 'badfield';
        this.outmsg = ' ';
        this.goodfield = 'goodfield';
    }

    public void onstart() {
        PageReference thispage = ApexPages.currentPage();

        String origurl = thispage.getUrl();
        List<Object> objs;

        if(origurl.contains('foo')) {
            PageReference pr1 = new PageReference(origurl);      // CWEID 99
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + origurl + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr1.getParameters().get('id') + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr1.getCookies().get('wat').getValue() + '%\'');        // CWEID 943
        } else if(origurl.contains('bar')) {
            PageReference pr2 = PageReference.forResource('good', origurl);     // CWEID 99
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + origurl + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr2.getHeaders().get('id') + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr2.getCookies().get('wat').getValue() + '%\'');        // CWEID 943
        } else if(origurl.contains('baz')) {
            PageReference pr3 = PageReference.forResource(origurl, 'good');     // CWEID 99
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + origurl + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr3.getHeaders().get('id') + '%\'');        // CWEID 943
        } else if(origurl.contains('quux')) {
            PageReference pr4 = System.Page.vftestdata;
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr4.getParameters().get('id') + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + System.Page.vftest1.getParameters().get('id') + '%\'');        // CWEID 943
        } else if(origurl.contains('wazz1')) {
            PageReference pr5 = Page.vftestdata;
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pr5.getParameters().get('id') + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + Page.vftest1.getParameters().get('id') + '%\'');        // CWEID 943
        } else if(origurl.contains('wazz2')) {
            Map<String, System.Cookie> cs = thispage.getCookies();
            for(String ck: cs.keySet()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + ck + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(ck) + '%\'');
            }
            for(System.Cookie cook: cs.values()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + cook.getValue() + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(cook.getValue()) + '%\'');
            }
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(cs.get('Random').getValue()) + '%\'');
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + cs.get('Random').getValue() + '%\'');     // CWEID 943

            Map<String, String> heads = thispage.getHeaders();
            for(String hname: heads.keySet()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
            }
            for(String hvalue: heads.values()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
            }
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(heads.get('Headname')) + '%\'');
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + heads.get('Headname') + '%\'');     // CWEID 943

            Map<String, String> params = thispage.getParameters();
            for(String pname: params.keySet()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
            }
            for(String pvalue: params.values()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
            }
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(params.get('Headname')) + '%\'');
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + params.get('Headname') + '%\'');     // CWEID 943
        } else if(origurl.contains('wazz3')) {
            httprequest req = new httprequest();
            req.setmethod('GET');
            req.setEndpoint('http://www.yahoo.com');
            HTTP ht = new http();
            httpresponse res = ht.send(req);

            this.outmsg += res.getBody();
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + res.getBody().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + Blob.valueOf(res.getBody()).toString().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + Blob.valueOf(res.getBody()).toString().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + res.getBodyAsBlob().toString().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + res.getHeader('hdr').substring(30, 50) + '%\'');      // CWEID 943
            for(String hdrkey: res.getheaderkeys()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hdrkey + '%\'');      // CWEID 943
            }
        } else if(origurl.contains('wazz4')) {
            httprequest req = new httprequest();
            req.setmethod('GET');
            req.setEndpoint('http://www.whatever.com' + origurl.substring(30));     // CWEID 918
            HTTP ht = new http();
            httpresponse res = ht.send(req);

            this.outmsg += res.getBody();
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + res.getBody().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + Blob.valueOf(res.getBody()).toString().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + Blob.valueOf(res.getBody()).toString().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + res.getBodyAsBlob().toString().substring(30, 50) + '%\'');      // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + res.getHeader('hdr').substring(30, 50) + '%\'');      // CWEID 943
            for(String hdrkey: res.getheaderkeys()) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hdrkey + '%\'');      // CWEID 943
            }
        }

        this.outmsg = 'onstart going';


    }

    public void dochanges() {
    	this.goodcontact = (Contact) [SELECT id, firstname, lastname from contact].get(0);
        this.goodcontact.addError('this is an error <b>two</b>', false);
        String badfoo = 'this is bad';
        badfoo += this.badfield.trim();
        List<String> badlist1 = new List<String>{ 'bad1', 'badfoo' };
        List<String> badlist2 = new List<String>{ 'bad1', badfield };
        List<String> badlist3 = new List<String>();
        List<String> badlist4 = new List<String>(badlist1);
        List<String> badlist5 = new List<String>();
        badlist5.addAll(BADLIST2);
        List<String> badlist6 = new List<String>{'good', 'good' };
        badlist6.set(1, badfield);

        List<String> goodlist1 = new List<String>{'good', 'good' };
        List<String> goodlist2 = new List<String>{'good', goodfield };
        List<String> goodlist3 = new List<String>();
        goodlist3.add('good');
        goodlist3.add(goodfield);
        badlist3.add('this is badlist3');
        badlist3.add(badfoo);

        this.goodcontact.addError('this is an error too: ' + badlist1.get(1));          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badlist2.get(1));          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badlist3.get(1));          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badlist4.get(1));          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badlist5.get(1));          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badlist6.get(1));          // CWEID 80

        this.goodcontact.addError('this is an error too: ' + goodlist1.get(1));
        this.goodcontact.addError('this is an error too: ' + goodlist2.get(1));
        this.goodcontact.addError('this is an error too: ' + goodlist3.get(1));

        this.goodcontact.addError('this is an error too: ' + badfield, false);          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badfield);
        this.goodcontact.addError('this is an error tox: ' + ESAPI.encoder().SFDC_HTMLENCODE(badfield), false);
        this.goodcontact.addError('this is an error tox: ' + ESAPI.encoder().SFDC_JSENCODE(badfield), false);
        this.goodcontact.addError('this is an error tox: ' + ESAPI.encoder().SFDC_JSINHTMLENCODE(badfield), false);
        this.goodcontact.addError('this is an error too: ' + badfield.escapeHTML4(), false);    // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badfield.escapeHTML3(), false);    // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badfield, true);

        sfdcencoder enc = ESAPI.encoder();
        this.goodcontact.addError('this is an error too: ' + badfoo, false);          // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badfoo);
        this.goodcontact.addError('this is an error too: ' + badfoo.escapeHTML4(), false);      // CWEID 80
        this.goodcontact.addError('this is an error too: ' + badfoo.escapeHTML3(), false);      // CWEID 80
        this.goodcontact.addError('this is an error too: ' + enc.sfdc_htmlencode(badfoo.escapehtml3()), false);
        this.goodcontact.addError('this is an error too: ' + enc.sfdc_jsencode(badfoo), false);
        this.goodcontact.addError('this is an error too: ' + enc.sfdc_jsinhtmlencode(badfoo), false);
        this.goodcontact.addError('this is an error too: ' + badfoo, true);

        this.goodcontact.addError('this is an error too: ' + goodfield, false);
        this.goodcontact.addError('this is an error too: ' + goodfield, true);

        for(String s: badlist1) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badlist2) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badlist3) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badlist4) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badlist5) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badlist6) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: goodlist1) {
            this.goodcontact.addError('this is an error too: ' + s, false);
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: goodlist2) {
            this.goodcontact.addError('this is an error too: ' + s, false);
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: goodlist3) {
            this.goodcontact.addError('this is an error too: ' + s, false);
            this.goodcontact.addError('this is an error too: ' + s, true);
        }

        Set<String> badset1 = new Set<String>(new List<String>{'bad', baDFIELD});
        Set<String> badset2 = new Set<String>(badlist1);
        Set<String> badset3 = new Set<String>();
        badset3.add('bad');
        badset3.add(badfield);
        Set<String> badset4 = new Set<String>();
        badset4.addAll(badlist1);
        Set<String> badset5 = new Set<String>();
        badset4.addAll(badset1);
        
        Set<String> goodset1 = new Set<String>(new List<String>{'good', 'good2'});
        Set<String> goodset2 = new Set<String>(goodlist2);
        Set<String> goodset3 = new Set<String>();
        goodset3.add('good');
        goodset3.add(this.goodfield);
        goodset3.addAll(goodlist3);

        for(String s: badset1) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.base64Decode(s), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertFromHex(s).toString(), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertToHex(Blob.valueOf(s)), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlDecode(s, 'UTF-8'), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlEncode(s, 'UTF-8'), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badset2) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.base64Decode(s), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertFromHex(s).toString(), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertToHex(Blob.valueOf(s)), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlDecode(s, 'UTF-8'), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlEncode(s, 'UTF-8'), false);         // CWEID 80

            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badset3) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.base64Decode(s), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertFromHex(s).toString(), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertToHex(Blob.valueOf(s)), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlDecode(s, 'UTF-8'), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlEncode(s, 'UTF-8'), false);         // CWEID 80

            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badset4) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.base64Decode(s), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertFromHex(s).toString(), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertToHex(Blob.valueOf(s)), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlDecode(s, 'UTF-8'), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlEncode(s, 'UTF-8'), false);         // CWEID 80

            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: badset5) {
            this.goodcontact.addError('this is an error too: ' + s, false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.base64Decode(s), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertFromHex(s).toString(), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertToHex(Blob.valueOf(s)), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlDecode(s, 'UTF-8'), false);         // CWEID 80
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlEncode(s, 'UTF-8'), false);         // CWEID 80

            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: goodset1) {
            this.goodcontact.addError('this is an error too: ' + s, false); 
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.base64Decode(s), false);
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertFromHex(s).toString(), false);
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.convertToHex(Blob.valueOf(s)), false);
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlDecode(s, 'UTF-8'), false);
            this.goodcontact.addError('this is an error too: ' + EncodingUtil.urlEncode(s, 'UTF-8'), false);

            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: goodset2) {
            this.goodcontact.addError('this is an error too: ' + s, false);
            this.goodcontact.addError('this is an error too: ' + s, true);
        }
        for(String s: goodset3) {
            this.goodcontact.addError('this is an error too: ' + s, false);
            this.goodcontact.addError('this is an error too: ' + s, true);
        }


        PageReference thispage = ApexPages.currentPage();
        if(thispage.getParameters().containsKey('foo') && thispage.getParameters().get('foo').contains('bar')) {
            String fx = thispage.getParameters().get('redir');
            network.forwardToAuthPage(fx);          // CWEID 601
        }
        Object obj = thispage;
        PageReference anotherpage = (PageReference)thispage;
        if(anotherpage.getParameters().containsKey('foo') && anotherpage.getParameters().get('foo').contains('bar')) {
            String fx = anotherpage.getParameters().get('redir');
            network.forwardToAuthPage(fx);          // CWEID 601
        }

        update this.goodcontact;
    }

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
        } else if(foo.contains('foo3')) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bar.get(0) + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(bar.get(0)) + '%\'');
        } else if(foo.contains('foo4')) {
            for(String s: bar) {
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + s + '%\'');        // CWEID 943
                objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(s) + '%\'');
            }
        }
        return 'ok';
    }

}
