package kr.co.with.studygroup.calendar.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.with.studygroup.calendar.vo.CalendarVO;


@Controller
@RequestMapping("/calendar")

public class CalendarController {
   
   @Autowired
   private kr.co.with.studygroup.calendar.service.CalendarService service;
   
   @RequestMapping("/schedule.do")
   public String schedule() throws Exception {
      return "schedule";
   }
   
   
   @RequestMapping("/regist_sch.json")
   @ResponseBody
   public int registSch(String title, String startDate, String endDate, String textColor, String color) throws Exception {
	  CalendarVO calendar = new CalendarVO();
	 
	  
	  // 그룹NO 받을 자리
	  calendar.setGroupNo(1);
	  	
	  // 멤버NO
	  //calendar.setCalendarDetail(calendarDetail);
	  calendar.setColor(color);
	  calendar.setTextColor(textColor);
	  calendar.setStartDate(startDate);
	  calendar.setEndDate(endDate);
	  calendar.setTitle(title);
	  return service.registSch(calendar);
   }
   
   @RequestMapping("/select_sch.json")
   @ResponseBody
   public List<CalendarVO> selectList() throws Exception {
      return service.selectList();
   }
   
   @RequestMapping("/update_sch.json")
   @ResponseBody
   public List<CalendarVO> updateSch(CalendarVO calendar) throws Exception {
      service.updateSch(calendar);
      return service.selectList();
   }
   @RequestMapping("/delete_sch.json")
   @ResponseBody
   public List<CalendarVO> deleteSch(int no) throws Exception {
      service.deleteSch(no);
      return service.selectList();
   }
}