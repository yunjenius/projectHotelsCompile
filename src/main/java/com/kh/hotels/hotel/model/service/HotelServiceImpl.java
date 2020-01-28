package com.kh.hotels.hotel.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hotels.hotel.model.dao.HotelDao;
import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Service
public class HotelServiceImpl implements HotelService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private HotelDao hd;
	
	@Override
	public Map<String, RoomInfo> selectRoomList() {
		
		return hd.selectRoomList(sqlSession);
	}

	@Override
	public RoomInfo selectRoom(int roomType) {
		
		return hd.selectRoom(sqlSession, roomType);
	}

	@Override
	public ReservationCheck reservationCheck(ReservationCheck rsv) {
		
		return hd.reservationCheck(sqlSession, rsv);
	}

	@Override
	public int insertReservation(ReservationCheck rsvCheck) {

		return hd.insertReservation(sqlSession, rsvCheck);
	}

	@Override
	public int reservationCnt(String rsvNo) {
		return hd.reservationCnt(sqlSession, rsvNo);
	}

	@Override
	public int insertMember(ReservationCheck rsvCheck) {

		return hd.insertMember(sqlSession, rsvCheck);
	}

	@Override
	public Member selectMember(ReservationCheck rsvCheck) {

		return hd.selectMember(sqlSession, rsvCheck);
	}

	@Override
	public List<Que> selectQnAList(PageInfo pi) throws QnASelectListException {
		
		return hd.selectQnAList(sqlSession, pi);
	}

	@Override
	public int insertQnA(Que q) {
		return hd.insertQnA(sqlSession, q);
	}

	@Override
	public Member selectMember(Member m) {
		return hd.selectMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return hd.insertMember(sqlSession, m);
	}

	@Override
	public int listCount() {
		return hd.listCount(sqlSession);
	}

}
