import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class Register extends HttpServlet {

    String firstname;
    String lastname;
    String tokenno;
    String dob;
    String password;
    Boolean isValid;
  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rdObj = null;
        try (PrintWriter out = response.getWriter()) {            
           
            firstname = request.getParameter("firstname");
            lastname = request.getParameter("lastname");
            tokenno = request.getParameter("tokenno");
            dob= request.getParameter("dob");          
            password= request.getParameter("password");              
       
        
           RegisterEmployee employee = new RegisterEmployee();
            isValid = employee.checktokenvalue(tokenno);
            
            if(!isValid) {
                out.write("<center><p id='errMsg' style='color: red; font-size: larger;'>Someone already has that token number. Try another?</p></center>");
                
                rdObj = request.getRequestDispatcher("/register.html");
                rdObj.include(request, response);
            } else {
                try{
                    employee.save(firstname,lastname,tokenno,dob,password);
                    out.write("saved successfully...thanks for your information!!!");
                    HttpSession session = request.getSession();
                    session.setAttribute("token",tokenno);
                    session.setAttribute("name",firstname+ " "+ lastname);                
                    response.sendRedirect("menu.jsp");
                } catch(Exception e){
                    out.write("<center><p id='errMsg' style='color: red; font-size: larger;'>"+e.getMessage()+"</center>");
                    rdObj = request.getRequestDispatcher("/register.html");
                    rdObj.include(request, response);
                    //response.sendError(600, e.getMessage()); 
                }
            } 
            }catch (Exception e) {
                e.printStackTrace();
                System.out.println("Oops! Some error occured"+ e.getMessage());                       
            }
    }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
