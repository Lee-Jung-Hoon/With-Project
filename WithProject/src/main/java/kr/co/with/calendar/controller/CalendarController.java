package kr.co.with.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.with.calendar.vo.CalendarVO;


@Controller
@RequestMapping("/calendar")

public class CalendarController {
   
   @Autowired
   private kr.co.with.calendar.service.CalendarService service;
   
   @RequestMapping("/schedule.do")
   public String schedule() throws Exception {
      return "schedule";
   }
   
   
   @RequestMapping("/regist_sch.json")
   @ResponseBody
   public List<CalendarVO> registSch(String title, String startDate, String endDate) throws Exception {
	   CalendarVO calender = new CalendarVO();
	   calender.setEndDate(endDate);
	   calender.setStartDate(startDate);
	   calender.setTitle(title);
	  service.registSch(calender);
      return service.selectList();
   }
   
   @RequestMapping("/select_sch.json")
   @ResponseBody
   public List<CalendarVO> selectList() throws Exception {
      return service.selectList();
   }
   
   @RequestMapping("/update_sch.json")
   @ResponseBody
   public List<CalendarVO> updateSch(CalendarVO test) throws Exception {
      System.out.println(test);
      service.updateSch(test);
      return service.selectList();
   }
   @RequestMapping("/delete_sch.json")
   @ResponseBody
   public List<CalendarVO> deleteSch(int no) throws Exception {
      service.deleteSch(no);
      return service.selectList();
   }
}