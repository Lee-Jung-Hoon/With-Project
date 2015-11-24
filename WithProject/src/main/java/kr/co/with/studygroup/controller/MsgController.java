package kr.co.with.studygroup.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.service.MsgService;
import kr.co.with.studygroup.vo.MsgVO;


@Controller
@RequestMapping("/msg")
public class MsgController {
 
	@Autowired
	private MsgService service;

	@RequestMapping("/sendMsg.do")
	@ResponseBody
	public void insertMsg(MsgVO msg) throws Exception{
		service.insertMsg(msg);
	}
	@RequestMapping("/msgList.json")
	@ResponseBody
	public List<MsgVO> selectList(HttpServletRequest req) throws Exception{
		String recvId = req.getParameter("recvId");
		System.out.println("넘어왔니 ?"+recvId);
		return service.selectList(recvId);
	}
	@RequestMapping("/msgInfo.do")
	@ResponseBody
	public MsgVO selectMsgInfo(HttpServletRequest req) throws Exception{
	    int msgNo = Integer.parseInt(req.getParameter("msgNo"));
	    System.out.println("인포 여긴왔니 ? "+msgNo );
	    MsgVO msg = service.selectMsgInfo(msgNo);
	    System.out.println("내용: "+msg.getContent()+"받을사람 : " +msg.getMemberNo());
		return msg;
	}
	@RequestMapping("/updateMsg.do")
	@ResponseBody
	public void updateMsg(MsgVO msg) throws Exception{
		service.updateMsg(msg);
	}
	
}


