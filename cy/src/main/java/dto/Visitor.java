package dto;


// 방문객이 남기는 방명록 데이터를 저장하는 클래스
public class Visitor {
	
	private int visitor_no;
	private int user_no;
	private String content;
	private String date;
	private String user_id;
	
	public Visitor() {

	}


	public Visitor(int visitor_no, int user_no, String content, String date) {
		this.visitor_no = visitor_no;
		this.user_no = user_no;
		this.content = content;
		this.date = date;
	}

		//방명록 등록시 생성자
	public Visitor(int user_no, String content, String user_id) {
		this.user_no = user_no;
		this.content = content;
		this.user_id = user_id;
	}

	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public int getVisitor_no() {
		return visitor_no;
	}


	public void setVisitor_no(int visitor_no) {
		this.visitor_no = visitor_no;
	}

	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public String getcontent() {
		return content;
	}


	public void setcontent(String content) {
		this.content = content;
	}


	public String getdate() {
		return date;
	}


	public void setdate(String date) {
		this.date = date;
	}
	
	
	
}
