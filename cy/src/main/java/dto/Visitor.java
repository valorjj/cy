package dto;


// 방문객이 남기는 방명록 데이터를 저장하는 클래스
public class Visitor {
	
	private int visitor_no;
	private int user_no;
	private String content;
	private String log_date;

	
	public Visitor() {

	}


	public Visitor(int visitor_no, int user_no, String content, String log_date) {
		this.visitor_no = visitor_no;
		this.user_no = user_no;
		this.content = content;
		this.log_date = log_date;
	}

		//방명록 등록시 생성자
	public Visitor(int user_no, String content) {
		this.user_no = user_no;
		this.content = content;
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


	public String getLog_date() {
		return log_date;
	}


	public void setLog_date(String log_date) {
		this.log_date = log_date;
	}
	
	
	
}
