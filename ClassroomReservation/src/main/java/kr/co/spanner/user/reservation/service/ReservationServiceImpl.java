package kr.co.spanner.user.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.spanner.user.reservation.dao.ReservationDAO;
import kr.co.spanner.user.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	@Autowired
	private ReservationDAO dao;

	public void insertRes(ReservationVO reservation) {
		dao.insertRes(reservation);
	}

	
	// 예약 현황 출력
	public List<ReservationVO> selectReservation(ReservationVO resv) throws Exception {
		return dao.selectResertion(resv);
	}

	public List<ReservationVO> reservationCheck(ReservationVO reservation) {
		return dao.reservationCheck(reservation);
	}


	public ReservationVO selectModifyResv(int resNo) throws Exception {
		return dao.selectModifyResv(resNo);
	}


	public void updateReservation(ReservationVO reservation) throws Exception {
		dao.updateReservation(reservation);
	}

}
