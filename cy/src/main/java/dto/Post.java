package dto;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dao.user.UserDao;

public class Post {

	private int bpost_no;
	private int user_no;
	private String title;
	private String content;
	private String date;
	private int view;
	private String writer;
	private String category;

	public Post() {
	}

	public Post(int bpost_no, int user_no, String title, String content, String date, int view) {
		super();
		this.bpost_no = bpost_no;
		this.user_no = user_no;
		this.title = title;
		this.content = content;
		this.date = date;
		// 1. 작성자 = 회원번호를 이용한 아이디 찾아서 대입
		this.writer = UserDao.getUserDao().getUserId(user_no);
		// 2. 등록날짜와 오늘날짜와 동일하면 시간 아니면 날짜 표시
		Date today = new Date(); // 1. 오늘날짜
		SimpleDateFormat datetimeformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); // 날짜,시간형식
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식
		SimpleDateFormat timeformat = new SimpleDateFormat("a hh:mm"); // 시간 형식
		try {
			Date date2 = datetimeformat.parse(date); // [문자열]DB -> 날짜/시간 형식 변환
			if (dateFormat.format(date2).equals(dateFormat.format(today))) { // 등록날짜 = 오늘날짜 비교
				this.date = timeformat.format(date2); // 날짜가 동일하면 시간형식 적용
			} else {
				this.date = dateFormat.format(date2); // 날짜가 동일하지 않으면 날짜형식 적용
			}
		} catch (Exception e) {
		}

		this.view = view;
		this.category = "게시판";

	}

	public Post(String title, String content, int user_no) {
		this.title = title;
		this.content = content;
		this.user_no = user_no;
		this.category = "게시판";
	}

	public Post(int bpost_no, String title, String content) {
		this.bpost_no = bpost_no;
		this.title = title;
		this.content = content;
		this.category = "게시판";
	}

	public int getBpost_no() {
		return bpost_no;
	}

	public void setBpost_no(int bpost_no) {
		this.bpost_no = bpost_no;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
