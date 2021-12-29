package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.Post;

public class PostDao extends DB {

	public PostDao() {
		super();
	}
	
	
	public static PostDao postDao = new PostDao() ; 	// 3. Dao 객체 생성
	public static PostDao getPostDao() { return postDao; } // 4. Dao 객체 반환
	// 게시물 작성
	public boolean postwrite( Post post ) {
		
		String sql = "insert into bpost( title , content , user_no ) values(?,?,?)";
		try {
			ps = con.prepareStatement(sql);	
			ps.setString(1, post.getTitle() ); 	ps.setString(2, post.getContent());
			ps.setInt(3, post.getUser_no());			
			ps.executeUpdate();	return true;
		}catch (Exception e) { System.out.println(e);}	return false;	
		
	}
	// 모든 게시물 출력
	public ArrayList<Post> postlist( int startrow ,  int listsize ){
			
		ArrayList<Post> posts = new ArrayList<Post>(); 
		String sql  ="select * from bpost order by bpost_no DESC limit "+startrow +" , "+listsize;
		
		try {
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while( rs.next() ) {
				
				Post post = new Post( 
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getString(3), 
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6));
				posts.add(post);
			}
			return posts;
		}catch (Exception e) {} return null;
	}
	

	//게시물 총 개수 반환 메소드 
	public int postcount() {
		String sql="select count(*) from bpost";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			if( rs.next() ) { return rs.getInt(1); }
		}catch (Exception e) {} return 0;
	}
	
	// 게시물번호의 해당 게시물 가져오기 
	public boolean postcount( int bpost_no) {
		String sql = "update bpost set view = view+1 where bpost_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, bpost_no); 	ps.executeUpdate();
			return true;
		}catch (Exception e) {} return false;
	}
	
	
	// 해당 게시물 가져오기

		public Post getPost( int bpost_no) {
			String sql = "select * from bpost where bpost_no=?";
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, bpost_no);
				rs = ps.executeQuery();
				if( rs.next() ) {
					Post post = new Post( 
							rs.getInt(1), 
							rs.getInt(2), 
							rs.getString(3), 
							rs.getString(4),
							rs.getString(5),
							rs.getInt(6));
					return post;
				}
			}catch (Exception e) {} return null;
			
		}
	
		// 게시물 수정 메소드 
		public boolean postupdate( Post post ) {
			String sql = "update bpost set title=? , content=? "
						+ "where bpost_no = ?";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, post.getTitle() );  	
				ps.setString(2, post.getContent());
				ps.setInt(3, post.getBpost_no() );
				ps.executeUpdate();
				return true;
			}catch (Exception e) {} return false;
		}
		
		// 게시물 삭제 메소드 
		public boolean postdelete( int bpost_no ) {
			String sql = "delete from bpost where bpost_no =?";
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, bpost_no); 	ps.executeUpdate();
				return true;
			}catch (Exception e) {} return false;
		}
		
}
