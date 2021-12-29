package dto;

import dao.user.UserDao;

public class Reply {
	private int reply_no;
	private int gpost_no;
	private int user_no;
	private String content;
	private String date;
	private String writer;
	
	public Reply() {}

	public Reply(int reply_no, int gpost_no,int user_no, String content, String date) {
		this.reply_no = reply_no;
		this.gpost_no = gpost_no;
		this.user_no = user_no;
		this.content = content;
		this.date =date;
		this.writer = UserDao.getUserDao().getUserId(user_no);
	}
	
	public Reply(int user_no, int gpost_no, String content) {
		this.user_no = user_no;
		this.gpost_no = gpost_no;
		this.content = content;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
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
