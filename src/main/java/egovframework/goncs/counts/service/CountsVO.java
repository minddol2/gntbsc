package egovframework.goncs.counts.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class CountsVO implements Serializable {

	/** 고유코드 */
	private int ct_idx = 0;
	/** 년도 */
	private String ct_year = "";
	/** 월 */
	private String ct_datex = "";
	/** 일자 */
	private String ct_datexx = "";
	/** 요일 */
	private String ct_youle = "";
	/** 시간 */
	private String ct_timex = "";
	/** 아이피 */
	private String ct_ip = "";
	/** 접속URL **/
	private String ct_location = "";
	/** PV/Mobile */
	private String ct_pc = "";
	/** 페이지 */
	private String ct_page = "";
	private String strdat = "";
	private String enddat = "";
	private String syear = "";
	private String eyear = "";
	private String smon = "";
	private String emon = "";
	private String sdatex = "";
	private String edatex = "";
	private float ct_cnt = 0;
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
	
	public int getCt_idx() {
		return ct_idx;
	}
	public void setCt_idx(int ct_idx) {
		this.ct_idx = ct_idx;
	}
	public String getCt_year() {
		return ct_year;
	}
	public void setCt_year(String ct_year) {
		this.ct_year = ct_year;
	}
	public String getCt_datex() {
		return ct_datex;
	}
	public void setCt_datex(String ct_datex) {
		this.ct_datex = ct_datex;
	}
	public String getCt_datexx() {
		return ct_datexx;
	}
	public void setCt_datexx(String ct_datexx) {
		this.ct_datexx = ct_datexx;
	}
	public String getCt_youle() {
		return ct_youle;
	}
	public void setCt_youle(String ct_youle) {
		this.ct_youle = ct_youle;
	}
	public String getCt_timex() {
		return ct_timex;
	}
	public void setCt_timex(String ct_timex) {
		this.ct_timex = ct_timex;
	}
	public String getCt_ip() {
		return ct_ip;
	}
	public void setCt_ip(String ct_ip) {
		this.ct_ip = ct_ip;
	}
	public String getCt_location() {
		return ct_location;
	}
	public void setCt_location(String ct_location) {
		this.ct_location = ct_location;
	}
	public String getCt_pc() {
		return ct_pc;
	}
	public void setCt_pc(String ct_pc) {
		this.ct_pc = ct_pc;
	}
	public String getCt_page() {
		return ct_page;
	}
	public void setCt_page(String ct_page) {
		this.ct_page = ct_page;
	}
	public String getStrdat() {
		return strdat;
	}
	public void setStrdat(String strdat) {
		this.strdat = strdat;
	}
	public String getEnddat() {
		return enddat;
	}
	public void setEnddat(String enddat) {
		this.enddat = enddat;
	}
	public String getSyear() {
		return syear;
	}
	public void setSyear(String syear) {
		this.syear = syear;
	}
	public String getEyear() {
		return eyear;
	}
	public void setEyear(String eyear) {
		this.eyear = eyear;
	}
	public String getSmon() {
		return smon;
	}
	public void setSmon(String smon) {
		this.smon = smon;
	}
	public String getEmon() {
		return emon;
	}
	public void setEmon(String emon) {
		this.emon = emon;
	}
	public float getCt_cnt() {
		return ct_cnt;
	}
	public void setCt_cnt(float ct_cnt) {
		this.ct_cnt = ct_cnt;
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
	public String getSdatex() {
		return sdatex;
	}
	public void setSdatex(String sdatex) {
		this.sdatex = sdatex;
	}
	public String getEdatex() {
		return edatex;
	}
	public void setEdatex(String edatex) {
		this.edatex = edatex;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
