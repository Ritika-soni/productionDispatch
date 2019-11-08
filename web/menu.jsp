 <!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>DAILY PRODUCTION AND DESPATCH DETAILS</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
          <link href="css/style.css" rel="stylesheet" type="text/css"/>
          <%
                session = request.getSession(false);
                
                if(session.getAttribute("token") == null)
                {
                    response.sendRedirect("index.html");
                }
                String name =(String)session.getAttribute("name");
                String token =(String)session.getAttribute("token");
            %> 
            
            <% 
                response.setHeader("Pragma","no-cache");
                response.setHeader("Cache-Control","no-store");
                response.setHeader("Expires","0");
                response.setDateHeader("Expires",-1);
               
             %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
    <div class='container'>
            <div class="row">
                <div class="col-12">
                    <div class="col-3 float-right">
                        <!--<a class="btn btn-danger btn-outline-warning float-right" href="logout" role="button">Logout</a>
                        <label class="badge badge-info badge-pill">Welcome, <%=name%></label>-->
                        <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          Welcome, <%=name%>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item">My token No.:<%=token%></a>  
                            <a class="dropdown-item" href="onlineUsers.jsp">Online Users List</a>
                            <a class="dropdown-item" href="logout">Logout</a>  
                        </div>
                      </div>
                    </div>
                </div>
               
            </div>
        </div>
        <div class="container">
       <center><h1><u><font color="green">DAILY PRODUCTION & DESPATCH DETAILS</font></u></h1></center>
        </div>
       <br>
       <center>
                <a class='btn btn-success' href="productionmenu.html" target="_top">PRODUCTION DETAILS</a> 
       </center>
       <br>
       <center>
                <a class='btn btn-success' href="MINE CP-14.html" target="_top">DESPATCH DETAILS</a>
       </center>
       
        <script   src="https://code.jquery.com/jquery-3.4.1.js"   ></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
