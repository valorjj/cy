package dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import dao.mypage.BoardDao;

public class Board {
	
	private int board_no;
	private int category1_no;
	private int category2_no;
	private int category3_no;
	private String board_title;
	private String board_contents;
	private int user_no;
	private String board_date;
	private int board_view;
	private String b_writer; // 작성자

	public Board() {}
	
	public Board(int board_no, int category1_no, int category2_no, int category3_no,  String board_title, String board_contents, int user_no, String board_date, int board_view) {
		super();
		this.board_no = board_no;
		this.category1_no = category1_no;
		this.category2_no = category2_no;
		this.category3_no = category3_no;
		this.board_title = board_title;
		this.board_contents = board_contents;
		this.user_no = user_no;
		// 1. 작성자 = 회원번호를 이용한 아이디 찾아서 대입
		// this.b_writer = MemberDao.getMemberDao().getmemberid(m_num);
		// 2. 등록날짜와 오늘날짜와 동일하면 시간 아니면 날짜 표시
		Date today = new Date(); // 1. 오늘날짜 
		SimpleDateFormat datetimeformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");	// 날짜,시간형식
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");				// 날짜 형식
		SimpleDateFormat timeformat = new SimpleDateFormat("a hh:mm");					// 시간 형식
		try {
			Date date =  datetimeformat.parse( board_date );						// [문자열]DB -> 날짜/시간 형식 변환
			if( dateFormat.format( date ).equals(  dateFormat.format( today ) ) ) {	// 등록날짜 = 오늘날짜 비교
				this.board_date = timeformat.format(date);		// 날짜가 동일하면 시간형식 적용
			}else {
				this.board_date = dateFormat.format(date);		// 날짜가 동일하지 않으면 날짜형식 적용
			}
		}
		catch (Exception e) {}
		
		this.board_view = board_view;
	
	}
	public Board(String board_title, String board_contents, int user_no) {
		this.board_title = board_title;
		this.board_contents = board_contents;
		this.user_no = user_no;
	}
	
	public Board(int board_no, String board_title, String board_contents) {
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_contents = board_contents;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_contents() {
		return board_contents;
	}

	public void setBoard_contents(String board_contents) {
		this.board_contents = board_contents;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getBoard_view() {
		return board_view;
	}

	public void setBoard_view(int board_view) {
		this.board_view = board_view;
	}

	public String getB_writer() {
		return b_writer;
	}

	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}

	public int getCategory1_no() {
		return category1_no;
	}

	public void setCategory1_no(int category1_no) {
		this.category1_no = category1_no;
	}

	public int getCategory2_no() {
		return category2_no;
	}

	public void setCategory2_no(int category2_no) {
		this.category2_no = category2_no;
	}

	public int getCategory3_no() {
		return category3_no;
	}

	public void setCategory3_no(int category3_no) {
		this.category3_no = category3_no;
	}	
	
	
	
	
	
	
}
