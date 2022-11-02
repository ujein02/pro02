package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InsertBoardProCtrl")
public class InsertBoardProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/myshop1?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql = "";
    int cnt = 0;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		try{
			// 데이터베이스 연결
			Class.forName(DRIVER);
			sql = "insert into notice(title, content, author) values (?,?,?)";
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, author);
			cnt = pstmt.executeUpdate();
			// 결과를 데이터데이스로부터 받음
			
			if(cnt>=1){
				response.sendRedirect("GetBoardListCtrl");			// 결과값이 있으면 공지사항목록으로 이동
			} else {
				response.sendRedirect("./notice/insertBoard.jsp");	// 결과값이 없으면 공지사항 등록창으로 이동
			}
			pstmt.close();
			con.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}

}
