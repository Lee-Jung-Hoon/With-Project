package kr.co.spanner.user.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.spanner.user.reservation.service.ReservationService;

@Controller
@RequestMapping()
public class ReservationController {
	
	@Autowired
	private ReservationService service;
}
