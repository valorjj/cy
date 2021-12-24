package dao.mypage;

import dao.DB;

public class DPostDao extends DB {

	// 다이어리 게시판 - 카테고리 안에서 게시글을 등록하는 DAO 입니다.

	public DPostDao() {
		super();
	}

	// 1. 다이어리 게시물 생성
	public boolean createDiary() {

		String sql = "";
		try {
			ps = con.prepareStatement(sql);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
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
