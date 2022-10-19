package egovframework.goncs.member.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class LoginVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	/** 성명 */
	private String us_name = "";
	/** 아이디 */
	private String us_id = "";
	/** 비밀번호 */
	private String us_pw = "";
	/** 직급 */
	private String us_position = "";
	/** 연락처 **/
	private String us_phone = "";
	/** 사용상태 (1:관리자 3:일반회원 5:비회원) */
	private int us_level = 5;
	private String us_gbn = "1";
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
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
	public String getUs_gbn() {
		return us_gbn;
	}
	public void setUs_gbn(String us_gbn) {
		this.us_gbn = us_gbn;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
	
}
