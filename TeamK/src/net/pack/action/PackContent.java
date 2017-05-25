package net.pack.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.pack.db.CategoryDAO;
import net.pack.db.PackBean;
import net.pack.db.PackDAO;
import net.reply.db.ReplyBean;
import net.reply.db.ReplyDAO;

public class PackContent implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		int num = Integer.parseInt(request.getParameter("num"));
		String repageNum = request.getParameter("repageNum");
		PackDAO pdao = new PackDAO();
		PackBean pb = new PackBean();
		ReplyDAO rdao = new ReplyDAO();
		ReplyBean rb = new ReplyBean();
		CategoryDAO cdao = new CategoryDAO();
		
		System.out.println("PackContent num >> " + num);
		System.out.println("PackContent pagenum >> " + repageNum);
		
		pb = pdao.getPack(num);
		pdao.updateReadcount(num);
		
		System.out.println("area >> " + pb.getArea());
		System.out.println("Sarea >> " + pb.getSarea());
		
		session.setAttribute("PackBean", pb);
		
		List date_list;
		date_list = pdao.getPackList(pb.getSubject());
		
		request.setAttribute("date_list", date_list);
		
		
		//전체글 횟수 구하기 int count = getBoardCount()
		int count = rdao.getCommentCount(num);//pdao.getBoardCount();
		
		//한페이지에 보여줄 글의 갯수
		int pagesize = 5;
		//시작행 구하기   1,  11,  21,  31,  41  ...... 
		
		//현재페이지가 몇페이지인지 가져오기
		if(repageNum == null)
			repageNum = "1";
		
		int currentPage = Integer.parseInt(repageNum);
		int startRow = (currentPage-1)*pagesize+1;
		
		
		//끝행 구하기
		int endRow = currentPage*pagesize;	
		// 페이지 갯수 구하기
		int pageCount = count/pagesize + (count%pagesize == 0 ? 0 : 1);
		//한 화면에 보여줄 페이지 번호 갯수
		int pageBlock = 10;
		// 시작 페이지 구하기
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		// 끝페이지 구하기
		int endPage = startPage+pageBlock-1;

		List replylist = rdao.getCommentList(startRow, pagesize, num);
		request.setAttribute("replylist", replylist);
		
		// 지역 분류명 리스트 구하기&보내기
		List CategoryList = cdao.getCategoryList();
		request.setAttribute("CategoryList", CategoryList);

		request.setAttribute("count", count);
		request.setAttribute("repageNum", repageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pagesize", pagesize);
		
		System.out.println("count >> " + count);
		System.out.println("repageNum >> " + repageNum);
		System.out.println("pageCount >> " + pageCount);
		System.out.println("pageBlock >> " + pageBlock);
		System.out.println("startPage >> " + startPage);
		System.out.println("endPage >> " + endPage);
		System.out.println("currentPage >> " + currentPage);
		System.out.println("pagesize >> " + pagesize);
				
		
		
		
		
		
		
		//ActoinForward 이동정보 담아서 로그인 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./pack/Package_content.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
