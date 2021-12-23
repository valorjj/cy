package dao.mypage;

import dao.DB;

public class DPostDao extends DB{
	
	
	// 다이어리 내에 존재하는 서브 게시판에 게시글을 업로드 할 때 사용할 dao 입니다.
	// 하지만 생각해보니, DSubDao (서브 게시판 dao) 에서 게시물 등록, 수정, 삭제를 하면 될 것 같습니다. 
	
	
	public DPostDao() {
		super();
	}
	

}
