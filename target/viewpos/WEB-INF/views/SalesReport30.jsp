<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="org.jfree.chart.ChartFactory" %>
<%@ page import="org.jfree.chart.ChartUtilities" %>
<%@ page import="org.jfree.chart.JFreeChart" %>
<%@ page import="org.jfree.data.general.DefaultPieDataset" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
/* Code for the HTTP Servlet that will return the Pie Chart as a PNG image
back to the browser after generating it using JFreeChart API */
        OutputStream outview = response.getOutputStream(); /* Get the output stream from the response object */
        try {
                DefaultPieDataset myServletPieChart = new DefaultPieDataset();
                myServletPieChart.setValue("Maths", 74);
                myServletPieChart.setValue("Physics", 87);
                myServletPieChart.setValue("Chemistry", 62);
                myServletPieChart.setValue("Biology", 92);
                myServletPieChart.setValue("English", 51);        
                JFreeChart mychart = ChartFactory.createPieChart("Programming - Colored Pie Chart Example",myServletPieChart,true,true,false);  
                response.setContentType("image/png"); /* Set the HTTP Response Type */
                ChartUtilities.writeChartAsPNG(outview, mychart, 400, 300);/* Write the data to the output stream */
        }
        catch (Exception e) {
                System.err.println(e.toString()); /* Throw exceptions to log files */
        }
        finally {
                outview.close();/* Close the output stream */
        }
        
 %>
</body>
</html>