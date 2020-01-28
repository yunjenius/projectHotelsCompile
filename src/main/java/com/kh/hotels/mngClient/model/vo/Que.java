package com.kh.hotels.mngClient.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Que implements java.io.Serializable{

	private int qno;
	private int mno;
	private String userName;
	private String qtype;
	private String qtitle;
	private Date qdate;
	private String qcontent;
	private String ansStatus;
	private String delStatus;
	private String qpwd;
	private String pwdStatus;
	
}
