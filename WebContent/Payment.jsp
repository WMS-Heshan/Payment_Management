<%@ page import="com.payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Payment.js"></script>
<meta charset="ISO-8859-1">

<!-- new CSS JS Import -->

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<!-- new CSS JS Import end -->

<title>Payment Management</title>
</head>
<body>

	<!-- form container -->

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Payment Management</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="img" style="background-image: url(images/bg-1.jpg);">
						</div>
						<div class="login-wrap p-4 p-md-5">
							<div class="d-flex">
								<div class="w-100">
									<h3 class="mb-4">Payment Details</h3>
								</div>
								<!-- <div class="w-150">
									<p class="social-media d-flex justify-content-end">
										<a href="#"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-facebook"></span></a> <a href="#"
											class="social-icon d-flex align-items-center justify-content-center"><span
											class="fa fa-twitter"></span></a>
									</p>
								</div> -->
							</div>
							
							<form id="formItem" name="formItem" class="signin-form">
							
								<div class="form-group mb-3">
									<label class="label" for="name">Full Name</label> <input
										id="fullname" name="fullname" type="text" class="form-control"
										placeholder="Full Name" required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">E-mail</label> <input
										id="email" type="mail" name="email" class="form-control"
										placeholder="E-mail" required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Mobile No</label> <input
										id="mobile" type="text" name="mobile" class="form-control"
										placeholder="Mobile No" required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Address</label> <input
										id="adderss" type="text" name="adderss" class="form-control"
										placeholder="Address" required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Zip-Code</label> <input
										id="zipcode" type="text" name="zipcode" class="form-control"
										placeholder="Zip-Code" required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Payment Type</label> <select
										id="paymenttype" type="text" name="paymenttype" class="form-control"
										placeholder="Payment Type" required >
										<option value="Visa">Visa</option>
										<option value="Master">Master</option>
										<option value="Direct Payment">Direct Payment</option>
										</select>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Date</label> <input
										id="Date" type="Date" name="Date" class="form-control"
										placeholder="Date" required>
								</div>
								<div class="form-group mb-3">
									<label class="label" for="name">Amount</label> <input
										id="amount" type="text" name="amount" class="form-control"
										placeholder="Amount" required>
								</div>
								<div class="form-group">
								
								<input id="btnSave" name="btnSave" type="button" value="Save"
									class="form-control btn btn-primary rounded submit px-3"> 
								<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
								</div>
								<div>
								<a href="viewanddelet.jsp" class="form-control btn btn-primary rounded submit px-3">
								View Payment</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- form container End-->
	<div class="container">
		<div class="row">
			<div>
				<h1 style= "text-align:center">Payment Management</h1>
				

			<!-- <form id="formItem" name="formItem">

					Full Name: <input id="fullname" name="fullname" type="text"
						class="form-control form-control-sm"><br> 
						
						E-mail: <input
						id="email" name="email" type="text"
						class="form-control form-control-sm"><br> 
						
						Mobile No:
					<input id="mobile" name="mobile" type="text"
						class="form-control form-control-sm"><br>
						
						 Address: <input
						id="adderss" name="adderss" type="text"
						class="form-control form-control-sm"><br>
						
						 Zip-Code: <input
						id="zipcode" name="zipcode" type="text"
						class="form-control form-control-sm"><br> <label>

						Payment Type</label> <select id="paymenttype" name="paymenttype"
						class="form-control form-control-sm">
						<option value="Visa">Visa</option>
						<option value="Master">Master</option>
						<option value="Direct Payment">Direct Payment</option>

					</select><br> 
					Date: <input id="Date" name="Date" type="Date"
						class="form-control form-control-sm"><br> 
						
						Amount: <input
						id="amount" name="amount" type="text"
						class="form-control form-control-sm"><br>
						
						 <input
						id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>  -->
				

				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divItemGrid">
					<%
					payment PaymentObj = new payment();
					out.print(PaymentObj.readPayment());
					%>
				</div>
			</div>
		</div>
	</div>

	<!-- script -->

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

	<!-- script End-->

</body>
</html>