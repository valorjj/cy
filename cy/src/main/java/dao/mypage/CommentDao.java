package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.Comment;


public class CommentDao extends DB {
	public CommentDao() {
		super();
	}
	
	public static CommentDao commentDao = new CommentDao() ; 	// 3. Dao 객체 생성
	public static CommentDao getCommentDao() { return commentDao; } // 4. Dao 객체 반환
	
	
	public boolean postwrite( Comment comment ) {
		
		String sql = "insert into comment(content , user_no , bpost_no) values(?,?,?)";
		try {
			ps = con.prepareStatement(sql);	
			ps.setString(1, comment.getContent() ); 	ps.setInt(2, comment.getUser_no());
			ps.setInt(3, comment.getBpost_no());	
			ps.executeUpdate();	
			return true;
		}catch (Exception e) { System.out.println(e);}	
		return false;	
	}
	
	
	// 모든 게시물 출력
	public ArrayList<Comment> postCommentlist(int bpost_no){
		ArrayList<Comment> comments = new ArrayList<Comment>(); 
		String sql ="select * from comment where bpost_no="+bpost_no;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				
				Comment comment = new Comment(
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getInt(3),
						rs.getString(4), 
						rs.getString(5));
					
				comments.add(comment);
			}
			return comments;
		}catch (Exception e) {} return null;
	}
	

	// 게시물 삭제 메소드
	public boolean postCommentdelete(int comment_no) {
		String sql = "delete from comment where comment_no="+comment_no;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			return true;
				
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;		
	}
	
	
	
	
	
	
}
