package dao;

import java.io.InputStream;
import java.sql.*;
import model.Profile;
import model.ResultSearch;
import java.util.*;
import model.TinNhan;

public class UserDAO {
    public static Connection openConnection() {
        /*DBConfig.driver = "com.mysql.jdbc.Driver";
        DBConfig.url = "jdbc:mysql://localhost:3306/bmagbook";
        DBConfig.user = "root";
        DBConfig.password = "04072002";*/
        Connection conn=null;
        try {
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, 
                    DBConfig.user, DBConfig.password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
    public static Profile getProfile(String emailOrPhone, String password) {
        Profile profile = null;
        String select = "select * from tbl_profile "
                + "where email_mobile = ? and password = ?";
        try (Connection c = openConnection()){
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, emailOrPhone);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                profile = new Profile(rs.getString("first_name"),
                        rs.getString("last_name"), rs.getString("email_mobile"), rs.getString("password")
                        , rs.getString("birthday"), rs.getString("sex"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return profile;
    }
    
    public static Profile checkLogin(String emailOrPhone, String password) {
        return getProfile(emailOrPhone, password);
    }
    
    public static boolean isDuplicateEmailOrPhone(String emailOrPhone) {
        try (Connection c = openConnection()) {
            String select = "select id from tbl_profile where email_mobile = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, emailOrPhone);
            return ps.executeQuery().next();
        } catch (Exception e) {
        }
        return false;
    }
    public static boolean addNewUser(Profile profile,String university) {
        try (Connection c = openConnection()) {
            String insert = "Insert into tbl_profile Values(null,?,?,?,?,?,?,null,?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, profile.getFirstName());
            ps.setString(2, profile.getLastName());
            ps.setString(3, profile.getEmailOrPhone());
            ps.setString(4, profile.getPassword());
            ps.setString(5, profile.getBirthday());
            ps.setString(6, profile.getSex());
            ps.setString(7, university);
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean deleleHobby(int userID){
        try(Connection c = openConnection()) {
            String drop = "delete from user_hobby where user_id = ?";
            PreparedStatement ps = c.prepareStatement(drop);
            ps.setInt(1, userID);
            ps.executeUpdate();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean updateUser(int userID, Profile profile , String emailOrPhone, String university) {
        try(Connection c = openConnection()) {
            /*String drop = "delete from user_hobby where user_id = ?";
            PreparedStatement ps = c.prepareStatement(drop);
            ps.setInt(1, userID);
            ps.executeUpdate();*/
            
            String checkDuplicate = "select * from  ( select email_mobile from tbl_profile where tbl_profile.email_mobile <> ?) as T where T.email_mobile = ?";
            
            PreparedStatement ps = c.prepareStatement(checkDuplicate);
            ps.setString(1, emailOrPhone);
            ps.setString(2, profile.getEmailOrPhone());
            if (ps.executeQuery().next()) return false;
            
            String update = "update tbl_profile set first_name = ?, last_name = ?"
                    + ", email_mobile = ?, password = ?, birthday = ?, sex = ?, university = ? "
                    + " where email_mobile = ?";
            ps = c.prepareStatement(update);
            ps.setString(1, profile.getFirstName());
            ps.setString(2, profile.getLastName());
            ps.setString(3, profile.getEmailOrPhone());
            ps.setString(4, profile.getPassword());
            ps.setString(5, profile.getBirthday());
            ps.setString(6, profile.getSex());
            ps.setString(7, university);
            ps.setString(8, emailOrPhone);
            ps.executeUpdate();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean addNewHobbies(int userID,String hobby){
        try(Connection c = openConnection()) {
            String insert = "insert into user_hobby values(?,?)";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setInt(1, userID);
            ps.setString(2, hobby);
            ps.executeUpdate();
            return true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static int getUserID(String emailOrPhone) {
        try(Connection c = openConnection()) {
            String select = "select * from tbl_profile where email_mobile = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, emailOrPhone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return -1;
    }
    
    public static boolean createHobbySQL(){
        try(Connection c = openConnection()) {
            String select = "create table hobby_search ( name varchar(20))";
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean dropHobbySQL(){
        try(Connection c = openConnection()) {
            String select = "drop table hobby_search";
            PreparedStatement ps = c.prepareStatement(select);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    public static boolean addTemporaryHobby(String name){
        try(Connection c = openConnection()) {
            String select = "insert into hobby_search values(?)";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, name);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static ArrayList<ResultSearch> searchResult (String sex, String university, String fromAge, String toAge,String emailOrPhone) {
        ArrayList<ResultSearch> resultSearchList = new ArrayList<ResultSearch>();
        try (Connection c = openConnection()) {
            String select = "SELECT tbl_profile.id,tbl_profile.email_mobile, tbl_profile.last_name,tbl_profile.first_name , concat(floor(1.0 *COUNT(*) / (select count(*) from hobby_search) *100),\"%\") as cnt, COUNT(*) as cnt_int \n" +
                            "FROM user_hobby,hobby_search,(\n" +
                            "	SELECT * from tbl_profile \n" +
                            "      WHERE tbl_profile.sex = ? AND university = ? AND email_mobile <> ? \n" +
                            "	   AND SUBSTRING(birthday,char_length(birthday)-3,char_length(birthday)) >= ? \n" +        
                            "      AND SUBSTRING(birthday,char_length(birthday)-3,char_length(birthday)) <= ? \n" +
                            ") as tbl_profile\n" +
                            "WHERE tbl_profile.id = user_hobby.user_id\n" +
                            "AND hobby_search.name = user_hobby.name\n" +
                            "GROUP BY tbl_profile.id\n" +
                            "ORDER BY cnt_int DESC";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, sex);
            ps.setString(2, university);
            ps.setString(3, emailOrPhone);
            ps.setString(4, fromAge);
            ps.setString(5, toAge);
            ResultSet rs =ps.executeQuery();
            while (rs.next()) {
                resultSearchList.add(new ResultSearch(rs.getString("email_mobile"), 
                        rs.getString("first_name"),rs.getString("last_name"), rs.getString("cnt")));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return resultSearchList;
    }
    
    public static byte[] getImageData(String emailOrPhone) {
        String select = "select avatar from tbl_profile "
                + "where email_mobile = ?";
        try (Connection c = openConnection();
                PreparedStatement p = c.prepareStatement(select)){
            p.setString(1, emailOrPhone);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                return rs.getBytes("avatar");
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static byte[] getImageDataAdress(String adress) {
        String select = "select image from adress "
                + "where name_adr = ?";
        try (Connection c = openConnection();
                PreparedStatement p = c.prepareStatement(select)){
            p.setString(1, adress);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                return rs.getBytes("image");
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static byte[] getGalleryData(String emailOrPhone) {
        String select = "select photo from gallery "
                + "where email_mobile = ? limit 1";
        try (Connection c = openConnection();
                PreparedStatement p = c.prepareStatement(select)){
            p.setString(1, emailOrPhone);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                return rs.getBytes("photo");
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public static byte[] getGalleryDataById(int id) {
        String select = "select photo from gallery "
                + "where id = ?";
        try (Connection c = openConnection();
                PreparedStatement p = c.prepareStatement(select)){
            p.setInt(1, id);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                return rs.getBytes("photo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static boolean updateUserAvatar(InputStream inputStream, String emailOrPhone) {
        String update = "update tbl_profile set avatar = ? "
                + "where email_mobile = ?";
        try (Connection c = openConnection();
             PreparedStatement p = c.prepareStatement(update)){
            p.setBlob(1, inputStream);
            p.setString(2, emailOrPhone);
            p.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public static boolean insertGallery(InputStream inputStream, 
            String emailOrPhone) {
        String insert = "insert into gallery values(null,?,?)";
        try (Connection c = openConnection();
            PreparedStatement p = c.prepareStatement(insert)){
            p.setString(1, emailOrPhone);
            p.setBlob(2, inputStream);
            p.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    
    public static boolean addTinNhan(TinNhan tinNhan){
        try ( Connection c = openConnection()) {
            String insert = String.format("insert into tin_nhan\n" +
            "value (\"%s\", \"%s\", \"%s\")", tinNhan.getFrom(), tinNhan.getTo(), tinNhan.getContent());
            PreparedStatement ps = c.prepareStatement(insert);
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static ArrayList<TinNhan> chat(String nguoiGui, String nguoiNhan){
        if (nguoiNhan.equals("Every one") || nguoiNhan.equals("")) {
            try ( Connection c = openConnection()) {            
            String insert = "Select * from tin_nhan\n" +
            "where nguoi_nhan = ? ";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, "Every one");
            ResultSet rs = ps.executeQuery();
            ArrayList<TinNhan> arr = new ArrayList<TinNhan>();
            while(rs.next()){
                String from = rs.getString("nguoi_gui");
                String to = rs.getString("nguoi_nhan");
                String content = rs.getString("noi_dung");
                TinNhan tmp = new TinNhan(from, to, content);
                arr.add(tmp);
            }
            return arr;
        } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        else {
            try ( Connection c = openConnection()) {            
                String insert = String.format("Select * from tin_nhan\n" +
                "where (nguoi_gui = '%s' and nguoi_nhan = '%s') or (nguoi_gui = '%s' and nguoi_nhan = '%s')", nguoiGui, nguoiNhan, nguoiNhan, nguoiGui);
                PreparedStatement ps = c.prepareStatement(insert);
                ResultSet rs = ps.executeQuery();
                ArrayList<TinNhan> arr = new ArrayList<TinNhan>();
                while(rs.next()){
                    String from = rs.getString("nguoi_gui");
                    String to = rs.getString("nguoi_nhan");
                    String content = rs.getString("noi_dung");
                    TinNhan tmp = new TinNhan(from, to, content);
                    arr.add(tmp);
                }
                return arr;
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    public static String getThongBaoLover(){
        try ( Connection c = openConnection()) {
            String insert = String.format("Select * from lover");
            PreparedStatement ps = c.prepareStatement(insert);
            ResultSet rs = ps.executeQuery();
            String res = "";
            while(rs.next()){
                res = rs.getString("boy") + " và " + rs.getString("girl") + " đã bắt đầu một mối quan hệ mới";
            }
            //if(se.contains(res)) return "";
            //se.add(res);
            //UserDAO.deleteThongBaoLover();
            return res;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "";
    }
    public static String thongBaoFollower(String me, String other){        
        try ( Connection c = openConnection()) {            
            String insert = String.format("Select * from follow\n" +
            "where (me = '%s' and other = '%s') or (me = '%s' and other = '%s')", me, other, other, me);
            PreparedStatement ps = c.prepareStatement(insert);
            ResultSet rs = ps.executeQuery();
            int cnt = 0;
            String first = "";
            while(rs.next()){
                cnt++;
                first = rs.getString("me");
            }
            if(cnt == 0) return "";
            if(cnt == 2){
                boolean result2 = UserDAO.addLover(me, other);
                return "<->";
            }
            if(first.equals(me)) return "->";
            return "<-";
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static boolean addFollower(String me, String other){
        //System.out.println("add 3 " + openConnection());
        try ( Connection c = openConnection()) {
            //String select = "select * from tbl_profile where email_mobile = " + emailOrMobile + " and password = " + password;
            String insert = String.format("insert into follow\n" +
                            "values ('%s', '%s')", me, other);
            PreparedStatement ps = c.prepareStatement(insert);
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
       
    public static boolean addLover(String boy, String girl){
        //System.out.println("add 3 " + openConnection());
        try ( Connection c = openConnection()) {
            //String select = "select * from tbl_profile where email_mobile = " + emailOrMobile + " and password = " + password;
            String insert = String.format("insert into lover\n" +
             "values ('%s', '%s')", boy, girl);
            PreparedStatement ps = c.prepareStatement(insert);
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static String getDescription(String adress) {
        String res = "";
        try (Connection c = openConnection()){
            String select = "SELECT * FROM  adress WHERE name_adr =?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, adress);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) res = rs.getString(2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    public static ArrayList<Integer> getGalleryId(String emailOrPhone) {
        ArrayList<Integer> result = new ArrayList<Integer>();
        try (Connection c = openConnection()){
            String select = "select distinct id from gallery where email_mobile = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, emailOrPhone);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result.add(rs.getInt(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public static String getFullNameCrush(String crush){
        String res = "";
        try (Connection c = openConnection()){
            String select = "select * from tbl_profile where email_mobile = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, crush);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                res = rs.getString("last_name")+ " "+rs.getString("first_name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    
    public static String getBirthdayCrush(String crush){
        String res = "";
        try (Connection c = openConnection()){
            String select = "select * from tbl_profile where email_mobile = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, crush);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                res = rs.getString("birthday");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
    
    public static ArrayList<String> getHobbyCrush(String emailOrPhone){
        int crushID = getUserID(emailOrPhone);
        ArrayList<String> hobbyList = new ArrayList<String>();
        try (Connection c = openConnection()){
            String select = "select * from user_hobby where user_id = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setInt(1, crushID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                hobbyList.add(rs.getString("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (String x : hobbyList) {
            System.out.println(x);
        }
        return hobbyList;
    }
    
    public static String getUniversity(String emailOrPhone){
        String res = "";
        try (Connection c = openConnection()){
            String select = "select university from tbl_profile where email_mobile = ?";
            PreparedStatement ps = c.prepareStatement(select);
            ps.setString(1, emailOrPhone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) res = rs.getString("university");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
}

