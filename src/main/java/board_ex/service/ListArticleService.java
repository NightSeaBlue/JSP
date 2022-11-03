package board_ex.service;

import java.util.List;

import board_ex.model.*;
import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

public class ListArticleService {
	
	//-------------------------------------------------------------------
		private int totalRecCount;		// 전체 레코드 수	
		private int pageTotalCount;		// 전체 페이지 수
		private int countPerPage = 5;	// 한페이지당 레코드 수
	
	
	private static ListArticleService instance;
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	public List <BoardVO> getArticleList() throws BoardException
	{
		 List <BoardVO> bList = BoardDao.getInstance().selectList();			
		return bList;
	}
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException {	
		// 선택한 페이지 번호를 알기 위한 변수 설정
		int pageNum = 1; // 처음 화면을 로딩했을 때 페이지 번호가 지정되어 있지 않기 때문에 null 값이 넘어옴
		
		if(pNum != null) pageNum = Integer.parseInt(pNum);
		
		/*
		 *	페이지 번호		시작레코드번호		끝레코드번호
		 *    1					1				3
		 *    2					4				6	
		 * 	  3					7			    9
		 */
		// startRow = endRow -2;
		int startRow = countPerPage*pageNum-4;
		int endRow = pageNum * countPerPage;
		
		List <BoardVO> bList = BoardDao.getInstance().selectList(startRow, endRow);			
		return bList;
		
	}
	
	/*
	 * 
	 */
	
	public int getTotalPage() throws BoardException {
		
		// 전체 레코드 수
		totalRecCount = BoardDao.getInstance().getTotalCount();
		/*
		 * 전체 레코드 수를 counting 으로 나누고 나머지가 있는 경우 페이지 장 수를 하나 추가 
		 */
		// 지원씨 방법 : pageTotalCount = (int)Math.ceil(totalRecCount/3.0);
		
		pageTotalCount = totalRecCount/countPerPage;
		
		if(totalRecCount % countPerPage > 0) pageTotalCount++;
				
		// 전체 레코드 수에 따른 페이지 수 리턴
		return pageTotalCount;
	}
		
}
