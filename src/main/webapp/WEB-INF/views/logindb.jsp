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
		    String serverlocal = "jdbc:mysql://localhost:3306/";
			String CONNECTION_URL=serverlocal+"usersdb";
			String USERNAME="root";  
			String PASSWORD="form";  
			java.sql.Connection con=null;
			ResultSet rs=null;
			String userid=request.getParameter("uname"); 
			String pwd=request.getParameter("pword"); 
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
				Statement st= con.createStatement();
				rs=st.executeQuery("select password from usersdb.login where username= '"+userid+"'");
				
				if(rs.next()) 
					{ 
						String pass=rs.getString("password");

							if(pass.equals(pwd)) 
								{ 
								    HttpSession session2 = request.getSession();  
							        session2.setAttribute("userid_apos",userid);  
									response.sendRedirect("/viewpos/welcome");
								} 
			  				else 
								{ 
			  				
			  						out.write("<script type='text/javascript'>\n");
			  						out.write("alert(' Invalid Password ');\n");
			  						out.write("setTimeout(function(){window.location.href='/viewpos/login'},100);");
			  						out.write("</script>\n");	
								}
					}
					else
					{
						out.write("<script type='text/javascript'>\n");
			  			out.write("alert(' Invalid Username ');\n");
			  			out.write("setTimeout(function(){window.location.href='/viewpos/login'},100);");
			  			out.write("</script>\n");
					}
				con.close();	
				
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