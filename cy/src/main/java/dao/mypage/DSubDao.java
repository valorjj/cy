package dao.mypage;

import java.util.ArrayList;

import dao.DB;
import dto.DSub;

public class DSubDao extends DB {

	// 다이어리 탭 내에서 새로운 게시판을 생성합니다.
	// 새로운 게시판은 싸이월드에서 폴더로 표시되는 서브 메뉴입니다.
	// 이번 프로젝트에서는 메인 메뉴들의 추가, 삭제는 없습니다.

	public DSubDao() {
		super();
	}

	public static DSubDao dsubDao = new DSubDao();

	public static DSubDao getdsubDao() {
		return dsubDao;
	}

	// 1. 다이어리 내에서 새로운 카테고리를 생성후 db에 집어넣는 메소드
	public boolean createCategory(int user_no, String name) {
		String sql = "insert into dsub(user_no, name) values(?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, user_no);
			ps.setString(2, name);
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

	// 4. 전체 카테고리를 리스트로 반환하는 메소드
	public ArrayList<DSub> getDSubList() {
		ArrayList<DSub> dsubs = new ArrayList<DSub>();
		String sql = "select * from dsub";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				DSub dsub = new DSub(rs.getInt(1), rs.getInt(2), rs.getString(3));
				dsubs.add(dsub);
			}
			return dsubs;

		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}

		return null;

	}

}
