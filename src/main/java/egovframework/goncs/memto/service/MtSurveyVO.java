package egovframework.goncs.memto.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class MtSurveyVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	/** 아이디 */
	private String counsel_idx = "";
	private String w_id = "";
	private String w_name = "";
	private String w_mobile = "";
	private String reg_date = "";
	private String ans_1 = "";
	private String ans_2 = "";
	private String ans_3 = "";
	private String ans_4 = "";
	private String ans_5 = "";
	private String ans_6 = "";
	private String ans_7 = "";
	private int hpoint = 0;
	private float apoint = 0;
	private int hpoint2 = 0;
	private float apoint2 = 0;
	private String com_ip = "";
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCounsel_idx() {
		return counsel_idx;
	}
	public void setCounsel_idx(String counsel_idx) {
		this.counsel_idx = counsel_idx;
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
	public String getAns_1() {
		return ans_1;
	}
	public void setAns_1(String ans_1) {
		this.ans_1 = ans_1;
	}
	public String getAns_2() {
		return ans_2;
	}
	public void setAns_2(String ans_2) {
		this.ans_2 = ans_2;
	}
	public String getAns_3() {
		return ans_3;
	}
	public void setAns_3(String ans_3) {
		this.ans_3 = ans_3;
	}
	public String getAns_4() {
		return ans_4;
	}
	public void setAns_4(String ans_4) {
		this.ans_4 = ans_4;
	}
	public String getAns_5() {
		return ans_5;
	}
	public void setAns_5(String ans_5) {
		this.ans_5 = ans_5;
	}
	public String getAns_6() {
		return ans_6;
	}
	public void setAns_6(String ans_6) {
		this.ans_6 = ans_6;
	}
	public String getAns_7() {
		return ans_7;
	}
	public void setAns_7(String ans_7) {
		this.ans_7 = ans_7;
	}
	public int getHpoint() {
		return hpoint;
	}
	public void setHpoint(int hpoint) {
		this.hpoint = hpoint;
	}
	public float getApoint() {
		return apoint;
	}
	public void setApoint(float apoint) {
		this.apoint = apoint;
	}
	public String getCom_ip() {
		return com_ip;
	}
	public void setCom_ip(String com_ip) {
		this.com_ip = com_ip;
	}
	public int getHpoint2() {
		return hpoint2;
	}
	public void setHpoint2(int hpoint2) {
		this.hpoint2 = hpoint2;
	}
	public float getApoint2() {
		return apoint2;
	}
	public void setApoint2(float apoint2) {
		this.apoint2 = apoint2;
	}
	public String getW_mobile() {
		return w_mobile;
	}
	public void setW_mobile(String w_mobile) {
		this.w_mobile = w_mobile;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
