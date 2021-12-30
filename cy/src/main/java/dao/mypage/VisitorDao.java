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
			ps.setString(2, visitor.getContent());
			ps.setString(3, visitor.getUser_id());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {System.out.println("방명록 작성 실패 :" + e);} return false;
	} // 방명록 등록 메소드 end
	//-----------------------------------------------------------------------------------------
	
	//페이징 
	public ArrayList<Visitor> visitorlist(int startrow, int listsize, int user_no) {
		ArrayList<Visitor> visitors = new ArrayList<Visitor>();
		String sql = "select * from visitor where user_no = ? order by visitor_no desc limit ? , ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			ps.setInt(2, startrow);
			ps.setInt(3, listsize);
			rs = ps.executeQuery();
			while(rs.next()) {
				Visitor visitor = new Visitor(rs.getInt(1), rs.getInt(2), rs.getString(3),
						rs.getString(4), rs.getString(5));
				visitors.add(visitor);
			}
			return visitors;
		} catch (Exception e) {System.out.println("페이징 연습 실패 : " + e);} return null;
		
	}
	
	
	
	
	// 전체 게시물 조회
	public ArrayList<Visitor> visitorlist(int user_no) {
		ArrayList<Visitor> visitors = new ArrayList<Visitor>();
		String sql = "select * from visitor where user_no = ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs =ps.executeQuery();
			while(rs.next()) {
				Visitor visitor = new Visitor(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
				visitors.add(visitor);
			}
			return visitors;
		} catch (Exception e) {System.out.println("전체 게시물조회 실패 : " + e);} return null;
	}
	
	//방명록 수정
	public boolean updatevisitor(Visitor visitor) {
		String sql = "update visitor set content = ? where visitor_no = ?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, visitor.getContent());
			ps.setInt(2, visitor.getVisitor_no());
			ps.executeUpdate();
			
			return true;
		} catch (Exception e) {System.out.println("방명록 수정 실패 : " + e);} return false;
	}
	
	// 방명록삭제
	public boolean deletevisitor(int visitor_no) {
		String sql = "delete from visitor where visitor_no = ? ";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, visitor_no);
			ps.executeUpdate();
			return true;		
		} catch (Exception e) {System.out.println("방명록 삭제 실패 : " + e);} return false;
	}
	
	//페이징 처리
	public int visitorcount() {
		
		String sql = "select count(*) from visitor";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {System.out.println("페이징 처리 실패 :" +e);}return 0;
	}
}