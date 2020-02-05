package com.kh.hotels.mngApproval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderRequest {

	private int reqNo;
	private String reqBegin;
	private String reqEnd;
	private String reqStatus;
	private int rptNo;
	private int ino;
	private String cnCode;
	private int amount;
	private String totPrice;
	private String purRsn;
	private String deptNo;
	private String mname;
	private String rptDate;
	private String sname;
	private String title;
	private String content;
	private String type;
	private String cname;
	private String iname;
	private String mfg;
	private int vosprice;
	private int price;
	private int docno;
	private String deptname;
	private String sinfo;
	private int smno;
	private int mmno;
	private String stfId;
	private int purDocuno;
	
}
