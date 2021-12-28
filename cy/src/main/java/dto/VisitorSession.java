package dto;

import java.util.HashMap;

public class VisitorSession {

	private HashMap<Integer, String> visitorSession; // 방문자 계정의 고유 번호를 hashmap 을 사용해서 저장합니다.
	// HashMap = { user_no, user_id }

	public VisitorSession(HashMap<Integer, String> visitorSession) {
		this.visitorSession = visitorSession;
	}

}
