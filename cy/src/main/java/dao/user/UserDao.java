package dao.user;

import java.sql.PreparedStatement;

import dao.DB;
import dto.User;

public class UserDao extends DB {

	public UserDao() {
		super();
	}

	public static UserDao userDao = new UserDao();

	public static UserDao getUserDao() {
		return userDao;
	}

	// 1. 회원가입 메소드
	public boolean createAccount(User user) {
		String sql = "INSERT INTO user(user_id, user_password, user_name, user_phone, user_email, user_gender, user_pic, user_age, nickname, intro) VALUES(?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUser_id());
			ps.setString(2, user.getUser_password());
			ps.setString(3, user.getUser_name());
			ps.setString(4, user.getUser_phone());
			ps.setString(5, user.getUser_email());
			ps.setString(6, user.getUser_gender());
			ps.setString(7, user.getUser_pic());
			ps.setInt(8, user.getUser_age());
			ps.setString(9, user.getNickname());
			ps.setString(10, user.getIntro());
			ps.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

	// 2.1 아이디 체크 메소드

	// 아이디 체크 메소드
	public boolean idCheck(String user_id) {

		String sql = "select user_id from member where user_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			} // 아이디 존재함
		} catch (Exception e) {
		}
		return false; // 아이디 존재하지 않음
	}

	// 로그인 체크 메소드
	public boolean logInCheck(String id, String password) {
		String sql = "select * from user where user_id =? and user_password = ? ";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
		}
		return false;
	}

	// 2.2 아이디를 받아서 회원 고유 번호를 리턴하는 메소드
	public int getLogInIdNo(String id) {
		String sql = "select user_no from user where user_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}

	// 3. 하나의 회원 객체 가져오는 메소드
	// 3.1 full 생성자를 통해 비밀번호를 제외한 모든 정보를 가져옵니다.
	public User user() {

		String sql = "select * from user";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				User user = new User(rs.getInt(1), rs.getString(2), "", rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10),
						rs.getString(11), rs.getInt(12)

				);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}

	// 4. 전체 회원 리스트 가져오는 메소드
	public User getuser(String logInId) {

		String sql = "select * from user where user_id =? ";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, logInId);
			rs = ps.executeQuery();
			if (rs.next()) {
				// 동일한 아이디의 레코드를 비밀번호를 제외한 객체화
				User user = new User(
						rs.getInt(1), rs.getString(2), null, rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10), rs.getString(11));
				return user;
			}
		} catch (Exception e) {
		}
		return null;

	}

	// 5. 회원 정보 수정 메소드

	// 6. 회원 탈퇴 메소드
	public boolean delete(String id, String password) {

		String sql1 = "select * from user where user_id =? and user_password=?"; // 회원검사
		String sql2 = "delete from member where user_id=? and user_password=?"; // 회원삭제
		try {
			ps = con.prepareStatement(sql1);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();

			if (rs.next()) { // 아이디와 비밀번호가 동일한경우에 결과가 있는경우에만 회원삭제
				PreparedStatement ps2 = con.prepareStatement(sql2);
				ps2.setString(1, id);
				ps2.setString(2, password);
				ps2.executeUpdate();
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}

	// 7. 회원 아이디 검색 메소드

	// 8. 아이디 찾기 메소드

	// 9. 비밀번호 찾기 메소드

	// 10. user.no 검색 조지훈12.23
	public int getuser_no(String user_id) {
		String sql = "select user_no from user where user_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
		}
		return 0;
	}

	// 11. 아이디 중복 찾기 메소드
	public boolean isIdExist(String id) {
		String sql = "select user_id from user where user_id = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true; // 이미 아이디가 존재함
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false; // 해당하는 아이디가 존재하지 않음
	}
}
