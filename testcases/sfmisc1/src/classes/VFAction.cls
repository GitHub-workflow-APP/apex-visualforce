public with sharing class VFAction {
    @InvocableMethod(label='test invocable method' description='this is just one method')
    public static List<String> doinvoke(List<String> inputs) {
        List<sobject> objs;

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + inputs.get(0) + '%\'');        // CWEID 943
        for(String input: inputs) {
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + input + '%\'');        // CWEID 943
            objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(input) + '%\'');
        }
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(inputs.get(0)) + '%\'');

        return new List<String>();
    }

    
}
