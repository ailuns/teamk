package net.mod.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.mod.action.ActionForward;
import net.pack.db.PackBean;
import net.pack.db.PackDAO;

public class MyPackPopup implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MyPackPopUp");
		request.setCharacterEncoding("utf-8");
		
		
		
		String subject = request.getParameter("subejct");
		System.out.println("PackContent subject >> " + subject);
		
		PackDAO pdao = new PackDAO();
		PackBean pb = new PackBean();
		
		pb = pdao.getPack(subject);
		System.out.println("MyPackPopup num >> " + pb.getNum());
		System.out.println("MyPackPopup num >> " + pb.getContent());
		
		request.setAttribute("pb", pb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./MyOrder/MyPackPopup.jsp");
		return forward;
	}

}
