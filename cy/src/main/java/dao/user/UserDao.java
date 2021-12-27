package dao.user;

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

	public boolean logInCheck(String id, String password) {
		String sql = "select * from user where user_id = ? and user_password = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
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

	// 4. 전체 회원 리스트 가져오는 메소드

	// 5. 회원 정보 수정 메소드

	// 6. 회원 탈퇴 메소드

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
