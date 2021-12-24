package dto;

public class DPost {

	private int dpost_no;
	private int dsub_no;
	private int user_no;
	private String content;
	private String date;

	public DPost(int dpost_no, int dsub_no, int user_no, String content, String date) {
		this.dpost_no = dpost_no;
		this.dsub_no = dsub_no;
		this.user_no = user_no;
		this.content = content;
		this.date = date;
	}

	public int getDpost_no() {
		return dpost_no;
	}

	public void setDpost_no(int dpost_no) {
		this.dpost_no = dpost_no;
	}

	public int getDsub_no() {
		return dsub_no;
	}

	public void setDsub_no(int dsub_no) {
		this.dsub_no = dsub_no;
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

}
