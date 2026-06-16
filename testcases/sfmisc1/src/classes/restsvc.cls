@RestResource(urlMapping='/restep/*')
global with sharing class restsvc {
    @HttpGet
    global static String doGet() {
        RestRequest badreq = RestContext.request;

        List<sobject> objs;

        Map<String, String> badhdrs = badreq.headers;
        for(String hname: badhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: badhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> badparams = badreq.params;
        for(String pname: badparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: badparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requesturi.substring(30) + '%\'');     // CWEID 943


        RestRequest goodreq = new RestRequest();

        Map<String, String> goodhdrs = goodreq.headers;
        for(String hname: goodhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: goodhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> goodparams = goodreq.params;
        for(String pname: goodparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: goodparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requesturi.substring(30) + '%\'');     // CWEID 943

        return 'hey';
    }
    @HttpPatch
    global static String dopatch() {
        RestRequest badreq = RestContext.request;

        List<sobject> objs;

        Map<String, String> badhdrs = badreq.headers;
        for(String hname: badhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: badhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> badparams = badreq.params;
        for(String pname: badparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: badparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requesturi.substring(30) + '%\'');     // CWEID 943


        RestRequest goodreq = new RestRequest();

        Map<String, String> goodhdrs = goodreq.headers;
        for(String hname: goodhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: goodhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> goodparams = goodreq.params;
        for(String pname: goodparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: goodparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requesturi.substring(30) + '%\'');     // CWEID 943

        return 'hey';
    }
    @HttpDelete
    global static String dodel() {
        RestRequest badreq = RestContext.request;

        List<sobject> objs;

        Map<String, String> badhdrs = badreq.headers;
        for(String hname: badhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: badhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> badparams = badreq.params;
        for(String pname: badparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: badparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requesturi.substring(30) + '%\'');     // CWEID 943


        RestRequest goodreq = new RestRequest();

        Map<String, String> goodhdrs = goodreq.headers;
        for(String hname: goodhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: goodhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> goodparams = goodreq.params;
        for(String pname: goodparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: goodparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requesturi.substring(30) + '%\'');     // CWEID 943

        return 'hey';
    }
    @HttpPut
    global static String doput() {
        RestRequest badreq = RestContext.request;

        List<sobject> objs;

        Map<String, String> badhdrs = badreq.headers;
        for(String hname: badhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: badhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> badparams = badreq.params;
        for(String pname: badparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: badparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requesturi.substring(30) + '%\'');     // CWEID 943


        RestRequest goodreq = new RestRequest();

        Map<String, String> goodhdrs = goodreq.headers;
        for(String hname: goodhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: goodhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> goodparams = goodreq.params;
        for(String pname: goodparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: goodparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requesturi.substring(30) + '%\'');     // CWEID 943

        return 'hey';
    }

    @HttpPost
    global static String doput(String foo, Book__c bar) {
        RestRequest badreq = RestContext.request;

        List<sobject> objs;

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + foo + '%\'');        // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(foo) + '%\'');

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bar.name + '%\'');        // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(bar.name) + '%\'');

        Map<String, String> badhdrs = badreq.headers;
        for(String hname: badhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: badhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> badparams = badreq.params;
        for(String pname: badparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: badparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(badparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + badreq.requesturi.substring(30) + '%\'');     // CWEID 943


        RestRequest goodreq = new RestRequest();

        Map<String, String> goodhdrs = goodreq.headers;
        for(String hname: goodhdrs.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hname) + '%\'');
        }
        for(String hvalue: goodhdrs.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + hvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(hvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodhdrs.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodhdrs.get('Headname') + '%\'');     // CWEID 943

        Map<String, String> goodparams = goodreq.params;
        for(String pname: goodparams.keySet()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pname + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pname) + '%\'');
        }
        for(String pvalue: goodparams.values()) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + pvalue + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(pvalue) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(goodparams.get('Headname')) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodparams.get('Headname') + '%\'');     // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requestBody.toString().substring(30) + '%\'');     // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + goodreq.requesturi.substring(30) + '%\'');     // CWEID 943

        return 'hey';
    }

/*
        - @HttpDelete
            - @HttpGet
                - @HttpPatch
                    - @HttpPost
                        - @HttpPut

*/
    
}
