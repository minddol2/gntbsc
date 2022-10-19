package egovframework.goncs.member.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class McodeVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	/** maxcod */
	private int maxcod = 0;
	/** 코드 */
	private String code = "";
	/** 코드명 */
	private String cd_name = "";
	/** 등록일자 */
	private String reg_date = "";
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMaxcod() {
		return maxcod;
	}
	public void setMaxcod(int maxcod) {
		this.maxcod = maxcod;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCd_name() {
		return cd_name;
	}
	public void setCd_name(String cd_name) {
		this.cd_name = cd_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
