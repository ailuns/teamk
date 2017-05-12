package net.pack.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.pack.db.PackBean;
import net.pack.db.PackDAO;

public class PackWriteAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("WriteAction");
		request.setCharacterEncoding("utf-8");

		// upload 폴더 만들기  5*1024*1024
		// MultipartRequest 객체 생성
		ServletContext context=request.getServletContext();
		String realPath=context.getRealPath("/upload");
		int maxSize = 10*1024*1024; // 10MB
		
		MultipartRequest multi=new MultipartRequest(request, realPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

		String subject = multi.getParameter("subject");
		String intro = multi.getParameter("intro");
		String content = multi.getParameter("content");
		String area = multi.getParameter("area");
		String city = multi.getParameter("city");
		String sarea = multi.getParameter("sarea");
		int cost = Integer.parseInt(multi.getParameter("cost"));
		int stock = Integer.parseInt(multi.getParameter("stock"));
		String file1 = multi.getFilesystemName("file1");
		String file2 = multi.getFilesystemName("file2");
		String file3 = multi.getFilesystemName("file3");
		String file4 = multi.getFilesystemName("file4");
		String file5 = multi.getFilesystemName("file5");
		
		
		File file1_1 = multi.getFile("file1");
//		File file2_1 = multi.getFile("file2");
//		File file3_1 = multi.getFile("file3");
//		File file4_1 = multi.getFile("file4");
//		File file5_1 = multi.getFile("file5");
		
		int fileSize1 = (int)file1_1.length();
//		int fileSize2 = (int)file2_1.length();
//		int fileSize3 = (int)file3_1.length();
//		int fileSize4 = (int)file4_1.length();
//		int fileSize5 = (int)file5_1.length();
		
		System.out.println("파일크기" + fileSize1);
		
		if (fileSize1 > maxSize/2)
		{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('첨부파일은 5MB 이하로 첨부해주세요');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		
		
		
		
		
		String sdate = multi.getParameter("startDate");
		
		String aa[] = sdate.split("-");
		
		String serial = aa[0] + aa[1] + aa[2];
		
		System.out.println("Write content >> " + content);
		PackBean pb = new  PackBean();
		PackDAO pdao = new PackDAO();
		
		pb.setIntro(intro);
		pb.setSubject(subject);
		pb.setContent(content);
		pb.setArea(area);
		pb.setCity(city);
		pb.setSarea(sarea);
		pb.setCost(cost);
		pb.setStock(stock);
		pb.setSerial(Integer.parseInt(serial));
		
		if (file1 == null)
			pb.setFile1("");
		else
			pb.setFile1(file1);
		
		if (file2 == null)
			pb.setFile2("");
		else
			pb.setFile2(file2);
		
		if (file3 == null)
			pb.setFile3("");
		else
			pb.setFile3(file3);
		
		if (file4 == null)
			pb.setFile4("");
		else
			pb.setFile4(file4);
		
		if (file5 == null)
			pb.setFile5("");
		else
			pb.setFile5(file5);

//		pdao.insertPack(pb);
//		
//		//ActoinForward 이동정보 담아서 로그인 이동
//		ActionForward forward = new ActionForward();
//		forward.setPath("PackList.po");
//		forward.setRedirect(true);
//		return forward;
		return null;
	}

}
