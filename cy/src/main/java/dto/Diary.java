package dto;

public class Diary {

	private int diary_no;
	private int user_no;

	public Diary(int diary_no, int user_no) {
		super();
		this.diary_no = diary_no;
		this.user_no = user_no;
	}

	public int getDiary_no() {
		return diary_no;
	}

	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

}
