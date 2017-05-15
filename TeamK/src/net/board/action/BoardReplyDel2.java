package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.BoardReplyBean;

public class BoardReplyDel2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println("BoardReplyDel2");
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		
		BoardDAO bdao = new BoardDAO();
		bdao.deleteReply(num);
		
		BoardReplyBean rb = new BoardReplyBean();
		
		rb.setGroup_del(Integer.parseInt(request.getParameter("group_del")));
		
		ActionForward forward = new ActionForward();
   		forward.setPath("./BoardContent2.bo?num="+rb.getGroup_del()+"&pageNum="+request.getParameter("pageNum"));
   		forward.setRedirect(true);	
		
		return forward;
		
	}

}
