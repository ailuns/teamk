package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.Action;
import net.board.action.ActionForward;
import net.member.db.CommentBean;
import net.member.db.CommentDAO;

public class ContenttWriteAction implements Action{

	/* (non-Javadoc)
	 * @see net.member.action.Action#execute(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CategoryWriteAction excute()");
		
		request.setCharacterEncoding("UTF-8");
		//request 파라미터 정보 가져오기
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		int ref_fk = Integer.parseInt(request.getParameter("ref_fk"));
		//자바빈 패키지 net.member.db 파일 MemberBean
				//MemberBean 객체 생성
		CommentBean comb = new CommentBean();
				//파라미터 정보 => 자바빈 저장
		comb.setId(id);
		comb.setContent(content);
		comb.setRef_fk(ref_fk);
		
		int num = Integer.parseInt(request.getParameter("ref_fk"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		CommentDAO cmodao = new CommentDAO();
		cmodao.insertComment(comb);
		
				
				//ActoinForward 이동정보 담아서 로그인 이동
				ActionForward forward = new ActionForward();
				forward.setPath("./ProductContent.bo?num="+num+ "&pageNum="+pageNum);
				forward.setRedirect(true);
				return forward;
	}



}
