package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberBean member = new MemberBean();
		
		int result = -1;
		
		member.setMEMBER_ID(request.getParameter("MEMBER_ID"));
		member.setMEMBER_PW(request.getParameter("MEMBER_PW"));
		result = memberdao.isMember(member);
		
		if (result == 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		} else if (result == -1) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		}
		
		//로그인 성공
		session.setAttribute("id", member.getMEMBER_ID()); 
		// session scope에다가 id를 저장시키고 글쓸때 해당id의 이름값으로 게시판 만들고 수정 삭제 가능
		// 그리고 session은 한 웹페이지의 단위(크롬, 사파리, 오페라.. 등)이니까 서버가 돌고 있을땐
		// id를 보존 시키고 서버를 끄면 삭제하는 방식
		
		System.out.println("로그인 성공");
		forward.setRedirect(true);
		forward.setPath("./BoardList.bo"); // .me 에서 .bo 바뀜
		return forward;
	}

}
