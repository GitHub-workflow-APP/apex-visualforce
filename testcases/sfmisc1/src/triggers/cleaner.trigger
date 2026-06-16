trigger cleaner on Account (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    PageReference thispage = ApexPages.currentPage();
    if(thispage.getParameters().containsKey('foo') && thispage.getParameters().get('foo').contains('bar')) {
        String fx = thispage.getParameters().get('redir');
        network.forwardToAuthPage(fx);          // CWEID 601
        List<sobject> objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + thispage.getParameters().get('foo') + '%\'');        // CWEID 943
    }

   
}
