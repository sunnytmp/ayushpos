<!--  /*************************************************************************
 * 
 * RiverLog Software
 * __________________
 * 
 *  [2016] - [2017] RiverLog Software 
 *  All Rights Reserved.
 * 
 * NOTICE:  All information contained herein is, and remains
 * the property of RiverLog Software and its suppliers,
 * if any.  The intellectual and technical concepts contained
 * herein are proprietary to RiverLog Software
 * and its suppliers and may be covered by U.S. and Foreign Patents,
 * patents in process, and are protected by trade secret or copyright law.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from RiverLog Software.
 */ -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>Code Named Ayush POS</title>  
    <!--  <script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>  -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
  <script src="<c:url value='/static/js/service/user_service.js' />"></script>	
<script src="<c:url value='/static/js/controller/cat_controller.js' />"></script>
<script src="<c:url value='/static/js/service/cat_service.js' />"></script>
<script src="<c:url value='/static/js/service/item_service.js' />"></script>
<script src="<c:url value='/static/js/controller/item_controller.js' />"></script>
 <script src="<c:url value='/static/js/service/po_service.js' />"></script>
<script src="<c:url value='/static/js/controller/po_controller.js' />"></script>
    <style>
      .uname.ng-valid {
          background-color: lightgreen;
      }
      .uname.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .uname.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 ul {
    width: 128em
}
.right {
    float: right
}	
     .sep {
        border-bottom:2px solid black;
    }
    .sep td {
        padding-bottom:5px;
    }
 
   </style>
     <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
          
     
  </head>
  <body ng-app="myApp" class="ng-cloak" , style="background-color:wheat;">
 
<script>

function printData()
{
	var butoon = document.getElementById("printPageButton");
	butoon.style.display = "none";
   var divToPrint=document.getElementById("prarea");
   
   newWin= window.open('Print', '',"width=800,height=600");
  // newWin.document.open();
   newWin.document.write('<html><title>Print Preview::</title><head><link href="<c:url value='/static/css/print.css' />" rel="stylesheet" type="text/css" media="print,screen"></link></head></body>');
   newWin.document.write(divToPrint.innerHTML);
   newWin.document.write('</html>');
   newWin.document.close();
  
   setTimeout(function(){
	//   newWin.document.focus();
	   newWin.print();
       newWin.close();
  }, 25);
   
   butoon.style.display = "inline";
}

