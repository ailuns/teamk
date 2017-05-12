package net.board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.db.BoardReplyBean;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BoardReplyBean rb = new BoardReplyBean();
		BoardDAO bdao = new BoardDAO();
		
		
		rb.setId(request.getParameter("id"));
		rb.setContent(request.getParameter("content"));
		rb.setGroup_del(Integer.parseInt(request.getParameter("group_del")));
		
		bdao.insertReplyBoard(rb);
		
		ActionForward forward = new ActionForward();
   		forward.setPath("./BoardContent.bo?num="+rb.getGroup_del()+"&pageNum="+request.getParameter("pageNum"));
   		forward.setRedirect(true);	
		
		return forward;
	}
}
