package dao.mypage;

import dao.DB;

public class DSubDao extends DB {

	// 다이어리 탭 내에서 새로운 게시판을 생성합니다.
	// 새로운 게시판은 싸이월드에서 폴더로 표시되는 서브 메뉴입니다.
	// 이번 프로젝트에서는 메인 메뉴들의 추가, 삭제는 없습니다.

	public DSubDao() {
		super();
	}

	// 1. 다이어리 내에서 새로운 카테고리를 생성후 db에 집어넣는 메소드
	public boolean createCategory() {

		String sql = "insert into dsub(user_no, name) values(?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

	// 2. 카테고리를 삭제하는 메소드
	public boolean deleteCategory() {

		String sql = "";
		try {
			ps = con.prepareStatement(sql);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return false;
	}

	// 3. 카테고리 이름을 수정하는 메소드
	public boolean updateCategory() {
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
