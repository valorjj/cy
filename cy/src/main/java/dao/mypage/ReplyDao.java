package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.Comment;
import dto.Reply;

public class ReplyDao extends DB {
	public ReplyDao() {
		super();
	}
	
	public static ReplyDao replyDao = new ReplyDao() ; 	// 3. Dao 객체 생성
	public static ReplyDao getReplyDao() { return replyDao; } // 4. Dao 객체 반환
	
	
	public boolean gallerywrite( Reply reply ) {
		
		String sql = "insert into reply( user_no , gpost_no,content ) values(?,?,?)";
		try {
			ps = con.prepareStatement(sql);	
			 	ps.setInt(1, reply.getUser_no());
			ps.setInt(2, reply.getGpost_no());	
			ps.setString(3, reply.getContent() );
			ps.executeUpdate();	
			return true;
		}catch (Exception e) { System.out.println(e);}	
		return false;	
	}
	
	
	// 모든 게시물 출력
	public ArrayList<Reply> galleryCommentlist(int gpost_no){
		ArrayList<Reply> replies = new ArrayList<Reply>(); 
		String sql ="select * from reply where gpost_no="+gpost_no;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				
				Reply reply = new Reply(
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getInt(3),
						rs.getString(4), 
						rs.getString(5));
					
				replies.add(reply);
			}
			return replies;
		}catch (Exception e) {} return null;
	}
	

	// 게시물 삭제 메소드
	public boolean galleryCommentdelete(int reply_no) {
		String sql = "delete from reply where reply_no="+reply_no;
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
