package net.board.action;

import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.board.db.BoardReplyBean;
import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class BoardReplyAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyAction execute()");
		request.setCharacterEncoding("utf-8");
		
		BoardReplyBean rb = new BoardReplyBean();
		BoardDAO bdao = new BoardDAO();
		
		String rid = request.getParameter("rId");
		String rcontent = request.getParameter("rContent");
		int rNum = Integer.parseInt(request.getParameter("rNum"));
		String pageNum = request.getParameter("pageNum");
		String wEmail = request.getParameter("wEmail");
		String wContent = request.getParameter("wContent");
	
		
		
		rb.setId(rid);
		rb.setGroup_del(rNum);
		rb.setContent(rcontent);
		
		bdao.insertReplyBoard(rb);
		int rcount = bdao.getBoardReplyCount(rNum);
		List<BoardReplyBean> lrb = bdao.getBoardReplyList(rNum);
		request.setAttribute("lrb", lrb);
		request.setAttribute("rcount", rcount);
		request.setAttribute("rNum", String.valueOf(rNum));
		request.setAttribute("wEmail", wEmail);
		request.setAttribute("wContent", wContent);
		
		System.out.println("rid : "+rid);
		System.out.println("wEmail : "+wEmail);
		System.out.println("wContent : "+wContent);
		System.out.println("rcontent : "+rcontent);
		
String email = wEmail;//받는사람의 이메일 주소
		
			
		String sender="insup0117@naver.com";
		String receiver= email;
		String subject = "답변이 왔습니다.";
		
		String content1=  "문의내용 : ["+wContent+"] <br> 답변내용 : ["+rcontent+"]";
		
		String server = "smtp.naver.com";
		
		try{
			Properties properties = new Properties();
			properties.put("mail.smtp.host", server);
			Session s = Session.getDefaultInstance(properties, null);
			Message message = new MimeMessage(s);
			
			Address sender_address=new InternetAddress(sender);
			Address receiver_address=new InternetAddress(receiver);
			
			message.setHeader("content-type","text/html;charset=utf-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO,receiver_address);
			message.setSubject(subject);
			message.setContent(content1,"text/html;charset=utf-8");
			message.setSentDate(new java.util.Date());
			
			Transport transport= s.getTransport("smtp") ;
			transport.connect(server,"insup0117","spdlqj0117");
			transport.sendMessage(message,message.getAllRecipients());
			transport.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		ActionForward forward = new ActionForward();
   		forward.setPath("./board2/reply2.jsp");
   		forward.setRedirect(false);	
		
		return forward;
		
		
	}
}
