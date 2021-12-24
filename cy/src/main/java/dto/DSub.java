package dto;

public class DSub {

	private int dsub_no;
	private int user_no;
	private String name;

	public DSub(int dsub_no, int user_no, String name) {
		this.dsub_no = dsub_no;
		this.user_no = user_no;
		this.name = name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
