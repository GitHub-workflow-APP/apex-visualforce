public class HelloWorld {
    public static void applyDiscount(Book__c[] books) {
        for(Book__c b: books) {
            b.Price__c *= 0.9;
        }
    }
    public static void applyDiscount(Book__c book) {
        book.Price__c *= 0.9;
    }
}