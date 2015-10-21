package kr.co.spanner.user.reservation.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.spanner.user.reservation.service.ReservationService;
import kr.co.spanner.user.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService service;

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String date = sdf.format(new Date());
	
	@RequestMapping("/reservation.json")
	@ResponseBody
	public String insertRes(ReservationVO reservation) throws Exception{		
		service.insertRes(reservation);
		System.out.println(reservation.toString());
		return "예약 성공";	
	}
	 
	@ResponseBody
	@RequestMapping("/rsvList.json")
	public List<ReservationVO> rsvList(String rsvDay) throws Exception{
		System.out.println(rsvDay);
		List<ReservationVO> list =  service.selectReservation(rsvDay);
		System.out.println(list.size());
		return list;
	}
	
}












