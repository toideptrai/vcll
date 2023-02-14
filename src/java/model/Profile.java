package model;


public class Profile {
    private String firstName;
    private String lastName;
    private String emailOrPhone;
    private String password;
    private String birthday;
    private String sex;

    public Profile(String firstName, String lastName, String emailOrPhone, 
            String password, String birthday, String sex) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailOrPhone = emailOrPhone;
        this.password = password;
        this.birthday = birthday;
        this.sex = sex;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailOrPhone() {
        return emailOrPhone;
    }

    public void setEmailOrPhone(String emailOrPhone) {
        this.emailOrPhone = emailOrPhone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
}
