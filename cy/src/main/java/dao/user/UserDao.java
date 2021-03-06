package dao.user;

import java.sql.PreparedStatement;
import java.util.ArrayList;

import dao.DB;
import dto.OtherSession;
import dto.Total;
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
						rs.getString(11), rs.getInt(12), rs.getString(13)

				);
				return user;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 5. 회원정보 출력 메소드
	public User getUpdateUser(String id) {
		String sql = "select * from user where user_id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				// 동일한 아이디의 레코드를 비밀번호를 제외한 객체화
				User user = new User(rs.getInt(1), rs.getString(2), null, // 패스워드제외
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8),
						rs.getInt(9), rs.getString(10), rs.getString(11), rs.getInt(12), rs.getString(13));
				return user;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	// 회원수정
	public boolean userUpdate(String type, String newdata, String id) {

		String sql = "update user set " + type + " = ? where user_id =? ";
		try {
			ps = con.prepareStatement(sql);

			ps.setString(1, newdata);
			ps.setString(2, id);

			ps.executeUpdate();

			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;

	}

	// 6. 회원 탈퇴 메소드
	public boolean userDelete(String id, String password) {
		String sql1 = "select * from user where user_id=? and user_password=?"; // 회원검사
		String sql2 = "delete from user where user_id=? and user_password=?"; // 회원삭제
		try {
			ps = con.prepareStatement(sql1);
			ps.setString(1, id);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) { // 아이디와 비밀번호가 동일한 경우의 결과가 있는 경우에만 회원삭제
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

	// 13. 프로필 사진 업데이트 메소드

	public boolean updateUserPic(String file, int user_no) {

		String sql = "UPDATE user SET user_pic = ? WHERE user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, file);
			ps.setInt(2, user_no);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}

	// 14. 프로필 사진 가져오는 메소드

	public String getUserPic(int user_no) {
		String sql = "select user_pic from user where user_no = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	// 15. 내용, 등록 날짜, 카테고리를 골라서 전부 다 합쳐서 가져오는 메소드

	public ArrayList<Total> getTotalContents(int user_no) {

		ArrayList<Total> totals = new ArrayList<>();
		String sql = "select content,date,category from bpost where user_no=" + user_no
				+ " union all select content,date,category from gpost where user_no=" + user_no
				+ " union all select content,date,category from visitor where user_no=" + user_no
				+ " order by date desc limit 0, 4";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Total total = new Total(rs.getString(1), rs.getString(2), rs.getString(3));
				totals.add(total);
			}
			return totals;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
