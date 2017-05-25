package net.pack.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.pack.db.CategoryDAO;
import net.pack.db.PackBean;
import net.pack.db.PackDAO;

public class PackDateAdd implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("PackDateAdd excute()");
		
		String subject = request.getParameter("subject");
		//디비객체 생성
		PackDAO pdao=new PackDAO();
		
		List date_list;
		date_list = pdao.getPackList(subject);
		
		request.setAttribute("date_list", date_list);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./pack/Package_dateAdd.jsp");
		return forward;
	}

}
