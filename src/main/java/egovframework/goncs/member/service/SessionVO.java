package egovframework.goncs.member.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class SessionVO implements Serializable {

	/** 고유코드 */
	private int sidx = 0;
	/** 성명 */
	private String sus_name = "";
	/** 아이디 */
	private String sus_id = "";
	/** 비밀번호 */
	private String sus_pw = "";
	/** 직급 */
	private String sus_position = "";
	/** 연락처 **/
	private String sus_phone = "";
	/** 사용상태 (1:관리자 3:일반회원 5:비회원) */
	private int sus_level = 5;
	private String sus_gbn = "1";
	public int getSidx() {
		return sidx;
	}
	public void setSidx(int idx) {
		this.sidx = idx;
	}
	public String getSus_name() {
		return sus_name;
	}
	public void setSus_name(String us_name) {
		this.sus_name = us_name;
	}
	public String getSus_id() {
		return sus_id;
	}
	public void setSus_id(String sus_id) {
		this.sus_id = sus_id;
	}
	public String getSus_pw() {
		return sus_pw;
	}
	public void setSus_pw(String us_pw) {
		this.sus_pw = us_pw;
	}
	public String getSus_position() {
		return sus_position;
	}
	public void setSus_position(String us_position) {
		this.sus_position = us_position;
	}
	public String getSus_phone() {
		return sus_phone;
	}
	public void setSus_phone(String us_phone) {
		this.sus_phone = us_phone;
	}
	public int getSus_level() {
		return sus_level;
	}
	public void setSus_level(int us_level) {
		this.sus_level = us_level;
	}
	public String getSus_gbn() {
		return sus_gbn;
	}
	public void setSus_gbn(String us_gbn) {
		this.sus_gbn = us_gbn;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
	
}
