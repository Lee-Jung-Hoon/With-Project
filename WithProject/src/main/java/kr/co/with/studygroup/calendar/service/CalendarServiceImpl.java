package kr.co.with.studygroup.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.studygroup.calendar.dao.CalendarDAO;
import kr.co.with.studygroup.calendar.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {
   
   @Autowired
   private CalendarDAO dao;
   
   public int registSch(CalendarVO test) throws Exception {
      return dao.registSch(test);
   }

   public List<CalendarVO> selectList() throws Exception {
      return dao.selectList();
   }

   public void updateSch(CalendarVO test) throws Exception {
      dao.updateSch(test);
   }

   public void deleteSch(int no) throws Exception {
      dao.deleteSch(no);
   }
}