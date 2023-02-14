package model;

public class ResultSearch {
    private String emailOrPhone, fullName, matchRate;

    public ResultSearch(String emailOrPhone, String firstName,String lastName, String matchRate) {
        this.emailOrPhone = emailOrPhone;
        this.fullName = lastName+" "+firstName;
        this.matchRate = matchRate;
    }

    public String getEmailOrPhone() {
        return emailOrPhone;
    }

    public String getFullName() {
        return fullName;
    }

    public String getMatchRate() {
        return matchRate;
    }
}
