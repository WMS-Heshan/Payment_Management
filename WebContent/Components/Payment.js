$(document).on("click", "#btnSavePay", function(event){ 
	
	// Clear alerts---------------------
	 $("#alertSuccess").text(""); 
	 $("#alertSuccess").hide(); 
	 $("#alertError").text(""); 
	 $("#alertError").hide(); 
 
	 
	// Form validation-------------------
	var status = validateItemForm(); 
	if (status != true) 
	 { 
	 $("#alertError").text(status); 
	 $("#alertError").show(); 
	 
 return; 
} 


// If valid------------------------
var type = ($("#payment_id").val() == "") ? "POST" : "PUT"; 
	$.ajax( 
	{ 
	 url : "PaymentAPI", 
	 type : type, 
	 data : $("#formPaymentItem").serialize(), 
	 dataType : "text", 
	 complete : function(response, status) { 
		 
		 onItemSaveComplete(response.responseText, status); 
	 } 
	}); 
});

function onItemSaveComplete(response, status){ 
	if (status == "success") {
		
		 var resultSet = JSON.parse(response); 
		 if (resultSet.status.trim() == "success") { 
			 
			 $("#alertSuccess").text("Successfully saved."); 
			 $("#alertSuccess").show(); 
			 $("#divItemsGrid").html(resultSet.data); 
		 } 
		 else if (resultSet.status.trim() == "error") {
			 
			 $("#alertError").text(resultSet.data); 
			 $("#alertError").show(); 
		 } 
	} 
	else if (status == "error") { 
		
		 $("#alertError").text("Error while saving."); 
		 $("#alertError").show(); 
	} else{ 
		
		 $("#alertError").text("Unknown error while saving.."); 
		 $("#alertError").show(); 
		}
	$("#hidItemIDSave").val(""); 
	$("#formItem")[0].reset(); 
}


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event){ 
		
		 $("#paymentid").val($(this).data("payment_id")); 
		 $("#fullname").val($(this).closest("tr").find('td:eq(0)').text()); 
		 $("#email").val($(this).closest("tr").find('td:eq(1)').text()); 
		 $("#mobile").val($(this).closest("tr").find('td:eq(2)').text()); 
		 $("#adderss").val($(this).closest("tr").find('td:eq(3)').text()); 
		 $("#zipcode").val($(this).closest("tr").find('td:eq(4)').text());  
		 $("#paymenttype").val($(this).closest("tr").find('td:eq(5)').text()); 
		 $("#Date").val($(this).closest("tr").find('td:eq(6)').text()); 
		 $("#amount").val($(this).closest("tr").find('td:eq(7)').text()); 
		 
});





$(document).on("click", ".btnRemove", function(event) { 
	 $.ajax( 
	 { 
	 	url : "PaymentAPI", 
	 	type : "DELETE", 
	 	data : "payment_id=" + $(this).data("payment_id"),
	 	dataType : "text", 
	 	complete : function(response, status) { 
	 		onPaymentDeleteComplete(response.responseText, status); 
	 	} 
	}); 
})
	


function onPaymentDeleteComplete(response, status){
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response); 
			if (resultSet.status.trim() == "success"){
			
				$("#alertSuccess").text("Successfully deleted."); 
				$("#alertSuccess").show(); 
				$("#divItemsGrid").html(resultSet.data); 
				
			} else if (resultSet.status.trim() == "error") { 
				
				$("#alertError").text(resultSet.data); 
				$("#alertError").show(); 
		} 
	} 
	else if (status == "error") { 
		$("#alertError").text("Error while deleting."); 
		$("#alertError").show(); 
	} 
	else { 
		$("#alertError").text("Unknown error while deleting.."); 
		$("#alertError").show(); 
	} 
}

// CLIENT-MODEL================================================================
function validateItemForm(){
	// CODE

//Address---------------------------
if ($("#address").val().trim() == "")
{
return "Insert Address.";
} 

//Size-------------------------------
if ($("#size").val().trim() == "")
{
return "Insert Size.";
}

//Version----------------------------
if ($("#version").val().trim() == "")
{
return "Insert version.";
}

//Date---------------------------------
if ($("#Date").val().trim() == "")
{
return "Insert Date.";
}
	
// amount-------------------------------
if ($("#amount").val().trim() == ""){
	
	return "Insert amount.";
}
// is numerical value
var tmpPrice = $("#amount").val().trim();
if (!$.isNumeric(tmpPrice)){
			
	return "Insert a numerical value for amount.";
}
		
// convert to decimal price
$("#amount").val(parseFloat(tmpPrice).toFixed(2));


	return true;
}

