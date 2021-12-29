package dao.mypage;

import java.util.ArrayList;
import dao.DB;
import dto.Gallery;

public class GalleryDao extends DB{

	public GalleryDao() {
		super();
	}
	
	public static GalleryDao galleryDao = new GalleryDao() ; 	// 3. Dao 객체 생성
	public static GalleryDao getGalleryDao() { return galleryDao; } // 4. Dao 객체 반환
	
	// 게시물 작성
	public boolean gallerywrite( Gallery gallery  ) {
		
		String sql = "insert into gpost(  user_no , title , content , photo) values(?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);	
			ps.setInt(1, gallery.getUser_no());	
			ps.setString(2, gallery.getTitle() ); 	
			ps.setString(3, gallery.getContent());
			ps.setString(4, gallery.getPhoto());
			ps.executeUpdate();		return true;
		}catch (Exception e) { System.out.println(e);}	return false;	
		
	}

	// 게시물번호의 해당 게시물 가져오기 
	public Gallery getGallery( int gpost_no) {
		String sql = "select * from gpost where gpost_no=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, gpost_no);
			rs = ps.executeQuery();
			if( rs.next() ) {
				Gallery gallery = new Gallery( 
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getString(3),
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7));
				return gallery;
			}
		}catch (Exception e) {} return null;
		
	}
	// 게시물번호의 해당 게시물 가져오기 
	public boolean gallerycount( int gpost_no) {
		String sql = "update gpost set view = view+1 where gpost_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, gpost_no); 	ps.executeUpdate();
			return true;
		}catch (Exception e) {} return false;
	}
	
	public int gallerycount() {
		String sql="select count(*) from gpost";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			if( rs.next() ) { return rs.getInt(1); }
		}catch (Exception e) {} return 0;
	}
	
	// 게시물 삭제 메소드 
	public boolean gallerydelete( int gpost_no ) {
		String sql = "delete from gpost where gpost_no =?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, gpost_no); 	ps.executeUpdate();
			return true;
		}catch (Exception e) {} return false;
	}
	// 게시물 수정 메소드 
	public boolean galleryupdate( Gallery gallery ) {
		String sql = "update gallery set title=? , content=? , photo=? "
					+ "where gpost_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, gallery.getTitle() );  	
			ps.setString(2, gallery.getContent());
			ps.setString(3, gallery.getPhoto() );	
			ps.setInt(4, gallery.getGpost_no() );
			ps.executeUpdate();
			return true;
		}catch (Exception e) {} return false;
	}

	// 모든 게시물 출력
	
	public ArrayList<Gallery> gallerylist(int startrow ,  int listsize ){
		
		ArrayList<Gallery> galleries = new ArrayList<Gallery>(); 
		String sql  ="select * from gpost order by gpost_no DESC limit "+startrow +" , "+listsize;
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				Gallery gallery = new Gallery( 
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getString(3),
						rs.getString(4), 
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7));
				galleries.add(gallery);
			}
			return galleries;
		}catch (Exception e) {} return null;
	}
		
	
	
	
	
}
