package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PaymentAPI")
public class PaymentAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	payment PaymentObj = new payment();
    
	
    public PaymentAPI() {
        super();
        // TODO Auto-generated constructor stub
    }


    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String output = PaymentObj.insertPayment(request.getParameter("payment_id"),
				request.getParameter("fullname"),
				request.getParameter("email"),
				request.getParameter("mobile"),
				request.getParameter("adderss"), 
				request.getParameter("zipcode"),
				request.getParameter("paymenttype"), 
				request.getParameter("Date"),
				request.getParameter("amount")
				
				);
		
                response.getWriter().write(output);	
	}


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map pmt = getPmtMap(request); 
		String output = PaymentObj.updatePayment(pmt.get("payment_id").toString(), 
				pmt.get("fullname").toString(), 
				pmt.get("email").toString(),
				pmt.get("mobile").toString(), 
				pmt.get("adderss").toString(), 
				pmt.get("zipcode").toString(), 
				pmt.get("paymenttype").toString(), 
				pmt.get("Date").toString(), 
				pmt.get("amount").toString()
				); 
		
		response.getWriter().write(output); 
		
	}

	
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map pmt = getPmtMap(request); 
		
		String output = PaymentObj.deletePayment(pmt.get("payment_id").toString()); 
		response.getWriter().write(output);
		
	}
	
	// Convert request parameters to a Map
			private static Map getPmtMap(HttpServletRequest request) {
				
				Map<String, String> map = new HashMap<String, String>(); 
				try{ 
					
					 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
					 String queryString = scanner.hasNext() ? 
					 scanner.useDelimiter("\\A").next() : ""; 
					 scanner.close(); 
					 String[] pmtd = queryString.split("&"); 
					 for (String pmt : pmtd) {
						 
						 String[] a = pmt.split("=");
						 map.put(a[0], a[1]); 
					 } 
				}catch (Exception e) { 
					
				} 
				return map; 
			}

}
