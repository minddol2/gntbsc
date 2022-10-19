package egovframework.goncs.bbs.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class BoardDeVO implements Serializable {

	/** 유형식별자	 */
	private int bbs_ty_id=1;
	/** 게시판식별자	 */
	private int bbs_id=1;
	/** 게시판일련번호	 */
	private int ntt_id=0;
	/** 등록일시	 */
	private String regist_dt;
	/** 조회수	 */
	private int rocnt_co=0;
	/** 전체경로	 */
	private String tot_cours_cn;
	/** 업로드파일명	 */
	private String upload_file_nm;
	/** 썸네일파일명	 */
	private String thumb_file_nm;
	/** 게시판제목	 */
	private String bbs_sj;
	/** 회원ID	 */
	private String esntl_id;
	/** 회원명	 */
	private String mber_nm;
	/** 상태	 */
	private String sttus_se;
	/** 게시판내용2	 */
	private String bbs_cn2;
	/** 내용	 */
	private String bbs_cn;
	/** 센터ID	 */
	private String cnter_id;
	/** 답글수	 */
	private int reply_cnt=0;
	
	public int getBbs_ty_id() {
		return bbs_ty_id;
	}
	public void setBbs_ty_id(int bbs_ty_id) {
		this.bbs_ty_id = bbs_ty_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	
	public int getNtt_id() {
		return ntt_id;
	}
	public void setNtt_id(int ntt_id) {
		this.ntt_id = ntt_id;
	}
	public String getRegist_dt() {
		return regist_dt;
	}
	public void setRegist_dt(String regist_dt) {
		this.regist_dt = regist_dt;
	}
	public int getRocnt_co() {
		return rocnt_co;
	}
	public void setRocnt_co(int rocnt_co) {
		this.rocnt_co = rocnt_co;
	}
	public String getTot_cours_cn() {
		return tot_cours_cn;
	}
	public void setTot_cours_cn(String tot_cours_cn) {
		this.tot_cours_cn = tot_cours_cn;
	}
	public String getUpload_file_nm() {
		return upload_file_nm;
	}
	public void setUpload_file_nm(String upload_file_nm) {
		this.upload_file_nm = upload_file_nm;
	}
	public String getThumb_file_nm() {
		return thumb_file_nm;
	}
	public void setThumb_file_nm(String thumb_file_nm) {
		this.thumb_file_nm = thumb_file_nm;
	}
	public String getBbs_sj() {
		return bbs_sj;
	}
	public void setBbs_sj(String bbs_sj) {
		this.bbs_sj = bbs_sj;
	}
	public String getEsntl_id() {
		return esntl_id;
	}
	public void setEsntl_id(String esntl_id) {
		this.esntl_id = esntl_id;
	}
	
	public String getMber_nm() {
		return mber_nm;
	}
	public void setMber_nm(String mber_nm) {
		this.mber_nm = mber_nm;
	}
	public String getSttus_se() {
		return sttus_se;
	}
	public void setSttus_se(String sttus_se) {
		this.sttus_se = sttus_se;
	}
	public String getBbs_cn2() {
		return bbs_cn2;
	}
	public void setBbs_cn2(String bbs_cn2) {
		this.bbs_cn2 = bbs_cn2;
	}
	public String getBbs_cn() {
		return bbs_cn;
	}
	public void setBbs_cn(String bbs_cn) {
		this.bbs_cn = bbs_cn;
	}
	public String getCnter_id() {
		return cnter_id;
	}
	public void setCnter_id(String cnter_id) {
		this.cnter_id = cnter_id;
	}
	
	
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString(){
		return ToStringBuilder.reflectionToString(this);
	}
	
}
