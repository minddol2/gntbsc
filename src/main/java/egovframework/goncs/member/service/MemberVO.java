package egovframework.goncs.member.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MemberVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	/** 아이디 */
	private String us_id = "";
	/** 비밀번호 */
	private String us_pw = "";
	private String us_newpw = "";
	/** 성명 */
	private String us_name = "";
	/** 직급 */
	private String us_position = "";
	/** 연락처 **/
	private String us_phone = "";
	/** 이메일 **/
	private String us_email = "";
	/** sms체크 **/
	private String us_smschk = "";
	/** email체크 **/
	private String us_mailchk = "";
	private String us_workchk = "";
	/** 사용상태 (1:관리자 3:일반회원 5:비회원) */
	private int us_level = 0;
	/** 등록일 */
	private String us_regdate = "";
	/** 등록IP */
	private String us_regip = "";
	/** 수정일 */
	private String us_moddate = "";
	/** 수정IP */
	private String us_modip = "";
	//1:일반, 2:기업회원, 3:멘토회원
	private String us_gbn = "";
	//기업회원구분 1:도내기업, 2:예비창업자, 3:입주기업
	private String us_buss_gbn = "";
	//회사명, 소속
	private String us_company = "";
	//사업자번호
	private String us_saupno = "";
	//설립년도, 사업자등록예정일
	private String us_makeyear = "";
	//기업유형
	private String us_uptaex = "";
	//우편번호
	private String us_zipcod = "";
	//주소
	private String us_addrxx = "";
	//주소상세
	private String us_addres = "";
	private String us_mentoyn = "";
	private String o_mentoyn = "";
	private String us_mento_date = "";
	//멘토 전문분야 대분류1
	private String us_major11 = "";
	private String us_major11_nm = "";
	private int us_major11_cnt = 0;
	//멘토 전문분야 소분류1
	private String us_major12 = "";
	private String us_major12_nm = "";
	private int us_major12_cnt = 0;
	//멘토 전문분야 소분류1 기타
	private String us_major1_etc = "";
	//멘토 전문분야 대분류2
	private String us_major21 = "";
	private String us_major21_nm = "";
	//멘토 전문분야 소분류2
	private String us_major22 = "";
	private String us_major22_nm = "";
	//멘토 전문분야 소분류2 기타
	private String us_major2_etc = "";
	private int searchCnd = 0;
	private String searchWrd = "";
	private String sdate = "";
	private String edate = "";
	//화상
	private int cam_cnt = 0;
	//서면
	private int pap_cnt = 0;
	//대면
	private int man_cnt = 0;
	//총건수
	private int mento_cnt = 0;
	//평가건수
	private int end_cnt = 0;
	//평점
	private float avg_point = 0;
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
	public String getUs_pw() {
		return us_pw;
	}
	public void setUs_pw(String us_pw) {
		this.us_pw = us_pw;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public String getUs_position() {
		return us_position;
	}
	public void setUs_position(String us_position) {
		this.us_position = us_position;
	}
	public String getUs_phone() {
		return us_phone;
	}
	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}
	public int getUs_level() {
		return us_level;
	}
	public void setUs_level(int us_level) {
		this.us_level = us_level;
	}
	public String getUs_regdate() {
		return us_regdate;
	}
	public void setUs_regdate(String us_regdate) {
		this.us_regdate = us_regdate;
	}
	public String getUs_regip() {
		return us_regip;
	}
	public void setUs_regip(String us_regip) {
		this.us_regip = us_regip;
	}
	public String getUs_moddate() {
		return us_moddate;
	}
	public void setUs_moddate(String us_moddate) {
		this.us_moddate = us_moddate;
	}
	public String getUs_modip() {
		return us_modip;
	}
	public void setUs_modip(String us_modip) {
		this.us_modip = us_modip;
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
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_smschk() {
		return us_smschk;
	}
	public void setUs_smschk(String us_smschk) {
		this.us_smschk = us_smschk;
	}
	public String getUs_mailchk() {
		return us_mailchk;
	}
	public void setUs_mailchk(String us_mailchk) {
		this.us_mailchk = us_mailchk;
	}
	public String getUs_newpw() {
		return us_newpw;
	}
	public void setUs_newpw(String us_newpw) {
		this.us_newpw = us_newpw;
	}
	public String getUs_gbn() {
		return us_gbn;
	}
	public void setUs_gbn(String us_gbn) {
		this.us_gbn = us_gbn;
	}
	public String getUs_buss_gbn() {
		return us_buss_gbn;
	}
	public void setUs_buss_gbn(String us_buss_gbn) {
		this.us_buss_gbn = us_buss_gbn;
	}
	public String getUs_company() {
		return us_company;
	}
	public void setUs_company(String us_company) {
		this.us_company = us_company;
	}
	public String getUs_saupno() {
		return us_saupno;
	}
	public void setUs_saupno(String us_saupno) {
		this.us_saupno = us_saupno;
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
	public String getUs_zipcod() {
		return us_zipcod;
	}
	public void setUs_zipcod(String us_zipcod) {
		this.us_zipcod = us_zipcod;
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
	public String getUs_major11() {
		return us_major11;
	}
	public void setUs_major11(String us_major11) {
		this.us_major11 = us_major11;
	}
	public String getUs_major12() {
		return us_major12;
	}
	public void setUs_major12(String us_major12) {
		this.us_major12 = us_major12;
	}
	public String getUs_major1_etc() {
		return us_major1_etc;
	}
	public void setUs_major1_etc(String us_major1_etc) {
		this.us_major1_etc = us_major1_etc;
	}
	public String getUs_major21() {
		return us_major21;
	}
	public void setUs_major21(String us_major21) {
		this.us_major21 = us_major21;
	}
	public String getUs_major22() {
		return us_major22;
	}
	public void setUs_major22(String us_major22) {
		this.us_major22 = us_major22;
	}
	public String getUs_major2_etc() {
		return us_major2_etc;
	}
	public void setUs_major2_etc(String us_major2_etc) {
		this.us_major2_etc = us_major2_etc;
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
	public String getUs_major11_nm() {
		return us_major11_nm;
	}
	public void setUs_major11_nm(String us_major11_nm) {
		this.us_major11_nm = us_major11_nm;
	}
	public String getUs_major12_nm() {
		return us_major12_nm;
	}
	public void setUs_major12_nm(String us_major12_nm) {
		this.us_major12_nm = us_major12_nm;
	}
	public String getUs_major21_nm() {
		return us_major21_nm;
	}
	public void setUs_major21_nm(String us_major21_nm) {
		this.us_major21_nm = us_major21_nm;
	}
	public String getUs_major22_nm() {
		return us_major22_nm;
	}
	public void setUs_major22_nm(String us_major22_nm) {
		this.us_major22_nm = us_major22_nm;
	}
	public String getUs_workchk() {
		return us_workchk;
	}
	public void setUs_workchk(String us_workchk) {
		this.us_workchk = us_workchk;
	}
	public String getUs_mentoyn() {
		return us_mentoyn;
	}
	public void setUs_mentoyn(String us_mentoyn) {
		this.us_mentoyn = us_mentoyn;
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
	public int getCam_cnt() {
		return cam_cnt;
	}
	public void setCam_cnt(int cam_cnt) {
		this.cam_cnt = cam_cnt;
	}
	public int getPap_cnt() {
		return pap_cnt;
	}
	public void setPap_cnt(int pap_cnt) {
		this.pap_cnt = pap_cnt;
	}
	public int getMan_cnt() {
		return man_cnt;
	}
	public void setMan_cnt(int man_cnt) {
		this.man_cnt = man_cnt;
	}
	public int getMento_cnt() {
		return mento_cnt;
	}
	public void setMento_cnt(int mento_cnt) {
		this.mento_cnt = mento_cnt;
	}
	public int getEnd_cnt() {
		return end_cnt;
	}
	public void setEnd_cnt(int end_cnt) {
		this.end_cnt = end_cnt;
	}
	public float getAvg_point() {
		return avg_point;
	}
	public void setAvg_point(float avg_point) {
		this.avg_point = avg_point;
	}
	public String getUs_mento_date() {
		return us_mento_date;
	}
	public void setUs_mento_date(String us_mento_date) {
		this.us_mento_date = us_mento_date;
	}
	public String getO_mentoyn() {
		return o_mentoyn;
	}
	public void setO_mentoyn(String o_mentoyn) {
		this.o_mentoyn = o_mentoyn;
	}
	public int getUs_major11_cnt() {
		return us_major11_cnt;
	}
	public void setUs_major11_cnt(int us_major11_cnt) {
		this.us_major11_cnt = us_major11_cnt;
	}
	public int getUs_major12_cnt() {
		return us_major12_cnt;
	}
	public void setUs_major12_cnt(int us_major12_cnt) {
		this.us_major12_cnt = us_major12_cnt;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
