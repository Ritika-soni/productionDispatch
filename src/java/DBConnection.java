import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import java.sql.DriverManager;
//import java.sql.Connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Administrator
 */
public class DBConnection {
    Connection cn;
    
    public DBConnection() {
        cn = null;
    }
    
    public Connection getConnection() {    
       
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@172.18.15.70:1521:kdldb1";
            cn = DriverManager.getConnection(url,"lims", "nmdc494556");
                    
        }
        catch(Exception ex) {
            
        }
        return cn;    
    }
    
}
