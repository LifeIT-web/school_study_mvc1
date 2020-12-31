package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.board.db.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		ActionForward forward = new ActionForward();
		boolean result = false;
		boolean usercheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO boarddao = new BoardDAO();
		usercheck = boarddao.isBoardWriter(num, (String)session.getAttribute("id"));
		
		if (usercheck == false) {
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('삭제  할 권한이 없습니다.');");
			out.println("location.href='./BoardList.bo';");
			out.println("</script>");
			
			return null;
			
		}
		
		result = boarddao.boardDelete(num);
		
		if (result == false) {
			System.out.println("삭제 실패");
			return null;
		}
		
		System.out.println("삭제 완료");
		
		forward.setRedirect(true);
		forward.setPath("./BoardList.bo");
		
		return forward;
		
	}

}
