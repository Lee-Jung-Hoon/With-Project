package kr.co.with.studygroup.calendar.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.with.studygroup.calendar.vo.CalendarVO;


@Controller
@RequestMapping("/calendar")

public class CalendarController {
   
   @Autowired
   private kr.co.with.studygroup.calendar.service.CalendarService service;
   
   @RequestMapping("/schedule.do")
   public ModelAndView schedule(int groupNo) throws Exception {
	   ModelAndView mav = new ModelAndView("StudygroupSchedule/schedule");
	   mav.addObject("groupNo", groupNo);
      return mav;
   }
   
   
   @RequestMapping("/regist_sch.json")
   @ResponseBody
   public int registSch(CalendarVO calendar) throws Exception {
	  	
	  // 멤버NO
	  //calendar.setCalendarDetail(calendarDetail);;
	  System.out.println("몇번째??");
	  return service.registSch(calendar);
   }
   
   @RequestMapping("/select_sch.json")
   @ResponseBody
   public List<CalendarVO> selectList() throws Exception {
      return service.selectList();
   }
   @RequestMapping("/update_form.json")
   @ResponseBody
   public CalendarVO updateForm(int no) throws Exception {
	   System.out.println(no);
	   return service.updateForm(no);
   }
   
   
   @RequestMapping("/update_sch.json")
   @ResponseBody
   public List<CalendarVO> updateSch(CalendarVO calendar) throws Exception {
	   // 그룹NO 받을 자리
	  // 상세글 넣을 자리
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