package dto;

public class OtherSession {
	
	private int other_no;
	private String other_id;
	
	public OtherSession() {
	
	}
	public OtherSession(int other_no, String other_id) {
		this.other_no = other_no;
		this.other_id = other_id;
	}

	public int getOther_no() {
		return other_no;
	}

	public void setOther_no(int other_no) {
		this.other_no = other_no;
	}

	public String getOther_id() {
		return other_id;
	}

	public void setOther_id(String other_id) {
		this.other_id = other_id;
	}
	
	
	
}
