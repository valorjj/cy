package dto;

public class Media {

	private int media_no;
	private int post_no;
	private String media_url;
	private String user_no;

	public Media(int media_no, int post_no, String media_url, String user_no) {
		super();
		this.media_no = media_no;
		this.post_no = post_no;
		this.media_url = media_url;
		this.user_no = user_no;
	}

	public int getMedia_no() {
		return media_no;
	}

	public void setMedia_no(int media_no) {
		this.media_no = media_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getMedia_url() {
		return media_url;
	}

	public void setMedia_url(String media_url) {
		this.media_url = media_url;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

}
