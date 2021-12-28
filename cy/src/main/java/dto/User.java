package dto;

public class User {

	private int user_no; // 회원 고유 번호
	private String user_id; // 회원 아이디
	private String user_password; // 회원 비밀번호
	private String user_name; // 회원 이름
	private String user_phone; // 회원 전화번호
	private String user_email; // 회원 이메일
	private String user_gender; // 회원 성별 [M, F]
	private String user_pic; // 회원 프로필 사진
	private int user_age; // 회원 나이
	private String nickname; // 홈페이지 별명
	private String intro; // 홈페이지 소개글
	private int view; // 조회수
	
	// 1. 빈 생성자
	public User() {
		// TODO Auto-generated constructor stub
	}
	// 1. full 생성자
	public User(int user_no, String user_id, String user_password, String user_name, String user_phone,
			String user_email, String user_gender, String user_pic, int user_age, String nickname, String intro,
			int view) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_pic = user_pic;
		this.user_age = user_age;
		this.nickname = nickname;
		this.intro = intro;
		this.view = view;
	}
	// 1. 홈페이지 별명, 홈페이지 소개글, 방문자 수 제외한 생성자
	public User(int user_no, String user_id, String user_password, String user_name, String user_phone,
			String user_email, String user_gender, String user_pic, int user_age) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_pic = user_pic;
		this.user_age = user_age;
	}
	
	
	// 1. 유저 고유 번호, 방문자 수 제외한 생성자
	public User(String user_id, String user_password, String user_name, String user_phone, String user_email,
			String user_gender, String user_pic, int user_age, String nickname, String intro) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_pic = user_pic;
		this.user_age = user_age;
		this.nickname = nickname;
		this.intro = intro;
	}
	
	
	// 1. view 만 제외한 풀 생성자 
	public User(int user_no, String user_id, String user_password, String user_name, String user_phone,
			String user_email, String user_gender, String user_pic, int user_age, String nickname, String intro) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_pic = user_pic;
		this.user_age = user_age;
		this.nickname = nickname;
		this.intro = intro;
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

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_pic() {
		return user_pic;
	}

	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

}
