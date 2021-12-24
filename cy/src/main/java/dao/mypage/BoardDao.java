package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.Board;

public class BoardDao extends DB{
	public BoardDao() {
		super();
	}
	
	public static BoardDao boarddao = new BoardDao() ; 	// 3. Dao 객체 생성
	public static BoardDao getBoardDao() { return boarddao; } // 4. Dao 객체 반환
	// 게시물 작성
	public boolean boardwrite( Board board ) {
		
		String sql = "insert into board( board_title , board_contents , user_no ) values(?,?,?)";
		try {
			ps = con.prepareStatement(sql);	
			ps.setString(1, board.getBoard_title() ); 	ps.setString(2, board.getBoard_contents());
			ps.setInt(3, board.getUser_no());			
			ps.executeUpdate();		return true;
		}catch (Exception e) { System.out.println(e);}	return false;	
		
	}

public ArrayList<Board> boardlist( ){
		
		ArrayList<Board> boards = new ArrayList<Board>(); 
		String sql  ="select * from board order by b_num DESC";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				
				Board board = new Board( 
						rs.getInt(1), 
						rs.getInt(2), 
						rs.getInt(3),
						rs.getInt(4), 
						rs.getString(5),
						rs.getString(6),
						rs.getInt(7),
						rs.getString(8),
						rs.getInt(9));
				boards.add(board);
			}
			return boards;
		}catch (Exception e) {} return null;
	}
}
