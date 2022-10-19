package egovframework.goncs.memto.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MemtoVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	private int hit = 0;	
	/** 아이디 */
	private String us_id = "";
	private String us_name = "";
	private String us_namex = "";
	/** 회사명 */
	private String us_company = "";
	/** 직급 */
	private String us_position = "";
	/** 설립연도 */
	private String us_makeyear = "";
	/** 기업유형 */
	private String us_uptaex = "";
	private String us_mobile = "";
	private String us_email = "";
	private String us_saupno = "";
	private String us_addrxx = "";
	private String us_addres = "";
	private String us_buss_gbn = "";
	/** 문의분야_대분류 */
	private String us_major11 = "";
	private String us_major11_nm = "";
	/** 문의분야_소분류 */
	private String us_major12 = "";
	private String us_major12_nm = "";
	/** 문의분야_소분류 기타 */
	private String us_major1_etc = "";
	/** 희망멘토 */
	private String hope_memto = "";
	private String hope_memto_nm = "";
	private String hope_memto_mobile = "";
	/** 확정멘토 */
	private String memto = "";
	private String memto_nm = "";
	private String memto_mobile = "";
	/** 멘토링방식 */
	private String memto_gbn = "";
	/** 센터회의실 사용유무 */
	private String room_gbn = "";
	/** 회의실사용날짜 */
	private String room_date = "";
	/** 회의실 사용시간1 */
	private String room_time1 = "";
	/** 회의실 사용시간2 */
	private String room_time2 = "";
	/** 회의실사용날짜 확정 */
	private String room_wdate = "";
	/** 회의실 사용시간1 확정 */
	private String room_wtime1 = "";
	/** 회의실 사용시간2 확정 */
	private String room_wtime2 = "";
	/** 제목 */
	private String title = "";
	/** 문의내용 */
	private String contentx = "";
	/** 첨부1 */
	private String userfile1 = "";
	/** 첨부2 */
	private String userfile2 = "";
	/** 첨부3 */
	private String userfile3 = "";
	/** 링크1 */
	private String link1 = "";
	/** 링크2 */
	private String link2 = "";
	/** 링크3 */
	private String link3 = "";
	/** 상태 */
	private String status = "";
	/** 관리자 ID */
	private String sys_id = "";
	/** 아이피 */
	private String com_ip = "";
	/** 신청일자 */
	private String reg_date = "";
	/** 관리자 메모 */
	private String sys_memo = "";
	private String sendsms = "N";
	private int searchCnd = 0;
	private String searchWrd = "";
	private String sdate = "";
	private String edate = "";
	private float point = 0;
	private float point2 = 0;
	private int att_cnt = 0;
	private String str_date = "";
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
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getUs_company() {
		return us_company;
	}
	public void setUs_company(String us_company) {
		this.us_company = us_company;
	}
	public String getUs_position() {
		return us_position;
	}
	public void setUs_position(String us_position) {
		this.us_position = us_position;
	}
	public String getUs_makeyear() {
		return us_makeyear;
	}
	public void setUs_makeyear(String us_makeyear) {
		this.us_makeyear = us_makeyear;
	}
	public String getUs_uptaex() {
		return us_uptaex;
	}
	public void setUs_uptaex(String us_uptaex) {
		this.us_uptaex = us_uptaex;
	}
	public String getUs_mobile() {
		return us_mobile;
	}
	public void setUs_mobile(String us_mobile) {
		this.us_mobile = us_mobile;
	}
	public String getUs_major11() {
		return us_major11;
	}
	public void setUs_major11(String us_major11) {
		this.us_major11 = us_major11;
	}
	public String getUs_major11_nm() {
		return us_major11_nm;
	}
	public void setUs_major11_nm(String us_major11_nm) {
		this.us_major11_nm = us_major11_nm;
	}
	public String getUs_major12() {
		return us_major12;
	}
	public void setUs_major12(String us_major12) {
		this.us_major12 = us_major12;
	}
	public String getUs_major12_nm() {
		return us_major12_nm;
	}
	public void setUs_major12_nm(String us_major12_nm) {
		this.us_major12_nm = us_major12_nm;
	}
	public String getUs_major1_etc() {
		return us_major1_etc;
	}
	public void setUs_major1_etc(String us_major1_etc) {
		this.us_major1_etc = us_major1_etc;
	}
	public String getHope_memto() {
		return hope_memto;
	}
	public void setHope_memto(String hope_memto) {
		this.hope_memto = hope_memto;
	}
	public String getHope_memto_nm() {
		return hope_memto_nm;
	}
	public void setHope_memto_nm(String hope_memto_nm) {
		this.hope_memto_nm = hope_memto_nm;
	}
	public String getMemto() {
		return memto;
	}
	public void setMemto(String memto) {
		this.memto = memto;
	}
	public String getMemto_nm() {
		return memto_nm;
	}
	public void setMemto_nm(String memto_nm) {
		this.memto_nm = memto_nm;
	}
	public String getMemto_mobile() {
		return memto_mobile;
	}
	public void setMemto_mobile(String memto_mobile) {
		this.memto_mobile = memto_mobile;
	}
	public String getMemto_gbn() {
		return memto_gbn;
	}
	public void setMemto_gbn(String memto_gbn) {
		this.memto_gbn = memto_gbn;
	}
	public String getRoom_gbn() {
		return room_gbn;
	}
	public void setRoom_gbn(String room_gbn) {
		this.room_gbn = room_gbn;
	}
	public String getRoom_date() {
		return room_date;
	}
	public void setRoom_date(String room_date) {
		this.room_date = room_date;
	}
	public String getRoom_time1() {
		return room_time1;
	}
	public void setRoom_time1(String room_time1) {
		this.room_time1 = room_time1;
	}
	public String getRoom_time2() {
		return room_time2;
	}
	public void setRoom_time2(String room_time2) {
		this.room_time2 = room_time2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentx() {
		return contentx;
	}
	public void setContentx(String contentx) {
		this.contentx = contentx;
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
	public String getLink1() {
		return link1;
	}
	public void setLink1(String link1) {
		this.link1 = link1;
	}
	public String getLink2() {
		return link2;
	}
	public void setLink2(String link2) {
		this.link2 = link2;
	}
	public String getLink3() {
		return link3;
	}
	public void setLink3(String link3) {
		this.link3 = link3;
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
	public String getSys_memo() {
		return sys_memo;
	}
	public void setSys_memo(String sys_memo) {
		this.sys_memo = sys_memo;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_saupno() {
		return us_saupno;
	}
	public void setUs_saupno(String us_saupno) {
		this.us_saupno = us_saupno;
	}
	public String getUs_addrxx() {
		return us_addrxx;
	}
	public void setUs_addrxx(String us_addrxx) {
		this.us_addrxx = us_addrxx;
	}
	public String getUs_addres() {
		return us_addres;
	}
	public void setUs_addres(String us_addres) {
		this.us_addres = us_addres;
	}
	public String getUs_buss_gbn() {
		return us_buss_gbn;
	}
	public void setUs_buss_gbn(String us_buss_gbn) {
		this.us_buss_gbn = us_buss_gbn;
	}
	public float getPoint() {
		return point;
	}
	public void setPoint(float point) {
		this.point = point;
	}
	public String getHope_memto_mobile() {
		return hope_memto_mobile;
	}
	public void setHope_memto_mobile(String hope_memto_mobile) {
		this.hope_memto_mobile = hope_memto_mobile;
	}
	public String getStr_date() {
		return str_date;
	}
	public void setStr_date(String str_date) {
		this.str_date = str_date;
	}
	public float getPoint2() {
		return point2;
	}
	public void setPoint2(float point2) {
		this.point2 = point2;
	}
	public String getSendsms() {
		return sendsms;
	}
	public void setSendsms(String sendsms) {
		this.sendsms = sendsms;
	}
	public String getUs_namex() {
		return us_namex;
	}
	public void setUs_namex(String us_namex) {
		this.us_namex = us_namex;
	}
	public String getRoom_wdate() {
		return room_wdate;
	}
	public void setRoom_wdate(String room_wdate) {
		this.room_wdate = room_wdate;
	}
	public String getRoom_wtime1() {
		return room_wtime1;
	}
	public void setRoom_wtime1(String room_wtime1) {
		this.room_wtime1 = room_wtime1;
	}
	public String getRoom_wtime2() {
		return room_wtime2;
	}
	public void setRoom_wtime2(String room_wtime2) {
		this.room_wtime2 = room_wtime2;
	}
	public int getAtt_cnt() {
		return att_cnt;
	}
	public void setAtt_cnt(int att_cnt) {
		this.att_cnt = att_cnt;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
