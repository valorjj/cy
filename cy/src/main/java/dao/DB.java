package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {

	// mysql db 와 연동하는 커넥터
	// 각각의 dao 에서 상속 받아서 사용한다.

	protected Connection con;
	protected ResultSet rs;
	protected PreparedStatement ps;

	// 2. 생성자
	public DB() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			// con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cy?serverTimezone=UTC", "root", "1234");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/cy?serverTimezone=UTC","root","1234");
			System.out.println("[mysql DB 연동성공]");
		} catch (Exception e) {
			System.out.println("[mysql DB 연동실패]" + e);
			e.printStackTrace();
		}

	}

}