$('button').on('click',function(){
 printData();

});
</script>
<script>
function printDataonTable() {
	var itemtable= document.getElementById("printTable").rows
	var thetable = document.getElementById("printTable");
	var r =0;						 
	 var orddetails = JSON.parse(localStorage.getItem("OrderDetails"));
	 var item4prnt = JSON.parse(localStorage.getItem("item4print"));
	 var totalAmount = localStorage.getItem("TotalAmount");
	 var totalTax = localStorage.getItem("TotalTax");
	 var totalDiscount = 0;
	 for (var i=0; i<= item4prnt.length-1;i++){
		 totalDiscount = totalDiscount + item4prnt[i].discount;
	 }

	       var row = null;
		   for (var ik = 0; ik<= item4prnt.length-1;ik++){
			   if (ik > 5 ){
			     row = thetable.insertRow(ik+1);
		    	 var cell1 = row.insertCell(0);
		    	 var cell2 = row.insertCell(1);
				 var cell3= row.insertCell(2);
				 var cell4= row.insertCell(3);
				 var cell5= row.insertCell(4);
				 var cell6= row.insertCell(5);
			//	 cell1.innerHTML = itemtable[ik+1].cells[0].innerHTML = ik+1;
				 cell1.innerHTML = ik+1;	 
				 cell2.innerHTML = item4prnt[ik].item.name;
				 cell3.innerHTML =  " " + item4prnt[ik].qty;
				 
				 cell4.innerHTML = "&#8377;" +  " " + item4prnt[ik].item.price.toFixed(2);
				 cell5.innerHTML = "&#8377;" +  " " + parseFloat(item4prnt[ik].discount).toFixed(2);
				 cell6.innerHTML =  "&#8377;" + (parseFloat(item4prnt[ik].item.price).toFixed(2) * parseFloat(item4prnt[ik].qty).toFixed(2)- parseFloat(item4prnt[ik].discount).toFixed(2)) ;
				 cell2.style.textAlign = "left";
				 cell5.style.textAlign = "left";
			   }else{
				itemtable[ik+1].cells[0].innerHTML = ik+1;
				itemtable[ik+1].cells[1].innerHTML = item4prnt[ik].item.name;
				itemtable[ik+1].cells[2].innerHTML = item4prnt[ik].qty;
				itemtable[ik+1].cells[3].innerHTML = "&#8377;" + " " + item4prnt[ik].item.price.toFixed(2);
			    itemtable[ik+1].cells[5].innerHTML=   "&#8377;" + (parseFloat(item4prnt[ik].item.price) * parseFloat(item4prnt[ik].qty)- item4prnt[ik].discount);
			    itemtable[ik+1].cells[4].innerHTML =  "&#8377;"+ " " + parseFloat(item4prnt[ik].discount).toFixed(2);
			    itemtable[ik+1].cells[1].style.textAlign ="left";
				itemtable[ik+1].cells[2].style.textAlign ="left";
			//	itemtable[ik+1].cells[3].style.textAlign ="center";
				itemtable[ik+1].cells[4].style.textAlign ="left";
				
		     }
			   	
			  
		   }
		    
		   var row = thetable.insertRow(ik+1);
		   var cell1 = row.insertCell(0);
	    	 var cell2 = row.insertCell(1);
			 var cell3= row.insertCell(2);
			 var cell4= row.insertCell(3);
			 var cell5= row.insertCell(4);
		     cell5.innerHTML ="<button id='printPageButton' onClick='printData()'>Print Bill </button>";
		 //    cell2.style.textAlign = "center";
		//	 cell3.style.textAlign = "center"; 

		      var row = thetable.insertRow(ik+1);
	    	 var cell1 = row.insertCell(0);
	    	 var cell2 = row.insertCell(1);
			 var cell3= row.insertCell(2);
			 var cell4= row.insertCell(3);
			 var cell5= row.insertCell(4);
			 var cell6= row.insertCell(5);
		     cell2.innerHTML= "<B>"+"Total Amount";
		     cell6.innerHTML ="<B>" + "&#8377;" + parseFloat(totalAmount).toFixed(2);
		  //   cell2.style.textAlign = "center";
	//		 cell3.style.textAlign = "center";  
			row.className = "sep";
			
			 var row = thetable.insertRow(ik+1);
	    	 var cell1 = row.insertCell(0);
	    	 var cell2 = row.insertCell(1);
			 var cell3= row.insertCell(2);
			 var cell4= row.insertCell(3);
			 var cell5= row.insertCell(4);
		     cell2.innerHTML= "<B>"+"Total Discount Given ";
		     cell5.innerHTML ="<B>" + "&#8377;"+ " " + parseFloat(totalDiscount).toFixed(2);
		          
		     var row = thetable.insertRow(ik+1);
	         var cell1 = row.insertCell(0);
	    	 var cell2 = row.insertCell(1);
			 var cell3= row.insertCell(2);
			 var cell4= row.insertCell(3);
			 var cell5= row.insertCell(4);
			 var cell6= row.insertCell(5);
		    // cell2.innerHTML= "Inclusive Of All Taxes";
		    // row.styler="{.borde:1px solid black !important}";
		     	
		     cell2.innerHTML= "Inclusive Of All Taxes";
		     row.className="sep";
		     }


	</script>
	
</head>
<div>
<center>
<body onload ="printDataonTable()"</body>
<%
    if (request.getSession().getAttribute("userid_apos") == null) {
  	  out.print("Un-Authorized Access Attempt! This attempt has sent an alert!");  
  	  return;
    }
%>
<center>
<div id="prarea">
<h3 class="h3x"> Amma Super Market, Palakkad</H3>
<h3 class="h3y">Thank you for shopping with Amma Store</h4>
<h3 class="h3z">Your one stop market for all your quality products.
<h3 class="h3a">Your bill below:  Checked Out In Counter By :</h4><p id="date"></p>
<image src="<%=getServletContext().getContextPath()%>/static/images/billlogo.png" class="left" alt="Image here" style="border:1;position:relative;bottom:100px;right:170px;width:90px;height:90px;">
<image src="<%=getServletContext().getContextPath()%>/static/images/LogoforposR.png" class="right" alt="Image here" style="border:1;position:relative;bottom:100px;right:280px;width:90px;height:90px;">

<script>
document.getElementById("date").innerHTML = "<b>"+Date();
</script>



<table class="tablex" border="0" cellpadding="0"  style="position:relative;top:-80;align:left;" id="printTable">
	
	    <th>Sl&nbsp;&nbsp;</th>
		<th>Item&nbsp;&nbsp;</th>
		<th>Qty&nbsp;&nbsp;</th>
		<th>Unit Price&nbsp;&nbsp;</th>
		<th>Discount</th>		
		<th>Net</th>
		
	</tr>
	<tr>
	
	    <td>Sl</td>
	    <td>Item>/td>
		<td>Qty</td>
		<td>Unit Price</td>	
		<td>Discount</td>	
		<td>Net</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>		
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>		
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>		
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>		
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td></td>		
		<td></td>
		<td></td>
		<td></td>
	</tr>
</tbody></table>

<br />
<br />
</image></h3></H3></h3></div>
</body>

</center>

</html>