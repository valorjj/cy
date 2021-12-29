package dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import dao.user.UserDao;

public class Gallery {
	private int gpost_no;
	private int user_no;
	private String title;
	private String content;
	private String photo;
	private String date;
	private int view;
	private String writer;
	
	public Gallery() {}

	public Gallery(int gpost_no, int user_no, String title, String content,String photo,  String date, int view
			) {
		this.gpost_no = gpost_no;
		this.user_no = user_no;
		this.title = title;
		this.content = content;
		this.photo = photo;
		this.date = date;
		this.writer = UserDao.getUserDao().getUserId(user_no);
		Date today = new Date(); // 1. 오늘날짜 
		SimpleDateFormat datetimeformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");	// 날짜,시간형식
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");				// 날짜 형식
		SimpleDateFormat timeformat = new SimpleDateFormat("a hh:mm");					// 시간 형식
		try {
			Date date2 =  datetimeformat.parse( date );						// [문자열]DB -> 날짜/시간 형식 변환
			if( dateFormat.format( date2 ).equals(  dateFormat.format( today ) ) ) {	// 등록날짜 = 오늘날짜 비교
				this.date = timeformat.format(date2);		// 날짜가 동일하면 시간형식 적용
			}else {
				this.date = dateFormat.format(date2);		// 날짜가 동일하지 않으면 날짜형식 적용
			}
		}
		catch (Exception e) {}
		
		this.view =view;
	}
	
	
	

	public Gallery(int user_no, String title, String content, String photo) {
		this.user_no = user_no;
		this.title = title;
		this.content = content;
		this.photo = photo;
		
	}


	public int getGpost_no() {
		return gpost_no;
	}

	public void setGpost_no(int gpost_no) {
		this.gpost_no = gpost_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
	
}
