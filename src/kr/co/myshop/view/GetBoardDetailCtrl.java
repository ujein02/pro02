package kr.co.myshop.view;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.Notice;

@WebServlet("/GetBoardDetailCtrl")
public class GetBoardDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static String DRIVER = "com.mysql.cj.jdbc.Driver";
    private final static String URL = "jdbc:mysql://localhost:3306/myshop1?serverTimezone=Asia/Seoul";
    private final static String USER = "root";
    private final static String PASS = "a1234";
    String sql = "";
 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int notiNo = Integer.parseInt(request.getParameter("notiNo"));		
		try{
			// 데이터베이스 연결
			Class.forName(DRIVER);
			String sql = "select * from notice where notino=? ";
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			
			con.setAutoCommit(false); 	//트랜잭션 처리시에는 같이 처리될 수 있도록 오토커밋을 꺼야함
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notiNo);
			ResultSet rs = pstmt.executeQuery();
			
			// 결과를 데이터베이스로부터 받아서 리스트로 저장
			Notice vo = new Notice();
			
			if(rs.next()){
				sql = "update notice set visited=visited+1 where notino=? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, notiNo);
				pstmt.executeUpdate();
				con.commit();
				con.setAutoCommit(true);
				vo.setNotiNo(rs.getInt("notino"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setAuthor(rs.getString("author"));
				vo.setResDate(rs.getString("resdate"));
				
			}
			request.setAttribute("notice", vo);
			
			// notice/boardList.jsp에 포워딩
			RequestDispatcher view = request.getRequestDispatcher("./notice/boardDetail.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e){
			e.printStackTrace();
		} 
			
	}
}


