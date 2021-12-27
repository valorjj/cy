package dao.mypage;


import java.util.ArrayList;

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
		
		String sql = "insert into visitor(user_no, content, user_id) values(?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, visitor.getUser_no());
			ps.setString(2, visitor.getcontent());
			ps.setString(3, visitor.getUser_id());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("방명록 작성 실패 :" + e);} return false;
	} // 방명록 등록 메소드 end
	//-----------------------------------------------------------------------------------------
	
	
	// 전체 게시물 조회
//	public ArrayList<Visitor> visitorlist(int user_no) {
//		ArrayList<Visitor> visitors = new ArrayList<Visitor>();
//		String sql = "select * from visitor where ";
//	}
	
}
