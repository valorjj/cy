package dto;

public class Friend {

	private int user_no; //
	private int friend_no; // 친구 아이디 고유 번호

	public Friend(int user_no, int friend_no) {
		super();
		this.user_no = user_no;
		this.friend_no = friend_no;
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

}
