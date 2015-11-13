package kr.co.with.calendar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.with.calendar.dao.CalendarDAO;
import kr.co.with.calendar.vo.CalendarVO;

@Service
public class CalendarServiceImpl implements CalendarService {
   
   @Autowired
   private CalendarDAO dao;
   
   public void registSch(CalendarVO test) throws Exception {
      dao.registSch(test);
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