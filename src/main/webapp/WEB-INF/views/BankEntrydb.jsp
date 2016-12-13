<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import ="javax.servlet.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*" %>
    
    
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
			String CONNECTION_URL="jdbc:mysql://localhost:3306/usersdb";
			String USERNAME="root";  
			String PASSWORD="form";  
			java.sql.Connection con=null;
			ResultSet rs=null;
			PreparedStatement ps = null;
			String entrydate=request.getParameter("entrydate"); 
			String particulars=request.getParameter("particulars"); 
			String chequeno=request.getParameter("chequeno"); 
			String debit=request.getParameter("debit");
			String credit=request.getParameter("credit");
			String balance=request.getParameter("balance");
			
			
			
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance(); 
				con = DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD); 
				Statement st= con.createStatement();
				String query="insert into bankaccount(transdate,particular,chequeno,debit,credit,balance)values('" + entrydate + "','" + particulars + "','" + chequeno + "','" + debit + "','" + credit + "','" + balance + "')";
				System.out.println("query " + query);
				ps = con.prepareStatement(query);
				ps.executeUpdate();
				
			  			out.write("<script type='text/javascript'>\n");
			  			out.write("alert(' Transaction updated Successfully');\n");
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