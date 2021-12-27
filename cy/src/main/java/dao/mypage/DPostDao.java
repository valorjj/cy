package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.DPost;

public class DPostDao extends DB {

	// 다이어리 게시판 - 카테고리 안에서 게시글을 등록하는 DAO 입니다.

	public DPostDao() {
		super();
	}

	public static DPostDao dpostDao = new DPostDao();

	public static DPostDao getdPostDao() {
		return dpostDao;
	}

	// 1. 다이어리 게시물 생성
	public boolean createDiary(DPost dPost) {
		// dpost_no : auto_increment;
		// date : timestamp default now();
		String sql = "INSERT INTO dpost(dsub_no, user_no, content) VALUES(?, ?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dPost.getDsub_no());
			ps.setInt(2, dPost.getUser_no());
			ps.setString(3, dPost.getContent());
			ps.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

	// 1.1 다이어리 게시물 전체 목록 가져오기
	public ArrayList<DPost> getDPostList() {
		ArrayList<DPost> dposts = new ArrayList<>();
		String sql = "SELECT * FROM dpost";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				DPost dPost = new DPost(rs.getInt(1), rs.getString(4), rs.getString(5));
				dposts.add(dPost);
			}
			return dposts;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 1.2 특정 게시판 다이어리 데이터 가져오기
	public ArrayList<DPost> getDPost(int dsub_no) {

		ArrayList<DPost> dposts = new ArrayList<>();

		String sql = "select * from dpost where dsub_no=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dsub_no);
			rs = ps.executeQuery();
			if (rs.next()) {
				DPost dPost = new DPost(rs.getInt(1), rs.getString(4), rs.getString(5));
				dposts.add(dPost);
			}
			return dposts;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 2. 다이어리 수정
	public boolean updateDiary() {

		String sql = "";
		try {
			ps = con.prepareStatement(sql);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

	// 3. 다이어리 삭제
	public boolean deleteDiary() {

		String sql = "";
		try {
			ps = con.prepareStatement(sql);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

}
