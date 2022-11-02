package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{	
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
		int startRow = countPerPage*pageNum-2;
		int endRow = pageNum * countPerPage;
		
		List <Message> mList = MessageDao.getInstance().selectList(startRow,endRow);			
		return mList;
		
	}
	
	/*
	 * 
	 */
	
	public int getTotalPage() throws MessageException {
		// 전체 레코드 수
		totalRecCount = MessageDao.getInstance().getTotalCount();
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
