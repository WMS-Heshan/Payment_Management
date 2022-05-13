<%@ page import="com.payment" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Payment.js"></script>


<meta charset="ISO-8859-1">
<title>Payment Management</title>
</head>
<body>

<div class="container"><div class="row"><div class="col-6">
<h1>Payment Management</h1>

	<form id="formItem" name="formItem">
		
		 Full Name:
		<input id="fullname" name="fullname" type="text" class="form-control form-control-sm"><br> 
		E-mail:
		<input id="email" name="email" type="text" class="form-control form-control-sm"><br>
		 Mobile No:
		<input id="mobile" name="mobile" type="text" class="form-control form-control-sm"><br>
		 Address:
		<input id="adderss" name="adderss" type="text" class="form-control form-control-sm"><br>
		 Zip-Code:
		<input id="zipcode" name="zipcode" type="text" class="form-control form-control-sm"><br> 
		<label>Payment Type</label> 
							<select id="paymenttype" name="paymenttype" class="form-control form-control-sm">
							<option value="Visa">Visa</option>
							<option value="Master">Master</option>
							<option value="Direct Payment">Direct Payment</option>

							</select><br>
		 Date:
		<input id="Date" name="Date" type="Date" class="form-control form-control-sm"><br>
		 Amount:
		<input id="amount" name="amount" type="text" class="form-control form-control-sm"><br>
		
		
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
		<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
	<br>
	<div id="divItemGrid">
	<%
	payment PaymentObj = new payment(); 
	 out.print(PaymentObj.readPayment()); 
	%>
	</div>
</div> </div> </div> 
	
</body>
</html>