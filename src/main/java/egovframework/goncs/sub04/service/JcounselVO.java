package egovframework.goncs.sub04.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class JcounselVO implements Serializable {

	private int idx = 0;
	private String counsel_gbn = "";
	private String datexx = "";
	private String timexx = "";
	private String us_id = "";
	private String name = "";
	private String mobile = "";
	private String userfile1 = "";
	private String userfile2 = "";
	private String userfile3 = "";
	private String content1 = "";
	private String status = "";
	private String sys_id = "";
	private String com_ip = "";
	private String reg_date = "";
	private String refuse_txt = "";
	private String sdate = "";
	private String edate = "";
	private int searchCnd = 0;
	private String searchWrd = "";
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
	public String getCounsel_gbn() {
		return counsel_gbn;
	}
	public void setCounsel_gbn(String counsel_gbn) {
		this.counsel_gbn = counsel_gbn;
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
	public String getUserfile1() {
		return userfile1;
	}
	public void setUserfile1(String userfile1) {
		this.userfile1 = userfile1;
	}
	public String getUserfile2() {
		return userfile2;
	}
	public void setUserfile2(String userfile2) {
		this.userfile2 = userfile2;
	}
	public String getUserfile3() {
		return userfile3;
	}
	public void setUserfile3(String userfile3) {
		this.userfile3 = userfile3;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
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
	public int getSearchCnd() {
		return searchCnd;
	}
	public void setSearchCnd(int searchCnd) {
		this.searchCnd = searchCnd;
	}
	public String getSearchWrd() {
		return searchWrd;
	}
	public void setSearchWrd(String searchWrd) {
		this.searchWrd = searchWrd;
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
