package kr.co.spanner.user.reservation.service;

import java.util.List;

import kr.co.spanner.user.reservation.vo.ReservationVO;

public interface ReservationService {
	
	public void insertRes(ReservationVO reservation) throws Exception;

	public List<ReservationVO> selectReservation(ReservationVO resv)throws Exception;

	public List<ReservationVO> reservationCheck(ReservationVO reservation);

	public ReservationVO selectModifyResv(int resNo) throws Exception;

	public void updateReservation(ReservationVO reservation) throws Exception;

}
