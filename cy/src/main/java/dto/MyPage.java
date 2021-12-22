package dto;

public class MyPage {

	private int mypage_no;
	private String mypage_id;
	private int user_no;
	private String mypage_info;
	private int viewcount;

	public MyPage(int mypage_no, String mypage_id, int user_no, String mypage_info, int viewcount) {
		this.mypage_no = mypage_no;
		this.mypage_id = mypage_id;
		this.user_no = user_no;
		this.mypage_info = mypage_info;
		this.viewcount = viewcount;
	}

}
