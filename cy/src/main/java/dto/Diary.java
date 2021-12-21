package dto;

public class Diary {

	private int diary_no;
	private int mypage_no;
	private String diary_date;
	private String diary_content;

	public Diary(int diary_no, int mypage_no, String diary_date, String diary_content) {
		super();
		this.diary_no = diary_no;
		this.mypage_no = mypage_no;
		this.diary_date = diary_date;
		this.diary_content = diary_content;
	}

	public int getDiary_no() {
		return diary_no;
	}

	public void setDiary_no(int diary_no) {
		this.diary_no = diary_no;
	}

	public int getMypage_no() {
		return mypage_no;
	}

	public void setMypage_no(int mypage_no) {
		this.mypage_no = mypage_no;
	}

	public String getDiary_date() {
		return diary_date;
	}

	public void setDiary_date(String diary_date) {
		this.diary_date = diary_date;
	}

	public String getDiary_content() {
		return diary_content;
	}

	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

}
