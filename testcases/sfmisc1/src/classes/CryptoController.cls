public with sharing class CryptoController {
    public String plaintext { get; set; }
    public String output1 { get; private set; }
    public String output2 { get; private set; }
    public String output3 { get; private set; }
    public String output4 { get; private set; }
    public String output5 { get; private set; }
    public String output6 { get; private set; }
    public String output7 { get; private set; }
    public String output8 { get; private set; }
    public String output9 { get; private set; }
    public String output10 { get; private set; }
    private String myk;
    private String myiv;

    public void init() {
        myk = 'password12345678';
        myiv = '0000000000000000';
    }

    public void submit() {
        blob mykblob = Blob.valueof(myk);
        blob ivblob = Crypto.generateAESKey(128);
        blob cipherblob = crypto.encryptwithmanagediv('AES128', mykblob, blob.valueof(plaintext));      // CWEID 321
        this.output1 = EncodingUtil.convertToHex(cipherblob);

        String anotherkey = 'secretpassword00';
        Blob cipher2 = Crypto.encrypt('AES128', Blob.valueOf(anotherkey), ivblob, Blob.valueOf(plaintext));    // CWEID 321

        Blob cipher3 = Crypto.encrypt('AES128', Blob.valueOf('anothersecret999'), ivblob, Blob.valueOf(plaintext));    // CWEID 321

        Blob generatedKey = Crypto.generateAESKey(128);      // This is a safe way to generate a new key.  A key could also be retrieved from an external location; we assume that's safe.
        Blob cipher4 = Crypto.encrypt('AES128', generatedKey, ivblob, Blob.valueOf(plaintext));

        Blob pt1 = crypto.decryptWithManagedIV('AES128', mykblob, cipherblob);        // CWEID 321
        this.output2 = pt1.toString();

        Blob pt2 = crypto.decrypt('AES128', Blob.valueOf(anotherkey), ivblob, cipher2);       // CWEID 321
        this.output3 = pt2.toString();

        Blob pt3 = crypto.decrypt('AES128', Blob.valueOf('anothersecret999'), ivblob, cipher3);       // CWEID 321
        this.output4 = pt3.toString();

        Blob pt4 = crypto.decrypt('AES128', generatedKey, ivblob, cipher4);
        this.output5 = pt4.toString();

        Blob mac1 = Crypto.generatemac('hmacSHA1', cipher2, Blob.valueOf('secret1234567890'));      // CWEID 321
        this.output5 += EncodingUtil.convertToHex(mac1);

        Blob mac2 = Crypto.generatemac('hmacSHA1', cipher2, Blob.valueOf(anotherkey));      // CWEID 321
        this.output5 += ' ' + EncodingUtil.convertToHex(mac2);

        Blob mac3 = Crypto.generatemac('hmacSHA1', cipher2, mykblob);      // CWEID 321
        this.output5 += ' ' + EncodingUtil.convertToHex(mac3);

        Blob mac4 = Crypto.generatemac('hmacSHA1', cipher2, generatedKey);
        this.output5 += ' ' + EncodingUtil.convertToHex(mac4);

        Blob sign1 = Crypto.sign('hmacSHA1', cipher2, Blob.valueOf('secret1234567890'));      // CWEID 321
        this.output5 += EncodingUtil.convertToHex(sign1);

        Blob sign2 = Crypto.sign('hmacSHA1', cipher2, Blob.valueOf(anotherkey));      // CWEID 321
        this.output5 += ' ' + EncodingUtil.convertToHex(sign2);

        Blob sign3 = Crypto.sign('hmacSHA1', cipher2, mykblob);      // CWEID 321
        this.output5 += ' ' + EncodingUtil.convertToHex(sign3);

        Blob sign4 = Crypto.sign('hmacSHA1', cipher2, generatedKey);
        this.output5 += ' ' + EncodingUtil.convertToHex(sign4);

    }
    public void badivs() {
        blob mykblob = Blob.valueof(myk);
        blob ivblob = Crypto.generateAESKey(128);
        blob badiv = Blob.valueOf('0000000000000000');
        blob anotherbadiv = Blob.valueOf(myiv);
        Blob generatedKey = Crypto.generateAESKey(128);

        String anotherkey = 'secretpassword00';
        Blob cipher2 = Crypto.encrypt('AES128', generatedKey, Blob.valueOf('1234567890123456'), Blob.valueOf(plaintext));    // CWEID 329
        Blob cipher3 = Crypto.encrypt('AES128', generatedKey, Blob.valueOf(myiv), Blob.valueOf(plaintext));    // CWEID 329
        Blob cipher4 = Crypto.encrypt('AES128', generatedKey, badiv, Blob.valueOf(plaintext));    // CWEID 329
        Blob cipher5 = Crypto.encrypt('AES128', generatedKey, ivblob, Blob.valueOf(plaintext));

        Blob pt2 = crypto.decrypt('AES128', generatedKey, Blob.valueOf('1234567890123456'), cipher2);       // CWEID 329
        this.output6 = pt2.toString();

        Blob pt3 = crypto.decrypt('AES128', generatedKey, anotherbadiv, cipher3);       // CWEID 329
        this.output7 = pt3.toString();

        Blob pt4 = crypto.decrypt('AES128', generatedKey, badiv, cipher4);      // CWEID 329
        this.output8 = pt4.toString();

        Blob pt5 = crypto.decrypt('AES128', generatedKey, ivblob, cipher5);
        this.output9 = pt5.toString();
    }
}
