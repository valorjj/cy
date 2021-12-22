package dto;

public class DSub {

	private int dsub_no;
	private int diary_no;

	public DSub(int dsub_no, int diary_no) {
		super();
		this.dsub_no = dsub_no;
		this.diary_no = diary_no;
	}

	public int getDsub_no() {
		return dsub_no;
	}

	public void setDsub_no(int dsub_no) {
		this.dsub_no = dsub_no;
	}

	public int getDiary_no() {
		return diary_no;
	}

	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}

}
