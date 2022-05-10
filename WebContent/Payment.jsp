<%@ page import="com.payment" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/User.js"></script>


<meta charset="ISO-8859-1">
<title>Payment Management</title>
</head>
<body>

<div class="container"><div class="row"><div class="col-6">
<h1>Payment Management</h1>

	<form id="formItem" name="formItem">
		
		 Full Name:
		<input id="buyerName" name="buyerName" type="text" class="form-control form-control-sm"><br> 
		E-mail:
		<input id="address" name="address" type="text" class="form-control form-control-sm"><br>
		 Mobile No:
		<input id="NIC" name="NIC" type="text" class="form-control form-control-sm"><br>
		 Address:
		<input id="softwareName" name="softwareName" type="text" class="form-control form-control-sm"><br>
		 Zip-Code:
		<input id="size" name="size" type="text" class="form-control form-control-sm"><br> 
		<label>Payment Type</label> 
							<select id="version" name="version" class="form-control form-control-sm">
							<option value="1">Visa</option>
							<option value="2">Master</option>
							<option value="3">Direct Payment</option>

							</select><br>
		 Date:
		<input id="cost" name="cost" type="Date" class="form-control form-control-sm"><br>
		 Amount:
		<input id="date" name="date" type="text" class="form-control form-control-sm"><br>
		
		
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
		<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
	<br>
	<div id="divItemGrid">
	<%
	User CartObj = new User(); 
	 out.print(CartObj.readCart()); 
	%>
	</div>
</div> </div> </div> 
	
</body>
</html>