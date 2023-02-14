package util;

public class Validate {
    public static boolean checkName(String name) {
        return name.matches("[\\p{L}\\s]{2,50}");
    }
    public static boolean checkEmailOrPhone(String emailOrPhone) {
        if (!emailOrPhone.matches("\\w+@\\w+[.]\\w+")) { // email@address.com
            if (!emailOrPhone.matches("\\d{3,11}")) {
                return false;
            }
        }
        return true;
    }
    public static boolean checkPassword(String password) {
        return password.matches("\\w{4,30}");
    }
}
