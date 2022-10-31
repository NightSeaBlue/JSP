package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	// DB 연결시 관한 변수

	private static final String dbDriver = "oracle.jdbc.driver.OracleDriver";
	private static final String dbUrl = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String dbUser = "scott";
	private static final String dbPass = "tiger";
	Connection con = null;
	PreparedStatement ps = null;
	
	// Singleton Pattern
	private static MemberDao memberDao;		// private  Static 으로 선언해, MemberDao의 생성은 억제하면서 함수인 getInstance()의 접근 권한은 열어둠
	
	/*
	 *	함수명 : getInstance()
	 *  요소 : 없음
	 *  인자 : 없음
	 *  예외 : MemberException
	 *  역할 : memberDao 객체를 단 1회만 생성할 수 있게 해줌 
	 */
	public static MemberDao getInstance() throws MemberException {
		if (memberDao == null) {				//memberDao의 객체가 생성되어 있지 않을 때
			memberDao = new MemberDao();		//memberDao 객체 생성을 허용
		}
		return memberDao;						// memberDao 객체가 있는 경우, 그 객체로 돌아감
	}
    
	/*
	 *	생성자함수명 : MemberDao()
	 *  인자 : 없음
	 *  요소 : 없음
	 *  예외 : MemberException
	 *  역할 : DB연동 
	 */
	private MemberDao() throws MemberException {

		try {

			/********************************************
			 * 1. 드라이버를 로딩
			 * 
			 */

			Class.forName(dbDriver);
			System.out.println("드라이버 로딩 성공");

		} catch (Exception ex) {
			throw new MemberException("DB 연결시 오류  : " + ex.toString());
		}
	}

	/*******************************************
	 * * 회원관리테이블 MEMBERTEST 에 회원정보를 입력하는 함수
	 * 
	 * @param rec
	 * @throws MemberException
	 */
	
	/*
	 * 함수명 : InsertMember
	 * 인자 : Member
	 * 예외 : MemberException
	 * 역할 : MemberTest Table 에 회원정보 입력 (회원가입) 
	 * 
	 */
	public void insertMember(Member rec) throws MemberException {
		try {
			// 0. 연결 객체 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// 1. sql 문장 만들기 ( insert문 )
			String sql = "INSERT INTO memberTest(id,password,name,tel,addr)	" + " VALUES(?,?,?,?,?) ";
			// 2. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			ps.setString(1, rec.getId());			//들어오는 member의 이름이 rec로 지정되어 있음.
			ps.setString(2, rec.getPassword());
			ps.setString(3, rec.getName());
			ps.setString(4, rec.getTel());
			ps.setString(5, rec.getAddr());
			// 3. sql 전송
			int result = ps.executeUpdate();
			System.out.println(result + "행을 실행하였습니다.");
			// 4. 객체 닫기
			ps.close();
			con.close();

		} catch (Exception ex) {
			throw new MemberException("멤버 입력시 오류  : " + ex.toString());
		}
	}

	/**********************************************************
	 * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 */
	
	/*
	 * 함수명 : isDuplicateId()
	 * 인자 : userId
	 * 예외 : MemberException 
	 * 역할 : 입력한 ID 와 DB ID를 비교해 ID가 중복되는 경우, ID의 중복이 있음을 고객에게 알림 
	 * 
	 */
	public boolean isDuplicatedId(String id) throws MemberException {
		boolean flag = false;												// id checking을 위한 논리변수 flag

		try {
			// 0. 연결 객체 얻어오기
			con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// 1. sql 문장 만들기 ( insert문 )
			String sql = "SELECT id FROM memberTest WHERE id LIKE ? ";		// DB에서 ID를 찾음
			// 2. sql 전송 객체 만들기
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			// 3. sql 전송
			ResultSet rs = ps.executeQuery();
			if(rs.next()) flag=true;										//ResultSet 에 값이 있는 경우 즉 중복되는 ID가 있을 때, flag를 true로 반환
			else flag =false;												// 중복되는 ID가 없을 때 , flag를 false로 반환
			
			// 4. 객체 닫기
			rs.close();
			ps.close();
			con.close();

		} catch (Exception ex) {
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString());
		}

		return flag;													// 함수 실행 결과를 flag에 담아 flag로 반환 flag Type = Boolean
	}
}
