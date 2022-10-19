package egovframework.goncs.memto.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MentoComentVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	private String counsel_idx = "";
	/** 작성자 ID */
	private String w_id = "";
	/** 작성자명 */
	private String w_name = "";
	private String us_gbn = "";
	/** 등록일자 */
	private String reg_date = "";
	/** 내용 */
	private String content1 = "";
	private String com_ip = "";
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getW_id() {
		return w_id;
	}
	public void setW_id(String w_id) {
		this.w_id = w_id;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getContent1() {
		return content1;
	}
	public void setContent1(String content1) {
		this.content1 = content1;
	}
	public String getUs_gbn() {
		return us_gbn;
	}
	public void setUs_gbn(String us_gbn) {
		this.us_gbn = us_gbn;
	}
	public String getCounsel_idx() {
		return counsel_idx;
	}
	public void setCounsel_idx(String counsel_idx) {
		this.counsel_idx = counsel_idx;
	}
	public String getCom_ip() {
		return com_ip;
	}
	public void setCom_ip(String com_ip) {
		this.com_ip = com_ip;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
