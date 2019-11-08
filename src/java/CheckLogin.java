
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class CheckLogin extends HttpServlet {
    String tokenno;
    String password;
    Boolean isValid;
    String returnedVal;
    String name;
    int totalUserCount;
    int currentUserCount;
    private static final long serialVersionUID = 1L;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            tokenno = request.getParameter("tokenno");        
            password= request.getParameter("password"); 
            
            CheckLoginEmployee checkLogin = new CheckLoginEmployee();
            returnedVal = checkLogin.isValidEmployee(tokenno,password);            
            isValid = Boolean.parseBoolean(returnedVal.split("###")[0]);           
            
            if(isValid) {
                name = returnedVal.split("###")[1];
                HttpSession session = request.getSession();
                ServletContext context = request.getServletContext();
                List empList = (LinkedList)context.getAttribute("employeeData");
                String[] empArr = new String[2];
                empArr[1] = name;
                empArr[0] = tokenno;                
                empList.add(empArr);
                
                Set activeSet = (HashSet)context.getAttribute("currentusers");
                Set totalSet = (HashSet)context.getAttribute("totalusers");
                activeSet.add(session.getId());
                totalSet.add(session.getId());
                // ServletContext ctx=getServletContext();  
                // int totalUserCount=(Integer)context.getAttribute("totalusers");  
              //   int currentUserCount=(Integer)context.getAttribute("currentusers");  
                //int totalUserCount = (int)context.getAttribute("totalusers");
               // context.setAttribute("totalusers", totalUserCount++);
               // int currentUserCount = (int)context.getAttribute("currentusers");
              //  context.setAttribute("currentusers", currentUserCount++);
                context.setAttribute("employeeData", empList);
                session.setAttribute("token",tokenno);
                session.setAttribute("name",name);
                response.sendRedirect("menu.jsp");                
            }else {
                out.write("<center><p id='errMsg' style='color: red; font-size: larger;'>Credentials are incorrect.</p></center>");
                RequestDispatcher rdObj = null;
                rdObj = request.getRequestDispatcher("/index.html");
                rdObj.include(request, response);
            }           
        }catch (Exception e) {
             e.printStackTrace();
            }
        
    }

        
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

       
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        
        @Override
        public String getServletInfo() {
        return "Short description";
        }

    }
