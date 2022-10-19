package egovframework.goncs.member.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MemlogVO implements Serializable {

	/** 일련번호 */
	private int idx = 0;
	/** 구분 */
	private String gubunx = "";
	/** 작업내용 */
	private String subject = "";
	/** 아이디 */
	private String m_id = "";
    /** 작업일시 */
    private String us_name = "";
	/** 접속아이피 */
	private String com_ip = "";
	/** 작업일시 */
	private String reg_date = "";
	/** 시작일자 */
	private String strdat = "";
	/** 종료일자 */
    private String enddat = "";
	/** 구코드 */
    private String goo_code = "";
	/** 동코드 */
    private String dong_code = "";
	/** 현재페이지 */
    private int pageIndex = 1;
    /** 페이지갯수 */
    private int pageUnit = 30;
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
	public String getGubunx() {
		return gubunx;
	}
	public void setGubunx(String gubunx) {
		this.gubunx = gubunx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
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
	public String getGoo_code() {
		return goo_code;
	}
	public void setGoo_code(String goo_code) {
		this.goo_code = goo_code;
	}
	public String getDong_code() {
		return dong_code;
	}
	public void setDong_code(String dong_code) {
		this.dong_code = dong_code;
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
