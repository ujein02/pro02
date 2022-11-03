package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IdCheckProCtrl")
public class IdCheckProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final static String URL = "jdbc:mysql://localhost:3306/myshop1?serverTimezone=Asia/Seoul";
    private final static String USER = "root";
    private final static String PASS = "a1234";
    String sql = "";
    
    
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cusId = request.getParameter("cusid");
 		try{
			// 데이터베이스 연결
			Class.forName(DRIVER);
			String sql = "select * from custom where cusId=? ";
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = null;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cusId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("<p>해당 아이디는 사용하실 수 없습니다.</p>");
				response.sendRedirect("./custom/idCheck.jsp");
			} else {
				System.out.println("<p>사용 가능한 아이디 입니다.</p>");
				System.out.println("<a href='javascript:apply(\""+cusId+"\")'>"+cusId+"[적용]</a>");
				System.out.println("<p>적용을 누르면, 입력하신 아이디를 사용할 수 있습니다.</p>");
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e){
			e.printStackTrace();
		} 
			
	}
}


