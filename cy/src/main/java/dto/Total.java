package dto;

public class Total {

	private String content;
	private String date;
	private String category;

	public Total(String content, String date, String category) {
		super();
		this.content = content;
		this.date = date;
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
