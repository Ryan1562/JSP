package ch18.service;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class MailAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host","smtp.naver.com");
		p.put("mail.smtp.auth","true");
		p.put("mail.smtp.port","587");
		p.put("mail.smtp.ssl.protocols","TLSv1.2");
		String to2 = request.getParameter("to");
		String subject = request.getParameter("subject");
		String msg = request.getParameter("msg");
		String myEmail = "kbj010@naver.com"; // 본인 이메일
		Authenticator auth = new MyAuth();
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage mm = new MimeMessage(session);
		try {
			mm.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress(myEmail);  // 보내는 사람
			mm.setFrom(from);
			
			InternetAddress to = new InternetAddress(to2); // 받는 사람
			mm.setRecipient(Message.RecipientType.TO, to);
			
			mm.setSubject(subject, "utf-8");  // 제목
			mm.setText(msg, "utf-8");   // 내용
			mm.setHeader("content-type","text/html");
			
			javax.mail.Transport.send(mm);
			request.setAttribute("msg","보내기 성공  !!!");
		}catch (Exception e) {
			e.printStackTrace(); // 에러 내용 출력
			request.setAttribute("msg","보내기 실패  !!!");
		}
		return "mailto";
	}
	class MyAuth extends Authenticator {
		PasswordAuthentication account;
		public MyAuth() {
			String id = "본인 네이버 아이디";  // kbj010
			String pw = "본인 네이버 암호";   // 본인 네이버 암호
			account = new PasswordAuthentication(id, pw);
		}
		protected PasswordAuthentication getPasswordAuthentication() {
			return account;
		}
	}
}