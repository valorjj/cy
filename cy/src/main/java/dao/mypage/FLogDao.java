package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.FLog;

public class FLogDao extends DB {

	public FLogDao() {
		super();
	}

	public static FLogDao fLogdao = new FLogDao();

	public static FLogDao getFLogDao() {
		return fLogdao;
	}

	// 1. 일촌평 등록 메소드
	public boolean createNewFriendComment(String content, int user_no, int friend_no) {

		String sql = "insert into ilchon_log(content, user_no, friend_no) values(?, ?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, content);
			ps.setInt(2, user_no);
			ps.setInt(3, friend_no);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 2. 특정 유저의 일촌평 불러오기
	public ArrayList<FLog> getFLogList(int user_no) {

		ArrayList<FLog> fLogs = new ArrayList<>();

		String sql = "select * from ilchon_log where user_no = ?";

		try {

			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			while (rs.next()) {
				FLog fLog = new FLog(rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5));
				fLogs.add(fLog);
			}
			return fLogs;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
