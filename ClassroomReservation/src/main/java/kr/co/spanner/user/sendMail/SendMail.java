package kr.co.spanner.user.sendMail;
 
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import kr.co.spanner.user.reservation.vo.ReservationVO;
 
public class SendMail {
	
	// 관리자 지메일 아이디 / 비밀번호 Fix
	private static final String HOST = "smtp.gmail.com";
	private static final String USERNAME = "creator898@gmail.com";
	private static final  String PASSWORD = "jyq075103";
	
    public void SendMailForReserve(ReservationVO res) throws MessagingException{

        // 메일 내용
    	String recipient = res.getId();
    	String subject = "";
    	String body = "시작 시간 :" + res.getStartTime() + ":00 종료시간 : "+Integer.parseInt(res.getStartTime())+res.getUsingTime() +":00"
						  + "사용 목적 : "+ res.getResFor();
    	
    	if(res.getStatus() == 1) {
	        subject = res.getId()+"의 예약 정보 입니다.";
	        body.toString();
    	} else {
    		subject = res.getId()+"의 예약취소 정보 입니다.";
    		body.toString();
    	}
        
    	//properties 설정
        Properties props = new Properties();
        props.put("mail.smtps.auth", "true");
        
        // 메일 세션
        Session session = Session.getDefaultInstance(props);
        MimeMessage msg = new MimeMessage(session);
 
        // 메일 관련
        msg.setSubject(subject);
        msg.setText(body);
        msg.setFrom(new InternetAddress(USERNAME));
        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
 
        // 발송 처리
        Transport transport = session.getTransport("smtps");
        transport.connect(HOST, USERNAME, PASSWORD);
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();     
    }
}