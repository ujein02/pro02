package kr.co.myshop.ctrl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.myshop.vo.Notice;
import sun.rmi.server.Dispatcher;

@WebServlet("/boardListCtrl")
public class boardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/myshop1?serverTimezone=Asia/Seoul";
    private static final String USER = "root";
    private static final String PASS = "a1234";
    String sql = "";
 
    public boardListCtrl() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Class.forName(DRIVER);
		
		String sql = "select * from notice order by notiNo desc ";
		
		try{
			Connection con = DriverManager.getConnection(URL,USER,PASS);
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
		
			// 데이터베이스 연결
			
			
			
			// 결과를 데이터베이스로부터 받아서 리스트로 저장
			List<Notice> notiList = new ArrayList<Notice>();
			
			while(rs.next()){
				Notice vo = new Notice();
				vo.setNotiNo(rs.getInt("notino"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setAuthor(rs.getString("author"));
				vo.setResDate(rs.getString("resdate"));
				notiList.add(vo);
			}
			request.setAttribute("notiList", notiList);
			RequestDispatcher view = request.getRequestDispatcher("./notice/boardList.jsp");
			view.forward(request, response);
			
			rs.close();
			pstmt.close();
			con.close();
		
		// notice/boardList.jsp에 포워딩
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			
		}
	}


