<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retail Management System</title>

<link rel="stylesheet"  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" ></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<style>

a.myButton {
	-moz-box-shadow: 0px 1px 0px 0px #fff6af;
	-webkit-box-shadow: 0px 1px 0px 0px #fff6af;
	box-shadow: 0px 1px 0px 0px #fff6af;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #ffab23));
	background:-moz-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-webkit-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-o-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-ms-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:linear-gradient(to bottom, #ffec64 5%, #ffab23 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#ffab23',GradientType=0);
	background-color:#ffec64;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #ffaa22;
	display:inline-block;
	cursor:pointer;
	color:#333333;
	font-family:Times New Roman;
	font-size:16px;
	font-weight:bold;
	padding:5px 270px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffee66;
}
a.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffec64));
	background:-moz-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-webkit-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-o-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-ms-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:linear-gradient(to bottom, #ffab23 5%, #ffec64 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffec64',GradientType=0);
	background-color:#ffab23;
}
a.myButton:active {
	position:relative;
	top:1px;
}
</style>


<body style="background:url('/viewpos/resources/images/Superma.jpg');">
<script>
function checkSelection() {
   if(document.getElementById("branches").value === "---Please Select A Branch---" ){
	   alert ("Not selected");
	   return false;
   }
}
</script>
<div>
	<div class="row" style="background-color: #d5d5d5;">
		 <div class="col-sm-4"></div>
         <div class="col-sm-2"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#login">LOGIN</button></div>
         <div class="col-sm-2"><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#register">REGISTER</button></div>
         <div class="col-sm-4"></div>
     </div>             
       
       
     <!-- -------------This is modal for login----------------- -->  
     
     
     <div class="modal fade" id="login" role="dialog">
        <div class="modal-dialog">
        <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> Login</h4>
              </div>
               <div class="modal-body">
          		 <form method="POST" action="/viewpos/logindb">
                   		 <div class="form-group">
                        		<label for="username"><span class="glyphicon glyphicon-user"></span> Username</label>
                            	<input type="text" class="form-control" id="uname" name="uname" placeholder="Enter email">
                    	</div>
                 		<div class="form-group">
                    			<label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
                    			<input type="password" class="form-control" id="pword" name="pword" placeholder="Enter password">
                		</div>
                			<div class="form-group">
                			 <label for="branchname"><span class="glyphicon glyphicon-branch"></span> Branch Name</label><br>
                		<% ResultSet branches = getBranches(); %>
                		<select name="branches" id="branches">
                		  <option> ---Please Select A Branch---</option>
                		 <% while (branches.next()) { %>
        					<option><% out.print(branches.getString("branchname"));} %></option>
   						</select>
						</div>
                		<div class="checkbox">
                     			<label><input type="checkbox" value="" checked>Remember me</label>
                		</div>
             		<input type="submit" value="Login" onclick="return checkSelection()" class="btn btn-default btn-success btn-block"/>
             				<div class="modal-footer">
          						<button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal">	
          						<span class="glyphicon glyphicon-remove"></span> Cancel</button>
          					
          				</div>
          		</form>
        	</div>
      </div>
      </div>
   </div>
   </div>
   
      <!-- -------------This is end of modal for login----------------- -->
      
      <!-- -------------This is modal for register----------------- -->
              
  	 <!--<div class="container">  -->
  	 
    <div class="modal fade" id="register" role="dialog">
        <div class="modal-dialog">
        <div class="modal-content">
               <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 style="color:red;"><span class="glyphicon glyphicon-lock"></span> REGISTER </h4>
               </div>
                <div class="modal-body">
                <%  if (request.getSession().getAttribute("userid_apos") == null) {
          out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");
          return;
    }  %>
                     <form method="POST" action="/viewpos/registerdb">
                            <div class="form-group">
                                	<label for="firstname"><span class="glyphicon glyphicon-user"></span> First Name</label>
                                	<input type="text" class="form-control" name="fname" id="fname" placeholder="First Name">
                            </div>
                            <div class="form-group">
                               		<label for="Lastname"><span class="glyphicon glyphicon-user"></span> Last Name</label>
                                	<input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name">
                            </div>
                            <div class="form-group">
                                	<label for="uname"><span class="glyphicon glyphicon-user"></span>User Name</label>
                                	<input type="text" class="form-control" id="uname" name="uname" placeholder="User Name">
                            </div>
                             <div class="form-group">
                                	<label for="pwd"><span class="glyphicon glyphicon-user"></span>Password</label>
                                	<input type="password" class="form-control" id="pword" name="pword" placeholder="*******">
                            </div>
                             <div class="form-group">
                                	<label for="cpwd"><span class="glyphicon glyphicon-user"></span>Confirm Password</label>
                                	<input type="password" class="form-control" id="cpword" name="cpword" placeholder="*******">
                            </div>
                            
							<div class="form-group dropup">
									<label for="rolelabel"><span class="glyphicon glyphicon-user"></span>Role</label>
									<select name = "parameters">
										<option selected="true" style="display:none;">Select Role</option>
        								<option value = "admin">Administrator</option>
        								<option value = "staff">Sales Staff</option>
    								</select>
                           	</div>
                           	
                           		
                           		
    	<button type="submit" class="btn btn-default btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Register</button>
   </form>                    
             </div>
       	</div>
       	</div>
     </div>	
     
    	 <!-------------------This is end of modal for login------------------------------------->
   		
   </div>
   <%!
   public ResultSet getBranches() {
   String serverlocal = "jdbc:mysql://localhost:3306/";
	String CONNECTION_URL=serverlocal+"usersdb";
	String USERNAME="root";  
	String PASSWORD="form";  
	java.sql.Connection con=null;
	ResultSet rs=null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
		con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
		Statement st= con.createStatement();
		rs=st.executeQuery("select branchname from usersdb.branches");
	}catch(Exception et){
	 	
	}
	return rs;
   }
   %>
</body>
</html>