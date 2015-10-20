package kr.co.spanner.user.reservation.service;

import java.util.List;

import kr.co.spanner.user.reservation.vo.ReservationVO;

public interface ReservationService {
	
	public void insertRes(ReservationVO reservation) throws Exception;

	public List<ReservationVO> selectReservation(String searchDay)throws Exception;
	
}
