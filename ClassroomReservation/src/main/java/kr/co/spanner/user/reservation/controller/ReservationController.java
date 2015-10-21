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
import org.springframework.web.servlet.ModelAndView;

import kr.co.spanner.user.reservation.service.ReservationService;
import kr.co.spanner.user.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService service;

	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String date = sdf.format(new Date());

	// 강의실 예약 메인으로 이동
	@RequestMapping("/classReservation.do")
	public ModelAndView ClassReservation(@RequestParam(required=false, defaultValue="1")int floor) throws Exception {
		ModelAndView mav = new ModelAndView("user/classMain");
		mav.addObject("floor", floor);
		return mav;
	}
	
	// 강의실 선택 후 예약 화면으로 이동
	@RequestMapping("/dateReservation.do")
	public ModelAndView DateReservation(int classNo, int floor, String className) throws Exception{		
		ModelAndView mav = new ModelAndView("user/classReservation");
		mav.addObject("classNo", classNo);
		mav.addObject("floor", floor);
		mav.addObject("className", className);
		return mav;
	}
	
	@RequestMapping("/reservation.json")
	@ResponseBody
	public ReservationVO insertRes(ReservationVO reservation) throws Exception{		
		service.insertRes(reservation);
		System.out.println(reservation.toString());
		return reservation;	
	}
	 
	@ResponseBody
	@RequestMapping("/rsvList.json")
	public List<ReservationVO> rsvList(String rsvDay, String classNo) throws Exception{
		System.out.println(rsvDay);
		System.out.println(classNo);
		ReservationVO resv = new ReservationVO();
		resv.setRsvDay(rsvDay);
		resv.setClassNo(Integer.parseInt(classNo));
		List<ReservationVO> list =  service.selectReservation(resv);
		System.out.println(list.size());
		return list;
	}
	
}












