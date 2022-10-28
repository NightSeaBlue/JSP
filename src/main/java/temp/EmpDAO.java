package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.jsp.tagext.TryCatchFinally;

public class EmpDAO {
	private EmpDAO() throws Exception {
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 성공");
		} catch (Exception e) {
			System.out.println("드라이버 로딩 실패 : " + e);
		}
	}
	
	// singleton 패턴 지정 (class 또한 static으로 지정해야 함)
	 static EmpDAO empDAO = null;
	
	// singleton = 한번만 생성하기 위해 사용 : getInstance() : 일회성을 부여한다. 외부에서 생성자 생성 없이 접근을 위해 static 부여
	public static EmpDAO getInstance() throws Exception {
		if (empDAO == null) empDAO = new EmpDAO();
		return empDAO;
	}
	
	public void insert(EmpVO vo) throws Exception {

		// 2. 연결객체 획득
		String url = "jdbc:oracle:thin:@192.168.0.164:1521:xe";
		String user = "scott";
		String pass = "tiger";
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = DriverManager.getConnection(url, user, pass);
			System.out.println("디비 연결 성공");
			// 3. sql 문장 (insert)
			String sql = "INSERT INTO emp(empno,ename,sal,deptno,job)	" + " VALUES(?,?,?,?,?) ";
			// 4. 전송객체 얻어오기 ( + ? 에 값 지정)
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getEmpno());
			ps.setString(2, vo.getEname());
			ps.setInt(3, vo.getSal());
			ps.setInt(4, vo.getDeptno());
			ps.setString(5, vo.getJob());
			// 5. 전송
			int result = ps.executeUpdate();
			System.out.println(result + "행을 실행하였습니다.");

		} catch (Exception e) {
			System.out.println("DB 실패 : " + e);
		} finally {
			// 6. 닫기
			ps.close();
			con.close();
		}

	}
}
