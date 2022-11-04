package mvc.guest.control;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.guest.command.Command;
import mvc.guest.command.CommandDelete;
import mvc.guest.command.CommandException;
import mvc.guest.command.CommandInput;
import mvc.guest.command.CommandList;
import mvc.guest.command.CommandModify;
import mvc.guest.command.CommandNull;
import mvc.guest.command.CommandSelect;

/**
 * Servlet implementation class GuestControl
 */
public class GuestControl extends HttpServlet {
	
	private HashMap commandMap;
	private String	jspDir = "/05_mvc_class/2_mvcGuest/";
	private String  error = "error.jsp";
	

    public GuestControl() {
        super();       
		initCommand();
	}

	private void initCommand(){
		commandMap = new HashMap();
		// 초기 화면 hash map 에 추가
		commandMap.put("main-page",	new CommandNull("main.jsp") );
		// 방명록 눌렀을 때 방명록 뜰 수 있게 hash map에 추가
		commandMap.put("list-page",	new CommandList("listMessage.jsp") );
		// 글 쓰기 눌렀을 때 글을 입력하는 창을 불러올 수 있도록  hash Map 에 추가
		commandMap.put("input-form", new CommandNull("insertMessage.jsp"));
		// 글입력 마치고 저장하기 눌렀을 때 저장이 될 수 있도록 hash Map 에 추가
		commandMap.put("input-data", new CommandInput("saveMessage.jsp"));
		// 글 삭제하기 버튼 눌렀을 때 삭제할 수 있는 페이지로 이동하도록 hash Map 에 추가
		commandMap.put("delete-form", new CommandNull("deleteMessage.jsp"));
		// 삭제하기 버튼을 눌렀을 때 , 실제 삭제하는 페이지로 이동하도록 hash Map 에 추가
		commandMap.put("del-confirm",new CommandDelete("deleteConfirm.jsp"));
		
		// 수정하기 버튼 눌렀을 때, 수정하는 창을 불러올 수 있도록 hashMap 에 추가
		commandMap.put("modify-form", new CommandSelect("MessageModifyForm.jsp"));
		
		//
		commandMap.put("modify-confirm", new CommandModify("MessageModify.jsp"));
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String nextPage = "";
		String cmdKey	= request.getParameter("cmd");
		if( cmdKey == null ){
			cmdKey = "main-page";
		}

		
		Command cmd = null;

		try{
			
			if( commandMap.containsKey( cmdKey ) ){
				cmd = (Command)commandMap.get(cmdKey);
			}else{
				throw new CommandException("지정할 명령어가 존재하지 않음");
			}

			nextPage = cmd.execute( request, response  );

		}catch( CommandException e ){
			request.setAttribute("javax.servlet.jsp.jspException", e );
			nextPage = error;
			System.out.println("오류 : " + e.getMessage() );
		}

		RequestDispatcher reqDp = getServletContext().getRequestDispatcher( jspDir + nextPage );
		reqDp.forward( request, response );
		
	}

}
