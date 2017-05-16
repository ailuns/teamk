package net.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tq.util.*;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;




public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Teamk MemberJoinAction execute()");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String mobile = request.getParameter("mobile");
		String postcode = request.getParameter("postcode");
		
		
		
		MemberBean mb = new MemberBean();
		
		
		
//		String txtPlain = request.getParameter("pass");
//		String txtCipher = ""; 
//		txtCipher = Base64.encode(txtPlain.getBytes());
//
//        String pass = txtCipher;
        
		String repass=request.getParameter("pass");
		String pass = BCrypt.hashpw(repass, BCrypt.gensalt(12)); 

        
		
		mb.setId(id);
		mb.setPass(pass);
		mb.setName(name);
		mb.setPostcode(postcode);
		mb.setAddress1(address1);
		mb.setAddress2(address2);
		mb.setMobile(mobile);
		mb.setEmail(email);
		

		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mb);

		ActionForward forward = new ActionForward();
		forward.setPath("./main.bo");
		forward.setRedirect(true);
		return forward;
		
		
	}

}
