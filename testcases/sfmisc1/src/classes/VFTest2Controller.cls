public with sharing class VFTest2Controller {
	public String outval { get; private set; }
    public String bad1 { get; set; }
    public String good1 { get; private set; }
    public String bad2 { get; private set; }

	public VFTest2Controller() {
		this.outval = '(output goes here)';
        this.bad1 = 'bad1';
        this.good1 = 'good1';
        this.bad2 = 'bad2';
	}

    public void setSomething(String n) {
        this.bad2 = n;
    }

    public void runcmd1() {
        List<List<sobject>> res = search.query('FIND \'Oil\' in all fields returning account(name, id)');
        this.outval = 'running query: ';
        if(res.size() > 0) {
        	List<sobject> accounts = res.get(0);
        	if(accounts.size() > 0) {
        		Account acct = (Account)accounts.get(0);
        		this.outval += acct.name;
        	}
        }
        
        if(bad1.contains('Oil')) {
       		List<List<sobject>> res1 = search.query('FIND \'' + bad1 + '\' in all fields returning account(name, id)');     // CWEID 943
       		this.outval += ' // res1: ' + res1.size(); 	

       		List<List<sobject>> res2 = search.query('FIND \'' + good1 + '\' in all fields returning account(name, id)');
       		this.outval += ' // res2: ' + res2.size(); 	
        } else if(bad1.contains('Oi')) {
       		this.outval += ' ' + search.query('FIND \'' + bad1.abbreviate(20) + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad1.abbreviate(20, 5) + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad1.deleteWhitespace() + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad1.swapCase() + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad1.escapeJava() + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad1.repeat(1) + '\' in all fields returning account(name, id)').size();     // CWEID 943

       		this.outval += ' ' + search.query('FIND \'' + good1.abbreviate(20) + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.abbreviate(20, 5) + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.deleteWhitespace() + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.swapCase() + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.escapeJava() + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.repeat(1) + '\' in all fields returning account(name, id)').size();


       		this.outval += ' ' + search.query('FIND \'' + String.escapeSingleQuotes(bad1) + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'%Oi\' in all fields returning account(' + String.escapeSingleQuotes(bad1) + ', id)').size();        // CWEID 943
        }
    }
    public void runcmd2() {
        this.outval = 'runcmd2';
        List<List<sobject>> res = search.query('FIND \'Oil\' in all fields returning account(name, id)');
        this.outval = 'running query: ';
        if(res.size() > 0) {
        	List<sobject> accounts = res.get(0);
        	if(accounts.size() > 0) {
        		Account acct = (Account)accounts.get(0);
        		this.outval += acct.name;
        	}
        }
        
        if(bad2.contains('Oil')) {
       		List<List<sobject>> res1 = search.query('FIND \'' + bad2 + '\' in all fields returning account(name, id)');     // CWEID 943
       		this.outval += ' // res1: ' + res1.size(); 	

       		List<List<sobject>> res2 = search.query('FIND \'' + good1 + '\' in all fields returning account(name, id)');
       		this.outval += ' // res2: ' + res2.size(); 	
        } else if(bad2.contains('Oi')) {
       		this.outval += ' ' + search.query('FIND \'' + bad2.abbreviate(20) + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad2.abbreviate(20, 5) + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad2.deleteWhitespace() + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad2.swapCase() + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad2.escapeJava() + '\' in all fields returning account(name, id)').size();     // CWEID 943
       		this.outval += ' ' + search.query('FIND \'' + bad2.repeat(1) + '\' in all fields returning account(name, id)').size();     // CWEID 943

       		this.outval += ' ' + search.query('FIND \'' + good1.abbreviate(20) + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.abbreviate(20, 5) + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.deleteWhitespace() + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.swapCase() + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.escapeJava() + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'' + good1.repeat(1) + '\' in all fields returning account(name, id)').size();


       		this.outval += ' ' + search.query('FIND \'' + String.escapeSingleQuotes(bad2) + '\' in all fields returning account(name, id)').size();
       		this.outval += ' ' + search.query('FIND \'%Oi\' in all fields returning account(' + String.escapeSingleQuotes(bad2) + ', id)').size();        // CWEID 943
        }
    }
}
