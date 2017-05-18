package net.pack.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.pack.db.CategoryDAO;
import net.pack.db.CategoryBean;
import net.pack.db.PackBean;
import net.pack.db.PackDAO;

public class PackList implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PackList excute()");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		// 디비 객체 생성 BoardDAO
		PackDAO pdao = new PackDAO();
		CategoryDAO cdao = new CategoryDAO();
		//전체글 횟수 구하기 int count = getBoardCount()
		int count = 8;
		
		
		//한페이지에 보여줄 글의 갯수
		int pagesize = 6;
		//시작행 구하기   1,  11,  21,  31,  41  ...... 
		
		//현재페이지가 몇페이지인지 가져오기
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum == null)
			pageNum = "1";
		
		int currentPage = Integer.parseInt(pageNum);
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
		
		String area[] = {"서울","부산","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"};
		
		int areaCount[] = new int[11];
		//전체글 횟수 구하기 int count = getBoardCount()
		
		for (int i = 0; i < area.length; i++)
		{
			areaCount[i] = pdao.getPackCount(area[i]);
		}

//		for(int i = 0; i < area.length; i++)
//		{
//			list[i] = pdao.getBoardList(startRow, pagesize, area[i]);
//		}
		
		List list1 = pdao.getBoardList(startRow, pagesize, area[0]);
		List list2 = pdao.getBoardList(startRow, pagesize, area[1]);
		List list3 = pdao.getBoardList(startRow, pagesize, area[2]);
		List list4 = pdao.getBoardList(startRow, pagesize, area[3]);
		List list5 = pdao.getBoardList(startRow, pagesize, area[4]);
		List list6 = pdao.getBoardList(startRow, pagesize, area[5]);
		List list7 = pdao.getBoardList(startRow, pagesize, area[6]);
		List list8 = pdao.getBoardList(startRow, pagesize, area[7]);
		List list9 = pdao.getBoardList(startRow, pagesize, area[8]);
		List list10 = pdao.getBoardList(startRow, pagesize, area[9]);
		List list11 = pdao.getBoardList(startRow, pagesize, area[10]);
		
		List CategoryList = cdao.getCategoryList();

		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("list5", list5);
		request.setAttribute("list6", list6);
		request.setAttribute("list7", list7);
		request.setAttribute("list8", list8);
		request.setAttribute("list9", list9);
		request.setAttribute("list10", list10);
		request.setAttribute("list11", list11);
		request.setAttribute("CategoryList", CategoryList);
		request.setAttribute("areaCount1", areaCount[0]);
		request.setAttribute("areaCount2", areaCount[1]);
		request.setAttribute("areaCount3", areaCount[2]);
		request.setAttribute("areaCount4", areaCount[3]);
		request.setAttribute("areaCount5", areaCount[4]);
		request.setAttribute("areaCount6", areaCount[5]);
		request.setAttribute("areaCount7", areaCount[6]);
		request.setAttribute("areaCount8", areaCount[7]);
		request.setAttribute("areaCount9", areaCount[8]);
		request.setAttribute("areaCount10", areaCount[9]);
		request.setAttribute("areaCount11", areaCount[10]);
		
		request.setAttribute("count", count);
		
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		//ActoinForward 이동정보 담아서 로그인 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./pack/Package.jsp");
		forward.setRedirect(false);
		return forward;
	}
	

}
