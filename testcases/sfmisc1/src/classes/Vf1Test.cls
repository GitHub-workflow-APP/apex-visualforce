public class Vf1Test {
	public String bad1 { get; set; }
	public String bad3 { get; set; }
	
	public String valB { get; set; }
	public String basic { get; set; }
	
	public String good1 { get; private set; }
    public String good2 { get; private set; }
    public String good3 { get; private set; }
	
	public Vf1Test() {
		bad1 = 'this is bad1';
		bad3 = 'this is bad3';
		good1 = 'this is good1';
        good2 = 'this is good2';
        good3 = 'this is good3';
		valB = 'this is valB 2';
	}
    public String getvalA() {
        return 'This is vala.';
    }

    public String getinputa() {
    	return 'here is a field<b>hello</b>';
    }
    public PageReference save() {
    	System.debug('---- saved ----');
    	this.valB = 'woo' + bad1;
    	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'hello' + bad1));
    	return null;
    }
    public void badSearch() {
    	String query = 'select id, price__c, name from book__c where name like \'%' + bad1 + '%\'';
    	List<sObject> objs = database.query(query);			// CWEID 943
    	basic = 'XXX' + objs.get(0).get('name');
    }
    public void badSearch2() {
    	String query = 'select id, price__c, name from book__c where name like \'';
    	query = query + bad3;
    	query = query + '%\'';
    	List<sObject> objs = database.query(query);			// CWEID 943
    	basic = 'XXX' + objs.get(0).get('name');   	
    }
    public void badSearch3() {
    	String query = 'select id, price__c, name from ' + String.escapeSingleQuotes(bad3) + ' where name like \'%es%\'';
    	List<sObject> objs = database.query(query);			// CWEID 943
    	basic = 'XXX' + objs.get(0).get('name');   	
    }
    public void goodSearch() {
    	String likestr = '%' + bad1 + '%';
    	List<sObject> objs = [SELECT id, price__c, name from book__c where name like :likestr];
    	basic = 'good' + objs.get(0).get('name');
    }
        public void goodSearch2() {
    	String query = 'select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(bad1) + '%\'';
    	List<sObject> objs = database.query(query);
    	basic = 'XXX' + objs.get(0).get('name');
    }
    public void goodSearch3() {
    	String query = 'select id, price__c, name from book__c where name like \'';
    	query = query + String.escapeSingleQuotes(bad3);
    	query = query + '%\'';
    	List<sObject> objs = database.query(query);
    	basic = 'XXX' + objs.get(0).get('name');   	
    }

    public void weirdQueries() {
        Database.QueryLocator loc1 = database.getQueryLocator('SELECT id, price__c, name from book__c where name like \'%' + bad1 + '%\'');            // CWEID 943
        Database.QueryLocator loc2 = database.getQueryLocator('SELECT id, price__c, name from book__c where name like \'%' + bad1.center(50) + '%\'');            // CWEID 943
        Database.QueryLocator loc3 = database.getQueryLocator('SELECT id, price__c, name from book__c where name like \'%' + bad1.left(50) + '%\'');            // CWEID 943
        Database.QueryLocator loc4 = database.getQueryLocator('SELECT id, price__c, name from book__c where name like \'%' + bad1.right(50) + '%\'');            // CWEID 943
        Database.QueryLocator loc5 = database.getQueryLocator('SELECT id, price__c, name from book__c where name like \'%' + bad1.leftPad(50) + '%\'');            // CWEID 943

        Integer count1 = database.countQuery('SELECT id, price__c, name from book__c where name like \'%' + bad1 + '%\'');            // CWEID 943
        Integer count2 = database.countQuery('SELECT id, price__c, name from book__c where name like \'%' + bad1.center(50) + '%\'');            // CWEID 943
        Integer count3 = database.countQuery('SELECT id, price__c, name from book__c where name like \'%' + bad1.left(50) + '%\'');            // CWEID 943
        Integer count4 = database.countQuery('SELECT id, price__c, name from book__c where name like \'%' + bad1.right(50) + '%\'');            // CWEID 943
        Integer count5 = database.countQuery('SELECT id, price__c, name from book__c where name like \'%' + bad1.leftPad(50) + '%\'');            // CWEID 943

        Database.QueryLocator loc6 = Database.getQueryLocator([SELECT Name FROM Book__c]);
        Database.QueryLocatorIterator it = loc6.iterator();
        basic = 'weird: done';
        while(it.hasNext()) {
            Book__c b = (Book__c)it.next();
            basic = 'weird: found it: ' + b.name;
        }
    }

    public void stringDataflow() {
    	List<SOBJECt> objs;
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1 + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.abbreviate(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.abbreviate(20,5) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.capitalize() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.center(50) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.center(50, bad1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.deletewhitespace() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.difference(good1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.difference(bad1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeCsv() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeECMAScript() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeHTML3() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeHTML4() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeJava() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeUnicode() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.escapeXml() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.fromCharArray(bad1.getChars()) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.left(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.leftPad(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.leftPad(20, bad3) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.leftPad(20, 'foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.mid(20, 20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.normalizeSpace() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.remove('foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.removeEnd('foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.removeEndignorecase('foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.removeStart('foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.removeStartignorecase('foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.repeat(1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.repeat(bad3, 1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.repeat(bad3, 1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.replace('x', BAD1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.replace('x', good1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.replaceAll('x', good1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.replacefirst('x', good1) + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.reverse() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.right(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.rightPad(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.rightPad(20, bad3) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.rightPad(20, 'foo') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.split(' ')[0] + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.split(' ', 5)[0] + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.splitByCharacterType().get(0) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.splitByCharacterTypeCamelCase().get(0) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.stripHtmlTags() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substring(2) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substring(2, 20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substringAFTER('x') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substringAFTERlast('y') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substringBefore('x') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substringBeforelast('y') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substringBetween('x') + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad1.substringBetween('y', 'x') + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.swapCase() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.toLowerCase() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.toLowerCase('en') + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.toUPPERCase() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.toUPPERCase('en') + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.swapCase().trim() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.swapCase().trim().uncapitalize() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.swapCase().trim().uncapitalize().unescapeCsv() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.unescapeEcmaScript() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.unescapeHTML3() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.unescapeHTML4().unescapeJava() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.unescapeHTML4().unescapeUnicode() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + BAD3.unescapeXml().unescapeUnicode() + '%\'');         // CWEID 943
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + STRING.VALUEOF(bad3) + '%\'');         // CWEID 943
        
        List<String> goodstrings = new List<String> { 'goodA', 'goodB' };
        List<String> badstrings = new List<String> { 'goodC', bad1 };
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.join(goodstrings, bad1) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.join(badstrings, bad1) + '%\'');         // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.escapeSingleQuotes(bad1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.center(50) + '%\'');
        objs = datABASE.quEry('select id, price__c, name from book__c where name like \'%' + good1.difference(good2) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.join(goodstrings, good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.repeat('ffff', 1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + GOOD2.replace('x', good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + GOOD2.replaceAll('x', good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + GOOD2.replaceFirst('x', good1) + '%\'');

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1 + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.abbreviate(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.abbreviate(20,5) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.capitalize() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.center(50) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.center(50, good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.deletewhitespace() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.difference(good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.difference(good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeCsv() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeECMAScript() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeHTML3() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeHTML4() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeJava() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeUnicode() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.escapeXml() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + String.fromCharArray(good1.getChars()) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.left(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.leftPad(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.leftPad(20, good3) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.leftPad(20, 'foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.mid(20, 20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.normalizeSpace() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.remove('foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.removeEnd('foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.removeEndignorecase('foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.removeStart('foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.removeStartignorecase('foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.repeat(1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.repeat(good3, 1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.repeat(good3, 1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.replace('x', good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good3.replace('x', good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good3.replaceAll('x', good1) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good3.replacefirst('x', good1) + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.reverse() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.right(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.rightPad(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.rightPad(20, good3) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.rightPad(20, 'foo') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.split(' ')[0] + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.split(' ', 5)[0] + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.splitByCharacterType().get(0) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.splitByCharacterTypeCamelCase().get(0) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.stripHtmlTags() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substring(2) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substring(2, 20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substringAFTER('x') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substringAFTERlast('y') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substringBefore('x') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substringBeforelast('y') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substringBetween('x') + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.substringBetween('y', 'x') + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.swapCase() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.toLowerCase() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.toLowerCase('en') + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.toUPPERCase() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.toUPPERCase('en') + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.swapCase().trim() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.swapCase().trim().uncapitalize() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.swapCase().trim().uncapitalize().unescapeCsv() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.unescapeEcmaScript() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.unescapeHTML3() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.unescapeHTML4().unescapeJava() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.unescapeHTML4().unescapeUnicode() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + good3.unescapeXml().unescapeUnicode() + '%\'');
        objs = DATaBASe.QUery('select id, price__c, name from book__c where name like \'%' + STRING.VALUEOF(good3) + '%\'');
    }

    private String passthrough(String x) {
        return 'foo' + x + 'foo';
    }

    public static String stopit(String instr) {
        if(instr.equalsIgnoreCase('fff')) {
            return 'foo';
        }
        return 'bar';
    }
 
    public void stringDataflow2() {
        basic = 'stringDataflow2 starting';
        String bad4 = 'foo' + passthrough(bad1);
        String bad5 = 'foo' + VF1Utils.passthis(bad1);

        String good4 = 'foo' + passthrough(good1);
        String good5 = 'foo' + stopit(bad1);
        String good6 = 'foo' + VF1Utils.passthis(good1);
        String good7 = 'foo' + VF1Utils.stopthis(bad1);
    	List<SOBJECt> objs;

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad4 + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad4.abbreviate(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad4.abbreviate(20,5) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad4.capitalize() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad4.center(50) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.center(50, bad4) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad4.deletewhitespace() + '%\'');         // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad5 + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad5.abbreviate(20) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad5.abbreviate(20,5) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad5.capitalize() + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad5.center(50) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good1.center(50, bad5) + '%\'');         // CWEID 943
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + bad5.deletewhitespace() + '%\'');         // CWEID 943

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good4 + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good4.abbreviate(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good4.abbreviate(20,5) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good4.capitalize() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good4.center(50) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good4.center(50, good4) + '%\'');

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good5 + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good5.abbreviate(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good5.abbreviate(20,5) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good5.capitalize() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good5.center(50) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good5.center(50, good5) + '%\'');


        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good6 + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good6.abbreviate(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good6.abbreviate(20,5) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good6.capitalize() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good6.center(50) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good6.center(50, good6) + '%\'');

        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good7 + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good7.abbreviate(20) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good7.abbreviate(20,5) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good7.capitalize() + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good7.center(50) + '%\'');
        objs = DATabase.QUery('select id, price__c, name from book__c where name like \'%' + good7.center(50, good7) + '%\'');

        basic = 'stringDataflow2 OK';
    }
}
