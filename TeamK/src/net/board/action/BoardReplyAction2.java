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
		BoardBean bb = new BoardBean();
		
		rb.setId(request.getParameter("id"));
		rb.setContent(request.getParameter("content"));
		rb.setGroup_del(Integer.parseInt(request.getParameter("group_del")));
		String wEmail = request.getParameter("wEmail");
		String wContent = request.getParameter("wContent");
		String content = request.getParameter("content");
		
	
		bdao.insertReplyBoard(rb);
		
		
		
String email = wEmail;//받는사람의 이메일 주소
		
			
		String sender="insup0117@naver.com";
		String receiver= email;
		String subject = "답변이 왔습니다.";
		
		String content1=  "문의내용 : ["+wContent+"] <br> 답변내용 : ["+content+"]";
		
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
   		forward.setPath("./BoardContent2.bo?num="+rb.getGroup_del()+"&pageNum="+request.getParameter("pageNum"));
   		forward.setRedirect(true);	
		
		return forward;
		
		
	}
}
