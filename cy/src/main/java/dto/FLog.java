package dto;

// 일촌이 남기는 일촌 한줄 메시지 정보를 저장하는 클래스입니다. 
public class FLog {

	private int flog_no;
	private int user_no;
	private int friend_no;
	private String flog_content;
	private String flow_date;

	// 1. 전체 생성자
	public FLog(int flog_no, int user_no, int friend_no, String flog_content, String flow_date) {
		this.flog_no = flog_no;
		this.user_no = user_no;
		this.friend_no = friend_no;
		this.flog_content = flog_content;
		this.flow_date = flow_date;
	}

	// 2. 일촌 평 등록할 때 사용되는 생성자입니다.
	public FLog(int user_no, int friend_no, String flog_content) {
		this.user_no = user_no;
		this.friend_no = friend_no;
		this.flog_content = flog_content;
	}

	// 3. 일촌평 불러올때 사용하는 생성자입니다 1
	public FLog(int user_no, String flog_content, String flow_date) {
		this.user_no = user_no;
		this.flog_content = flog_content;
		this.flow_date = flow_date;
	}
	// 3. 일촌평 불러올때 사용하는 생성자입니다 3
	public FLog(int user_no, int friend_no, String flog_content, String flow_date) {
		this.user_no = user_no;
		this.friend_no = friend_no;
		this.flog_content = flog_content;
		this.flow_date = flow_date;
	}

	public int getFlog_no() {
		return flog_no;
	}

	public void setFlog_no(int flog_no) {
		this.flog_no = flog_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getFriend_no() {
		return friend_no;
	}

	public void setFriend_no(int friend_no) {
		this.friend_no = friend_no;
	}

	public String getFlog_content() {
		return flog_content;
	}

	public void setFlog_content(String flog_content) {
		this.flog_content = flog_content;
	}

	public String getFlow_date() {
		return flow_date;
	}

	public void setFlow_date(String flow_date) {
		this.flow_date = flow_date;
	}

}
