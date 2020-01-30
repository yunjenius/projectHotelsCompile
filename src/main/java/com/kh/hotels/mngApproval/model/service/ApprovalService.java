package com.kh.hotels.mngApproval.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.hotels.mngApproval.model.exception.ReportException;
import com.kh.hotels.mngApproval.model.vo.PageInfo;
import com.kh.hotels.mngApproval.model.vo.PurVos;
import com.kh.hotels.mngApproval.model.vo.Report;

public interface ApprovalService {


	List<HashMap<String, Object>> selectReportList(PageInfo pi) throws ReportException;

	int getListCount() throws ReportException;

	int getListCountFilter(String cateCh);

	List<HashMap<String, Object>> selectFilterReportList(PageInfo pi, String cate) throws ReportException;


	List<HashMap<String, Object>> selectApprovePurDetail(int rptNo, String type) throws ReportException;

	List<HashMap<String, Object>> selectApproveRepairDetail(int rptNo, String type) throws ReportException;

	List<HashMap<String, Object>> selectApproveOrderDetail(int rptNo, String type) throws ReportException;

	List<HashMap<String, Object>> selectInfo() throws ReportException;

	int selectVos(String iName);

	List<String> selectConnName(String value) throws ReportException;

	List<String> selectItemName(String value) throws ReportException;

	List<String> selectMadeComName(String value) throws ReportException;


	int selectVosEquip(PurVos pv);

	
	
	
}
