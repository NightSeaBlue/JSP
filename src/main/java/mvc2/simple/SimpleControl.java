package mvc2.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SimpleControl extends HttpServlet {
	    
	/************************* 절대 경로 위치 확인 ***************************************/
	private String jspDir = "/05_mvc_class/1_mvcSimple" ;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			process(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			process(request, response);
	}
	
	
	/*
	 * 인자 : Request 와 Response 
	 */
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String value = "Holla!";
		
		request.setAttribute("param", value);
				
		// Forwarding	<jsp:forward> //	 해당 페이지로 포워딩 하는 액션 태그를 자바 KeyWording
		RequestDispatcher dispatcher = request.getRequestDispatcher(jspDir+"/simpleView.jsp");			
		
		dispatcher.forward(request, response);
		
	}

}
