package egovframework.example.admin.sidebar.member.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.concurrent.Future;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;

import egovframework.example.admin.sidebar.member.domain.AdminMemberEmailVO;

// 지금 리턴 타입을 Futrue<?>로 받을 경우 쓰레드를 2개를 쓰는거 같지만 동기방식으로 움직인다.
// 그러나 void로 할 경우 비동기 방식으로 되서 응답속도가 빠르다.
// 뭔가 이상하다... 일단 리턴타입을 void로 하니 되긴한다.

// 이게 되게 재밌는게 지금 sendEmail메소드를 리턴타입을 void로만 두면 비동기는 제대로 실행된다.
// 그래서 생각을 해보니 @Async는 리턴타입을 2개를 받을 수 있는데 java.util.concurrent.Future와 void이다.
// 즉, '리턴타입이 될 수 있다'이지 저거를 쓴다고 void처럼 바로 실행을 종료하는 건 아닌거 같다.
// 그런데 최범균씨 책에게는 'execute()나 submit()은 메서드를 실행하면 작업 실행 여부에 상관없이 메서드가 즉시 리턴' 된다고 나와있는데 왜 안될까...
@Service
public class MemberEamilService {
	@Autowired
	private ThreadPoolTaskExecutor emailTaskExecutor;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// @Async("mailExecutor")
	public void sendEmail(AdminMemberEmailVO emailVO) throws Exception{
		Future<?> result = emailTaskExecutor.submit(()->{
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
				
				List<String> idList = emailVO.getIdList();
				List<String> emailList = emailVO.getEmailList();
				List<String> nameList = emailVO.getNameList();
				// InternetAddress[] addresses = getInternetAddresses(emailVO);
						
				for(int i = 0 ; i < idList.size() ; i++){
					String content = precessContentWithId(idList.get(i), emailVO.getContent());
					
					messageHelper.setFrom("dbsdy1235@gmail.com", "잡큐");
					messageHelper.setTo(new InternetAddress(emailList.get(i), nameList.get(i), "utf-8"));
					messageHelper.setSubject(emailVO.getTitle());
					messageHelper.setText(content, true);
					
					mailSender.send(message);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		});
		
	}
	
	private String precessContentWithId(String id, String content){
		content = content.replace("[ID]", id);
		
		return content;
	}
	
	private InternetAddress[] getInternetAddresses(AdminMemberEmailVO emailVO) throws UnsupportedEncodingException{
		InternetAddress[] addresses = new InternetAddress[emailVO.getEmailList().size()];
		
		for (int i = 0; i < addresses.length; i++) 
			addresses[i] = new InternetAddress(emailVO.getEmailList().get(i), emailVO.getNameList().get(i), "utf-8");
		
		return addresses;
	}
	
	private String processContentWithPwd(){
		return "";
	}
}
