package dto;

public class Comment {

	// 댓글을 달면 생성되는 객체

	private int comment_no;
	private int post_no;
	private int user_no;
	private String user_id;
	private String comment;
	private String comment_date;

	public Comment(int comment_no, int post_no, int user_no, String user_id, String comment, String comment_date) {
		super();
		this.comment_no = comment_no;
		this.post_no = post_no;
		this.user_no = user_no;
		this.user_id = user_id;
		this.comment = comment;
		this.comment_date = comment_date;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment_date() {
		return comment_date;
	}

	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}

}
