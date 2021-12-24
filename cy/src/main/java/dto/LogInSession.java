package dto;

public class LogInSession {

	// 로그인 시 로그인 한 계정의 고유 번호, 아이디를 세션에 저장할 클래스입니다.
	// 로그인 화면에서 세션 값을 부여합니다.
	// 따로 설정해두지 않으면 세션은 기본 30분입니다.

	private int user_no;
	private String user_id;

	public LogInSession(int user_no, String user_id) {
		this.user_no = user_no;
		this.user_id = user_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

}
