public with sharing class AddAction {
    @InvocableMethod(label='add' description='this is just one method')
    public static List<String> doinvoke(List<TestActionRequest> reqs) {
        TestActionRequest req = reqs.get(0);
        List<sobject> objs;

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + req.name + '%\'');        // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + req.value + '%\'');        // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(req.name) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(req.value) + '%\'');

        return new List<String>();

    }
    
}
