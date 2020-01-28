package com.kh.hotels.hotel.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.hotels.hotel.model.exception.QnASelectListException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngClient.model.vo.Que;
import com.kh.hotels.mngMember.model.vo.Member;
import com.kh.hotels.mngReserv.model.vo.ReservationCheck;
import com.kh.hotels.mngRooms.model.vo.RoomInfo;

@Component
//@Repository
public class HotelDaoImpl implements HotelDao{

	@Override
	public Map<String, RoomInfo> selectRoomList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectMap("hotel.selectRoomList", "rt_No");
	}

	@Override
	public RoomInfo selectRoom(SqlSessionTemplate sqlSession, int roomType) {
		
		return sqlSession.selectOne("hotel.selectRoom", roomType);
	}

	@Override
	public ReservationCheck reservationCheck(SqlSessionTemplate sqlSession, ReservationCheck rsv) {

		return sqlSession.selectOne("hotel.reservationCheck", rsv);
	}

	@Override
	public int insertReservation(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		
		return sqlSession.insert("hotel.insertReservation", rsvCheck);
	}

	@Override
	public int reservationCnt(SqlSessionTemplate sqlSession, String rsvNo) {
		
		return sqlSession.selectOne("hotel.reservationCnt", rsvNo);
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {
		
		return sqlSession.insert("hotel.insertMember", rsvCheck);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, ReservationCheck rsvCheck) {

		return sqlSession.selectOne("hotel.selectMember", rsvCheck);
	}

	@Override
	public List<Que> selectQnAList(SqlSessionTemplate sqlSession, PageInfo pi) throws QnASelectListException {
		List<Que> list = null;
		
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (List) sqlSession.selectList("hotel.selectQnAList", null, rowBounds);
		
		if(list == null) {
			throw new QnASelectListException("게시물 조회 실패!");
		}
		
		return list;
	}

	@Override
	public int insertQnA(SqlSessionTemplate sqlSession, Que q) {
		return sqlSession.insert("hotel.insertQnA", q);
	}

	@Override
	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("hotel.selectQnAMember", m);
	}

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("hotel.insertQnAMember", m);
	}

	@Override
	public int listCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hotel.selectListCount");
	}

}
