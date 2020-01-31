package com.kh.hotels.mngApproval.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PurRequest;
import com.kh.hotels.mngApproval.model.vo.PurVos;

@Repository
public class ApprovalDaoImpl implements ApprovalDao{



	@Override
	public int getListCount(SqlSessionTemplate sqlSession) throws ReportException {
		int result = 0;
		result = sqlSession.selectOne("Report.selectListCount");
		
		if(result <= 0) {
			throw new ReportException("게시글 수 조회 실패!");
		}
		
		return result;
	}

	@Override
	public List<HashMap<String, Object>> selectApprovalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		List<HashMap<String, Object>> list = null;
		//offset은 건너뛴 갯수이다.
		//몇 개의 게시글을 건너뛰고 조회할 것인지 대한 계산
		int offset = (pi.getCurrentPage() - 1) * pi .getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (List)sqlSession.selectList("Report.selectApproveList", null, rowBounds);
		
		System.out.println("daoList : " + list);
		
		return list;
	}

	@Override
	public int getListCountFilter(SqlSessionTemplate sqlSession, String cateCh) {
		
		
		return sqlSession.selectOne("Report.selectFilterListCount", cateCh);
	}

	@Override
	public List<HashMap<String, Object>> selectFilterApproveList(SqlSessionTemplate sqlSession, PageInfo pi,
			String cateCh) {
		List<HashMap<String, Object>> list = null;
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (List) sqlSession.selectList("Report.selectFilterApproveList", cateCh, rowBounds);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApprovePurDetail(SqlSessionTemplate sqlSession, int rptNo,
			String type) {
		List<HashMap<String, Object>> list = null;
		
		
		list = (List) sqlSession.selectList("Report.selectApproveDetail", rptNo);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApproveRepairDetail(SqlSessionTemplate sqlSession, int rptNo,
			String type) {
		List<HashMap<String, Object>> list = null;
		
		
		list = (List) sqlSession.selectList("Report.selectApproveRepairDetail", rptNo);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApproveOrderDetail(SqlSessionTemplate sqlSession, int rptNo,
			String type) {
		List<HashMap<String, Object>> list = null;
		
		
		list = (List) sqlSession.selectList("Report.selectApproveOrderDetail", rptNo);
		
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectApproveInfo(SqlSessionTemplate sqlSession) {
		List<HashMap<String, Object>> list = null;
		list = (List)sqlSession.selectList("Report.selectApproveInfo");
		
		return list;
	}

	@Override
	public int selectVos(SqlSessionTemplate sqlSession, String iName) {
		
		
		
		return sqlSession.selectOne("Report.selectVos", iName);
	}

	@Override
	public List<String> selectConnName(SqlSessionTemplate sqlSession, String value) {
		System.out.println("dao : value" + value);
		
		return (List)sqlSession.selectList("Report.selectConnName", value);
	}

	


	@Override
	public List<String> selectMadeComName(SqlSessionTemplate sqlSession, String value) {
		
		
		return (List)sqlSession.selectList("Report.selectMadeComName", value);
	}

	@Override
	public int selectVosPrice(SqlSessionTemplate sqlSession, PurVos pv) {
		
		System.out.println("pv : " + pv);
		
		return (int)sqlSession.selectOne("Report.selectVosPrice", pv);
	}

	@Override
	public List<String> selectItemName(SqlSessionTemplate sqlSession, PurRequest pRequest) {

		
		return (ArrayList)sqlSession.selectList("Report.selectItemName", pRequest);
	}

	@Override
	public int insertPurchase(SqlSessionTemplate sqlSession, PurRequest purRequest) {
		
		
		return (int)sqlSession.insert("Report.insertPurchase", purRequest);
		
	}

	

}
