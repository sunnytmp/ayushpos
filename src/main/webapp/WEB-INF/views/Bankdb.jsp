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
			String CONNECTION_URL="jdbc:mysql://localhost:3306/localview";
			String USERNAME="root";  
			String PASSWORD="form";  
			java.sql.Connection con=null;
			ResultSet rs=null;
			PreparedStatement ps = null;
			String bankname=request.getParameter("bankname"); 
			String branch=request.getParameter("branch"); 
			String accno=request.getParameter("accno"); 
			String ifsc=request.getParameter("ifsc"); 
			
			System.out.println(""+bankname);
			System.out.println(""+branch);
			System.out.println(""+accno);
			System.out.println(""+ifsc);
			
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
				Statement st= con.createStatement();
				String query="insert into registerbank(ifsccode,name,branch,accno)values('" + ifsc + "','" + bankname + "','" + branch + "','" + accno + "')";
				System.out.println("query " + query);
				ps = con.prepareStatement(query);
				ps.executeUpdate();
				
			
			  			out.write("<script type='text/javascript'>\n");
			  			out.write("alert(' Registered Bank Successfully');\n");
			  			out.write("setTimeout(function(){window.location.href='/viewpos/welcome'},100);");
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