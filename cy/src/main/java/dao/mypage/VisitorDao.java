package dao.mypage;


import dao.DB;
import dto.Visitor;

public class VisitorDao extends DB {
	public VisitorDao() {
		super();
	}

	public static VisitorDao visitorDao = new VisitorDao();
	public static VisitorDao getvisitorDao() { return visitorDao; }
	// 방명록 등록 메소드 
	public boolean visitorwrite(Visitor visitor) {
		
		String sql = "insert into visitor(user_no, content) values(?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, visitor.getUser_no());
			ps.setString(2, visitor.getcontent());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {} return false;
	}
	
	
	
//	public boolean getuser_no() {
//		
//		
//	}
}
