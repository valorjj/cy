package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {

	// mysql db �� �뿰�룞�븯�뒗 而ㅻ꽖�꽣
	// 媛곴컖�쓽 dao �뿉�꽌 �긽�냽 諛쏆븘�꽌 �궗�슜�븳�떎.

	protected Connection con;
	protected ResultSet rs;
	protected PreparedStatement ps;

	// 2. �깮�꽦�옄
	public DB() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cy?serverTimezone=UTC", "root", "1234");
			//con = DriverManager.getConnection("jdbc:mysql://localhost:3307/cy?serverTimezone=UTC","root","1234");
			System.out.println("[mysql DB �뿰�룞�꽦怨�]");
		} catch (Exception e) {
			System.out.println("[mysql DB �뿰�룞�떎�뙣]" + e);
			e.printStackTrace();
		}

	}

}
