trigger HelloWorldTrigger on Book__c (before insert) {

   Book__c[] books = Trigger.new;

   HelloWorld.applyDiscount(books);
}