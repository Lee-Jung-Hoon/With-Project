package kr.co.spanner.user.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.spanner.user.reservation.service.ReservationService;
import kr.co.spanner.user.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService service;

	
	
	
	@RequestMapping("/reservation.json")
	@ResponseBody
	public List<ReservationVO> insertRes(ReservationVO reservation) throws Exception{		
			
		service.insertRes(reservation);

		return service.selectReservation();	
	}
	
	@RequestMapping("/rsvList.json")
	public List<ReservationVO> rsvList() throws Exception{
		
		return service.selectReservation();
	}
	
}












