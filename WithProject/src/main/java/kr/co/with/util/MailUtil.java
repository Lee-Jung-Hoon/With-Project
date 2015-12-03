package kr.co.with.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import kr.co.with.joingroup.vo.JoinGroupVO;
import kr.co.with.studygroup.member.vo.MemberVO;
import kr.co.with.studygroup.vo.StudyGroupVO;

public class MailUtil {
	// 관리자 지메일 아이디 / 비밀번호 Fix
	private static final String HOST = "smtp.naver.com";
	private static final String USERNAME = "ijhoon4327@naver.com";
	private static final String PASSWORD = "ca24214";

	public void SendMailForReserve(MemberVO member, StudyGroupVO group, JoinGroupVO join, String joinType) throws MessagingException {

		// 메일 내용
		String recipient = member.getId();
		String subject = "";
		String body = "";

		if (joinType.equals("선착순")) {
			subject = recipient + "님의 "+group.getGroupName()+" 가입 정보 입니다.";
		} else {
			subject = recipient + "님의 "+group.getGroupName()+" 가입 신청 정보 입니다.";
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
