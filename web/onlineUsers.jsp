<%@page import="java.util.HashSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online users</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
        
        <%
                session = request.getSession(false);
                
                if(session.getAttribute("token")== null)
                {
                    response.sendRedirect("index.html");
                }               
          %>  
        <style>
                body {
                    background-color: red; 
                    background-image: radial-gradient(white, #8FA1D7);
                    background-repeat: no-repeat;
                    min-height: 100vh;
                }    
            </style>
    </head>
    <body>
           <%
                        ServletContext ctx = getServletContext();  
                       // int totalUserCount=(Integer)ctx.getAttribute("totalusers");  
                       // int currentUserCount=(Integer)ctx.getAttribute("currentusers");
                        List employeeList = (LinkedList)ctx.getAttribute("employeeData"); 
                        
                       int currentUserCount = ((HashSet)ctx.getAttribute("currentusers")).size(); 
                       int totalUserCount = ((HashSet)ctx.getAttribute("totalusers")).size(); 
                       
        %>
        <br>
        
        <div class="container" >
    <div class="jumbotron ">
        <h1>Online Users</h1>
        <p>Current Time is : <%= new Date() %><br>
            There have been <b class="text-primary"><%= totalUserCount %> visits till now</b><br>
            There are total of <b class="text-success"><%= currentUserCount %> online users</b></p>
    </div>
   </div>
      
    <div class="container">       
    <table class="table table-dark table-bordered table-hover ">
      <thead class=" ">
        <tr class="bg-success">
      <th scope="col">Sl. No.</th>    
      <th scope="col">Name</th>
      <th scope="col">Token No.</th>
    </tr>
  </thead>
  <tbody>
    <% int count=0;
       for(Object emp : employeeList) {          
          count++;
          if(emp instanceof String[]) {                                 
            String[] empData = (String[]) emp;      
      %>
    <tr>     
      <td><%= count %></td>
      <td><%= empData[0] %></td>
      <td><%= empData[1] %></td>
    </tr>    
    <% 

                }
            }
    %>
  </tbody>
</table>
  </div>
  
          
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <br>
    <center>
    <a class="btn btn-warning btn-outline-dark" href="menu.jsp" role="button">Back to AMS</a>
    </center>
    </body>
</html>
