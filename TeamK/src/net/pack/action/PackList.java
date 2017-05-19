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
		
		// 지역별 패키지 갯수 받을 저장 장소
		int areaCount[] = new int[11];
		
		// 지역별 패키지 갯수 구하기
		for (int i = 0; i < area.length; i++)
		{
			areaCount[i] = pdao.getPackCount(area[i]);
		}
		
		// 지역별 패키지 갯수 넘기기
		for(int i = 0; i < areaCount.length; i++)
		{
			request.setAttribute("areaCount"+i, areaCount[i]);
		}
		
		// 지역별 패키지 리스트 받을 저장 장소
		List list[] = new List[11];
		
		// 지역별 패키지 리스트 구하기
		for(int i = 0; i < area.length; i++)
		{
			list[i] = pdao.getBoardList(startRow, pagesize, area[i]);
		}

		// 지역별 패키지 리스트 보내기
		for(int i = 0; i < list.length; i++)
		{
			request.setAttribute("list"+i, list[i]);
		}
		
		// 지역 분류명 리스트 구하기&보내기
		List CategoryList = cdao.getCategoryList();
		request.setAttribute("CategoryList", CategoryList);

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
