package com.merit.pps.bbs.vo;

import java.sql.Clob;
import java.sql.Date;

public class BbsVo {
	private Integer itemId;
	private String title;
	private Integer userId;
	private String userName;
	private Integer mapId;
	private Integer level1;
	private Integer level2;
	private Integer level3;
	private Integer level4;
	private Clob content;
	private Date rgstDate;
	private Date lastUpdt;
	private Integer status;
	private Integer opnCnt;
	private Integer rcmdCnt;
	private Integer readCnt;
	private String cstmField1;
	private String cstmField2;
	private Integer cstmField3;
	private Date cstmDate1;
	private Date cstmDate2;

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getMapId() {
		return mapId;
	}

	public void setMapId(Integer mapId) {
		this.mapId = mapId;
	}

	public Integer getLevel1() {
		return level1;
	}

	public void setLevel1(Integer level1) {
		this.level1 = level1;
	}

	public Integer getLevel2() {
		return level2;
	}

	public void setLevel2(Integer level2) {
		this.level2 = level2;
	}

	public Integer getLevel3() {
		return level3;
	}

	public void setLevel3(Integer level3) {
		this.level3 = level3;
	}

	public Integer getLevel4() {
		return level4;
	}

	public void setLevel4(Integer level4) {
		this.level4 = level4;
	}

	public Clob getContent() {
		return content;
	}

	public void setContent(Clob content) {
		this.content = content;
	}

	public Date getRgstDate() {
		return rgstDate;
	}

	public void setRgstDate(Date rgstDate) {
		this.rgstDate = rgstDate;
	}

	public Date getLastUpdt() {
		return lastUpdt;
	}

	public void setLastUpdt(Date lastUpdt) {
		this.lastUpdt = lastUpdt;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getOpnCnt() {
		return opnCnt;
	}

	public void setOpnCnt(Integer opnCnt) {
		this.opnCnt = opnCnt;
	}

	public Integer getRcmdCnt() {
		return rcmdCnt;
	}

	public void setRcmdCnt(Integer rcmdCnt) {
		this.rcmdCnt = rcmdCnt;
	}

	public Integer getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(Integer readCnt) {
		this.readCnt = readCnt;
	}

	public String getCstmField1() {
		return cstmField1;
	}

	public void setCstmField1(String cstmField1) {
		this.cstmField1 = cstmField1;
	}

	public String getCstmField2() {
		return cstmField2;
	}

	public void setCstmField2(String cstmField2) {
		this.cstmField2 = cstmField2;
	}

	public Integer getCstmField3() {
		return cstmField3;
	}

	public void setCstmField3(Integer cstmField3) {
		this.cstmField3 = cstmField3;
	}

	public Date getCstmDate1() {
		return cstmDate1;
	}

	public void setCstmDate1(Date cstmDate1) {
		this.cstmDate1 = cstmDate1;
	}

	public Date getCstmDate2() {
		return cstmDate2;
	}

	public void setCstmDate2(Date cstmDate2) {
		this.cstmDate2 = cstmDate2;
	}
}