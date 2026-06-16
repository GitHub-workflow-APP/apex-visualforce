public with sharing class VF1Utils {
    public static String passthis(String instr) {
        return 'vf1u' + instr;
    }

    public static String stopthis(String instr) {
        if(instr.equalsIgnoreCase('fff')) {
            return 'foo';
        }
        return 'bar';
    }
    
}