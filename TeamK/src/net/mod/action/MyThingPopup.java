package net.mod.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.ProductBean;
import net.member.db.ProductDAO;
import net.pack.db.PackBean;
import net.pack.db.PackDAO;

public class MyThingPopup implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("MyThingPopUp");
		request.setCharacterEncoding("utf-8");
		
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("PackContent num >> " + num);
		
		ProductDAO pddao = new ProductDAO();
		ProductBean pdb = new ProductBean();
		
		pdb = pddao.getProduct(num);
		
//		pb = pdao.getPack_original(num);
//		System.out.println("MyPackPopup num >> " + pb.getNum());
//		System.out.println("MyPackPopup num >> " + pb.getContent());
		
		request.setAttribute("pdb", pdb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./MyOrder/MyThingPopup.jsp");
		return forward;
	}

}
