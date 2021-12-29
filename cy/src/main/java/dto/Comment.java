package dto;

import dao.user.UserDao;

public class Comment {

	// 댓글을 달면 생성되는 객체

	private int comment_no;
	private int bpost_no;
	private int user_no;
	private String content;
	private String date;
	private String writer;
	
	public Comment() {}

	public Comment(int comment_no, int bpost_no,int user_no, String content, String date) {
		this.comment_no = comment_no;
		this.bpost_no = bpost_no;
		this.user_no = user_no;
		this.content = content;
		this.date =date;
		this.writer = UserDao.getUserDao().getUserId(user_no);
	}
	
	public Comment(int user_no, int bpost_no, String content) {
		this.user_no = user_no;
		this.bpost_no = bpost_no;
		this.content = content;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}


	
	
	
}
