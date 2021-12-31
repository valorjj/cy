package dao.user;

import java.util.ArrayList;

import dao.DB;

public class FriendDao extends DB {

	public FriendDao() {
		super();
	}

	public static FriendDao friendDao = new FriendDao();

	public static FriendDao getFriendDao() {
		return friendDao;
	}

	// 1. 일촌 등록/삭제 메소드
	public int updateFriend(int friend_no, int user_no) {

		String sql = null;
		sql = "select * from friend where friend_no =" + friend_no + " and user_no = " + user_no;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) { // 좋아요 기존에 존재하면
				sql = "delete from friend where friend_no=" + friend_no + " and user_no=" + user_no;
				ps = con.prepareStatement(sql);
				ps.executeUpdate();
				return 1; // 좋아요 제거
			} else { // 좋아요 기존에 존재하지 않으면
				sql = "insert into friend(friend_no , user_no) values(" + friend_no + "," + user_no + ")";
				ps = con.prepareStatement(sql);
				ps.executeUpdate();
				return 2; // 좋아요 추가
			}
		} catch (Exception e) {
		}
		return 0; // DB 오류
	}

	// 2. 일촌인지 아닌지 판별하는 메소드
	public boolean isFriend(int friend_no, int user_no) {

		String sql = "select * from friend where friend_no = ? and user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, friend_no);
			ps.setInt(2, user_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 3. 일촌 목록 가져오기
	public ArrayList<Integer> getMyFriend(int user_no) {

		ArrayList<Integer> friends = new ArrayList<>();

		String sql = "select friend_no from friend where user_no = ?";

		try {

			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();

			while (rs.next()) {
				// while 문을 돌려서 친구 목록을 가져옵니다 (친구 고유 번호)
				friends.add(rs.getInt(1));
			}
			return friends;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
