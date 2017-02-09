<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="java.io.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
      %>
<%  
			String CONNECTION_URL="jdbc:mysql://localhost:3306/localview";
			String USERNAME="root";  
			String PASSWORD="form";  
			java.sql.Connection con=null;
			ResultSet rs=null;
			PreparedStatement ps = null;
			PreparedStatement ps1 = null;
			String fname=request.getParameter("fname"); 
			String lname=request.getParameter("lname"); 
			String uname=request.getParameter("uname"); 
			String pword=request.getParameter("pword"); 
			String cpword=request.getParameter("cpword"); 
			String role=request.getParameter("parameters");
			System.out.println(""+fname);
			System.out.println(""+lname);
			System.out.println(""+uname);
			System.out.println(""+pword);
			System.out.println(""+role);
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
				Statement st= con.createStatement();
				String query="insert into register(firstname,lastname,usernam,password,confirmpass,role)values('" + fname + "','" + lname + "','" + uname + "','" + pword + "','" + cpword + "','" + role + "')";
				String query1="insert into login(username,password,role)values('" + uname + "','" + pword + "','" + role + "')";
				ps1 = con.prepareStatement(query1);
				ps1.executeUpdate();
				System.out.println("query " + query);
				ps = con.prepareStatement(query);
				ps.executeUpdate();
				
			
			  			out.write("<script type='text/javascript'>\n");
			  			out.write("alert(' Registered Successfully');\n");
			  			out.write("setTimeout(function(){window.location.href='/viewpos/login'},100);");
			  			out.write("</script>\n");	
			  				
			}catch(Exception exp)
					{
						 System.out.println("Exception ="+exp);
					}
	  
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

</head>
<body>
	
</body>
</html>