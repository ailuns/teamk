package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class ProductDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum= request.getParameter("pageNum");
		BoardDAO bdao = new BoardDAO();
		BoardBean bb= bdao.getBoard(num);
		request.setAttribute("bb", bb);
		 
		 
		//ActoinForward 이동정보 담아서 로그인 이동
		ActionForward forward = new ActionForward();
		forward.setPath("/board/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
