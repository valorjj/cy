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
			ps.executeUpdate();		return true;
		}catch (Exception e) { System.out.println(e);}	return false;	
		
	}

public ArrayList<Post> postlist( ){
		
		ArrayList<Post> posts = new ArrayList<Post>(); 
		String sql  ="select * from bpost order by bpost_no DESC";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				
				Post post = new Post( 
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getInt(3),
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7));
				posts.add(post);
			}
			return posts;
		}catch (Exception e) {} return null;
	}
}
