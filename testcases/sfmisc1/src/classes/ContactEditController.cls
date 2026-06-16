public with sharing class ContactEditController {
    public Contact contact { get; set; }
    public Contact goodcontact { get; private set; }
    public Contact badcontact { get; private set; }
    public Contact badcontact2 { get; private set; }
    public String outputtxt { get; private set; }

    public String goodtype { get; private set; }
    public String badtype { get; set; }
    
    public ContactEditController() {
    	this.contact = (Contact) [SELECT id, firstname, lastname from contact].get(0);
    	this.goodcontact = (Contact) [SELECT id, firstname, lastname from contact].get(0);
    	this.badcontact = (Contact) [SELECT id, firstname, lastname from contact].get(0);
    	this.badcontact2 = (Contact) [SELECT id, firstname, lastname from contact].get(0);
    	this.outputtxt = 'click to start';
        this.goodtype = 'String';
        this.badtype = 'String';
    }
    public void doSet() {
        this.badcontact2 = this.badcontact;
    }
    public void activate() {
    	this.outputtxt = 'activated: firstname is now ' + this.contact.firstname;

        this.outputtxt += ' ' + search.find('FIND \'' + this.contact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.contact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.contact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.contact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.contact.firstname.substring(100) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.contact.firstname.swapCase() + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943

        this.badcontact = this.contact;

        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact.firstname.substring(100) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact.firstname.swapCase() + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943

        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact2.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact2.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact2.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact2.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact2.firstname.substring(100) + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943
        this.outputtxt += ' ' + search.find('FIND \'' + this.badcontact2.firstname.swapCase() + '\' in all fields returning account(name, id)').get('Account').size();     // CWEID 943

        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get('Account').size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get('Account').size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get('Account').size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get('Account').size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.substring(100) + '\' in all fields returning account(name, id)').get('Account').size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.swapCase() + '\' in all fields returning account(name, id)').get('Account').size();

        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get(this.goodcontact.lastname).size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get(this.goodcontact.lastname).size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get(this.goodcontact.lastname).size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get(this.goodcontact.lastname).size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.substring(100) + '\' in all fields returning account(name, id)').get(this.goodcontact.lastname).size();
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.swapCase() + '\' in all fields returning account(name, id)').get(this.goodcontact.lastname).size();

        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get(this.badcontact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get(this.badcontact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get(this.badcontact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get(this.badcontact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.substring(100) + '\' in all fields returning account(name, id)').get(this.badcontact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.swapCase() + '\' in all fields returning account(name, id)').get(this.badcontact.lastname).size();        // CWEID 472

        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get(this.contact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get(this.contact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get(this.contact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get(this.contact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.substring(100) + '\' in all fields returning account(name, id)').get(this.contact.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.swapCase() + '\' in all fields returning account(name, id)').get(this.contact.lastname).size();        // CWEID 472

        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)').get(this.badcontact2.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.left(20).leftPad(20) + '\' in all fields returning account(name, id)').get(this.badcontact2.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.mid(100, 100) + '\' in all fields returning account(name, id)').get(this.badcontact2.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.replace('x', this.goodcontact.firstname) + '\' in all fields returning account(name, id)').get(this.badcontact2.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.substring(100) + '\' in all fields returning account(name, id)').get(this.badcontact2.lastname).size();        // CWEID 472
        this.outputtxt += ' ' + search.find('FIND \'' + this.goodcontact.firstname.swapCase() + '\' in all fields returning account(name, id)').get(this.badcontact2.lastname).size();        // CWEID 472

 	
    }
    public void suggest() {
    	this.outputtxt = 'suggest: firstname is now ' + this.contact.firstname;

        this.outputtxt += ' ' + search.suggest('FIND \'' + this.contact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.contact.firstname.substring(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.contact.firstname.substringAfter('x') + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.contact.firstname.touppercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.contact.firstname.tolowercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.contact.firstname.tolowercase().trim() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943

        this.badcontact = this.contact;

        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact.firstname.substring(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact.firstname.substringAfter('x') + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact.firstname.touppercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact.firstname.tolowercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact.firstname.tolowercase().trim() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943

        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact2.firstname.abbreviate(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact2.firstname.substring(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact2.firstname.substringAfter('x') + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact2.firstname.touppercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact2.firstname.tolowercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.badcontact2.firstname.tolowercase().trim() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();     // CWEID 943


        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.substring(20) + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.substringAfter('x') + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.touppercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.tolowercase() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.tolowercase().trim() + '\' in all fields returning account(name, id)', 'Account', new Search.SuggestionOption()).getSuggestionResults().size();


        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)', this.goodcontact.lastname, new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.substring(20) + '\' in all fields returning account(name, id)', this.goodcontact.lastname, new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.substringAfter('x') + '\' in all fields returning account(name, id)', this.goodcontact.lastname, new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.touppercase() + '\' in all fields returning account(name, id)', this.goodcontact.lastname, new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.tolowercase() + '\' in all fields returning account(name, id)', this.goodcontact.lastname, new Search.SuggestionOption()).getSuggestionResults().size();
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.tolowercase().trim() + '\' in all fields returning account(name, id)', this.goodcontact.lastname, new Search.SuggestionOption()).getSuggestionResults().size();

        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.abbreviate(20) + '\' in all fields returning account(name, id)', this.badcontact.firstname, new Search.SuggestionOption()).getSuggestionResults().size();    // CWEID 472
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.substring(20) + '\' in all fields returning account(name, id)', this.badcontact.firstname, new Search.SuggestionOption()).getSuggestionResults().size();    // CWEID 472
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.substringAfter('x') + '\' in all fields returning account(name, id)', this.badcontact.firstname, new Search.SuggestionOption()).getSuggestionResults().size();    // CWEID 472
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.touppercase() + '\' in all fields returning account(name, id)', this.badcontact.firstname, new Search.SuggestionOption()).getSuggestionResults().size();    // CWEID 472
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.tolowercase() + '\' in all fields returning account(name, id)', this.badcontact.firstname, new Search.SuggestionOption()).getSuggestionResults().size();    // CWEID 472
        this.outputtxt += ' ' + search.suggest('FIND \'' + this.goodcontact.firstname.tolowercase().trim() + '\' in all fields returning account(name, id)', this.badcontact.firstname, new Search.SuggestionOption()).getSuggestionResults().size();    // CWEID 472

    }

    public void typestuff() {
        Object o = Type.forName('String').newInstance();
        this.outputtxt = 'typestuff: ' + o;

        Object o2 = Type.forName(goodtype).newInstance();
        this.outputtxt += ' ' + o2;

        Object o3 = Type.forName(badtype).newInstance();    // CWEID 99
        this.outputtxt += ' ' + o3;

        Object o4 = Type.forName(goodtype, badtype).newInstance();    // CWEID 99
        this.outputtxt += ' ' + o4;

        Object o5 = Type.forName(goodtype, goodtype).newInstance();
        this.outputtxt += ' ' + o5;

        Object o6 = Type.forName(badtype, goodtype).newInstance();    // CWEID 99
        this.outputtxt += ' ' + o6;
    }

}
