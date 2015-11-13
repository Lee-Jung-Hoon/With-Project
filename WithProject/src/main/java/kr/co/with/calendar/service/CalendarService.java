package kr.co.with.calendar.service;

import java.util.List;

import kr.co.with.calendar.vo.CalendarVO;

public interface CalendarService {

   public void registSch(CalendarVO test) throws Exception;

   public List<CalendarVO> selectList() throws Exception;

   public void updateSch(CalendarVO test) throws Exception;

   public void deleteSch(int no) throws Exception; 
}