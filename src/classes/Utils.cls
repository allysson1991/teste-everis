public class Utils {

    public static Boolean ValidaCNPJ(String accountNumber) {
        if (String.isNotEmpty(accountNumber)) return true;
        return false;

    }

    public static Boolean ValidaCPF(String accountNumber) {
        if (String.isNotEmpty(accountNumber)) return true;
        return false;
    }

}