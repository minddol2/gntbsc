package egovframework.goncs.RoomRent.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class RoomRentVO {

	/** 고유코드 */
	private int idx = 0;
	/** 날짜 */
	private String datexx = "";
	/* 시간 */
	private String timexx = "";
	/** 방번호 */
	private String room_id1 = "";
	private String room_id2 = "";
	private String room_id3 = "";
	/** 예약자명 */
	private String us_id = "";
	private String name = "";
	/** 연락처 */
	private String mobile = "";
	/** 회사명 */
	private String company = "";
	/** 참석자 */
	private int people_cnt = 0;
	/** 사용목적 */
	private String content1 = "";
	/** 필요기자재 */
	private String content2 = "";
	/** 문의사항 */
	private String etc = "";
	/** 상태 1:접수, 2:승인, 3:반려 */
	private String status = "";
	/** 작업자ID */
	private String sys_id = "";
	/** IP */
	private String com_ip = "";
	/** 작업일자 */
	private String reg_date = "";
	/** 반려사유 */
	private String refuse_txt = "";
	private String sdate = "";
	private String edate = "";
	/** 현재페이지 */
    private int pageIndex = 1;
    /** 페이지갯수 */
    private int pageUnit = 20;
    /** 페이지사이즈 */
    private int pageSize = 10;
    /** 첫페이지 인덱스 */
    private int firstIndex = 1;
    /** 마지막페이지 인덱스 */
    private int lastIndex = 1;
    /** 페이지당 레코드 개수 */
    private int recordCountPerPage = 20;
    /** 레코드 번호 */
    private int rowNo = 0;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getDatexx() {
		return datexx;
	}
	public void setDatexx(String datexx) {
		this.datexx = datexx;
	}
	public String getTimexx() {
		return timexx;
	}
	public void setTimexx(String timexx) {
		this.timexx = timexx;
	}
	public String getRoom_id1() {
		return room_id1;
	}
	public void setRoom_id1(String room_id1) {
		this.room_id1 = room_id1;
	}
	public String getRoom_id2() {
		return room_id2;
	}
	public void setRoom_id2(String room_id2) {
		this.room_id2 = room_id2;
	}
	public String getRoom_id3() {
		return room_id3;
	}
	public void setRoom_id3(String room_id3) {
		this.room_id3 = room_id3;
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getPeople_cnt() {
		return people_cnt;
	}
	public void setPeople_cnt(int people_cnt) {
		this.people_cnt = people_cnt;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSys_id() {
		return sys_id;
	}
	public void setSys_id(String sys_id) {
		this.sys_id = sys_id;
	}
	public String getCom_ip() {
		return com_ip;
	}
	public void setCom_ip(String com_ip) {
		this.com_ip = com_ip;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getRefuse_txt() {
		return refuse_txt;
	}
	public void setRefuse_txt(String refuse_txt) {
		this.refuse_txt = refuse_txt;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getRowNo() {
		return rowNo;
	}
	public void setRowNo(int rowNo) {
		this.rowNo = rowNo;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
