package dao.user;

import dao.DB;
import dto.OtherSession;
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

	// 2.3 post에 writer를 사용하기 위한 메소드
	public String getUserId(int user_no) {

		String sql = "select user_id from user where user_no=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
		}
		return null;

	}

	// 3. 하나의 회원 객체 가져오는 메소드
	// 3.1 full 생성자를 통해 비밀번호를 제외한 모든 정보를 가져옵니다.
	public User getUser(int user_no) {

		String sql = "select * from user where user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				User user = new User(rs.getInt(1), rs.getString(2), "", rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10),
						rs.getString(11), rs.getInt(12)

				);
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 4. 전체 회원 리스트 가져오는 메소드

	// 5. 회원 정보 수정 메소드

	// 6. 회원 탈퇴 메소드

	// 7. 회원 아이디 검색 메소드 [ 다른 사람 페이지로 넘어갈때 ]
	public OtherSession getother(String other) {
		String sql = "select * from user where user_id like '%" + other + "%'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				OtherSession otherSession = new OtherSession(rs.getInt(1), rs.getString(2));
				return otherSession;
			}
		} catch (Exception e) {
			System.out.println("getother sql 오류 :" + e);
		}
		return null;
	}

	// 7.1 방명록 작성시 회원 아이디 넣기 위한 sql [ 조지훈 12.27 ]
	public String getid(int user_no) {
		String sql = "select user_id from user where user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("회원아이디 가져오기 실패 :" + e);
		}
		return null;
	}
	// 7.1 끝
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

	// 12. 홈페이지 조회수 증가 메소드
	// 해당 유저 홈페이지에 접근하면 조회수를 증가시킵니다.
	public boolean updateViewCount(int user_no) {
		String sql = "UPDATE user SET view = view + 1 WHERE user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 12. 자기 소개 글 수정 메소드
	public boolean updateUserIntro(String intro, int user_no) {

		String sql = "update user set intro = ? where user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, intro);
			ps.setInt(2, user_no);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

}
