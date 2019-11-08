import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckLoginEmployee {
    
    Connection cn ;
    
    public String isValidEmployee(String tokenno,String password) throws SQLException {        
        boolean isValid = false;
        String name="", salt="" ,savedPassword, userPassword;
        try {
               cn =  new DBConnection().getConnection();
               if(cn != null){                    
                                      
                    PreparedStatement pst = cn.prepareStatement("Select name,salt,password from practice where tokenno = ?");
                    pst.setString(1, tokenno);
                    try (ResultSet rs = pst.executeQuery()) {
                        if (rs.next()) {  
                            name = rs.getString("name");
                            savedPassword = rs.getString("password");
                            salt = rs.getString("salt");
                            userPassword = BCrypt.hashpw(password,salt);
                            if(userPassword.equals(savedPassword)){
                            isValid = true;
                                }
                            }
                    } catch (Exception e) {
                        e.printStackTrace();      
                    }              
                    cn.close();
               }         
            } catch (Exception e) {
                e.printStackTrace();
            } finally {            
                if(!cn.isClosed()){
                    cn.close();
                }
            }
        return isValid+"###"+name;
        }    
}
