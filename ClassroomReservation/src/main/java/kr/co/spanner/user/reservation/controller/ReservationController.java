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
import kr.co.spanner.user.sendMail.SendMail;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationService service;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String date = sdf.format(new Date());

	// 강의실 예약 메인으로 이동
	@RequestMapping("/classReservation.do")
	public ModelAndView ClassReservation(@RequestParam(required = false, defaultValue = "1") int floor)
			throws Exception {
		ModelAndView mav = new ModelAndView("user/classMain");
		mav.addObject("floor", floor);
		return mav;
	}

	// 강의실 선택 후 예약 화면으로 이동
	@RequestMapping("/dateReservation.do")
	public ModelAndView DateReservation(int classNo, int floor, String className) throws Exception {
		ModelAndView mav = new ModelAndView("user/classReservation");
		mav.addObject("classNo", classNo);
		mav.addObject("floor", floor);
		mav.addObject("className", className);
		return mav;
	}

	@RequestMapping("/reservation.json")
	@ResponseBody
	public ReservationVO insertRes(ReservationVO reservation) throws Exception {
		service.insertRes(reservation);
		SendMail sendMail = new SendMail();
	    sendMail.SendMailForReserve(reservation);
		return reservation;
	}

	@RequestMapping("/reservationCheck.json")
	@ResponseBody
	public String reservationCheck(ReservationVO reservation) throws Exception {
		String resTime = (reservation.getRsvDay()+"-"+reservation.getStartTime()).replace("-", "");
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
		String nowTime = sdf.format(cal.getTime());
		if(Integer.parseInt(nowTime) > Integer.parseInt(resTime))
			return "true";
		int checkCnt = 0;
		reservation.setStatus(1);
		List<ReservationVO> list = service.reservationCheck(reservation);
		for (int k = 0; k < reservation.getUsingTime(); k++) {
			int time = Integer.parseInt(reservation.getStartTime())+k;
			for (int i = 0; i < list.size(); i++) {
				ReservationVO reserv = list.get(i);
				for (int j = 0; j < reserv.getUsingTime(); j++) {
					int listTime = Integer.parseInt(reserv.getStartTime())+j;
					if(listTime == time)
						checkCnt++;
				}
			}
		}
		if(checkCnt==0) {
			return "false";
		}
 		return "true";
	}

	@ResponseBody
	@RequestMapping("/rsvList.json")
	public List<ReservationVO> rsvList(String rsvDay, String classNo) throws Exception {
		ReservationVO resv = new ReservationVO();
		resv.setRsvDay(rsvDay);
		resv.setClassNo(Integer.parseInt(classNo));
		resv.setStatus(1);
		List<ReservationVO> list = service.selectReservation(resv);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/updateReservation.json")
	public String updateReservation(ReservationVO reservation) throws Exception {
		System.out.println(reservation.toString());
		service.updateReservation(reservation);
		return "성공";
	}
	
	
	@RequestMapping("/rsvModify.do") 
	public ModelAndView rsvModify(int resNo) throws Exception {
		ModelAndView mav = new ModelAndView("user/modifyReservation");
		ReservationVO resv = service.selectModifyResv(resNo);
		mav.addObject("resv", resv);
		return mav;		
	}
	
	@ResponseBody
	@RequestMapping("/rsvCancel.json") 
	public String rsvCancel(int resNo) throws Exception {
		service.CancleResv(resNo);
		return "취소 성공";
	}
}
