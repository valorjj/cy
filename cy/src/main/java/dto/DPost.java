package dto;

public class DPost {

	private int dpost_no;
	private int dsub_no;
	private String content;

	public DPost(int dpost_no, int dsub_no, String content) {
		super();
		this.dpost_no = dpost_no;
		this.dsub_no = dsub_no;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
