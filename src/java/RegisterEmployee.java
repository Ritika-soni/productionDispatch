import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

public class RegisterEmployee {
    
    Connection cn ;
    
    public void save(String firstname, String lastname, String tokenno, String dob,String password) throws SQLException {        
        
        try {
                String salt = BCrypt.gensalt(5); //5 rounds
                String generatedSecuredPasswordHash = BCrypt.hashpw(password, salt);
            
               cn =  new DBConnection().getConnection();
               if(cn != null){
                    cn.setAutoCommit(false);
                    Statement st = cn.createStatement();
                    
                    String qry = "insert into practice(name,tokenno,dob,salt,password) values('" + firstname + " " + lastname + "','" + tokenno + "',to_date('" + dob  + "','yyyy-mm-dd'),'" + salt+"','"+generatedSecuredPasswordHash + "')";
                    ResultSet cnt = (ResultSet)st.executeQuery(qry);                   
                    cn.commit();
                    cn.close();
               }         
            } finally {            
            if(!cn.isClosed()){
                cn.close();
            }
        }
    }
    public boolean checktokenvalue(String tokenno) throws SQLException {        
        boolean isValid = false;
        try {
               cn =  new DBConnection().getConnection();
               if(cn != null){                    
                    Statement st = cn.createStatement();                   
                    PreparedStatement pst = cn.prepareStatement("Select * from practice where tokenno = ?");
                    pst.setString(1, tokenno);                    
                    try (ResultSet rs = pst.executeQuery()) {
                        if (rs.next()) {                            
                            isValid = false;
                        } else {
                            isValid = true;
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
        return isValid;
        }  
    
    
}
