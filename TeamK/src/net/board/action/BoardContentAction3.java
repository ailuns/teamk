package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.db.BoardReplyBean;

public class BoardContentAction3 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardContentAction3 execute()");
		request.setCharacterEncoding("utf-8");
		// num , pageNum 파라미터 가져오기
		// BoardDAO bdao 객체 생성
		// 메서드호출() 
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum=request.getParameter("pageNum"); 
		
		BoardDAO bdao = new BoardDAO();
		bdao.updateReadcount(num);
		BoardBean bb = bdao.getBoard(num);
		int rcount = bdao.getBoardReplyCount(num);
		request.setAttribute("bb", bb);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("rcount", rcount);
		
		ActionForward forward = new ActionForward();
   		forward.setPath("./board3/content3.jsp");
   		forward.setRedirect(false);	
		
		return forward;
	}

}
