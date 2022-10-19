package egovframework.goncs.RoomRent.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class RoomSetVO implements Serializable {

	/** 고유코드 */
	private int idx = 0;
	/** 날짜 */
	private String datexx = "";
	/** 방번호 */
	private String room_id = "";
	/** 예약유무 */
	private String rent_yn = "1";
	/** 작업자ID */
	private String sys_id = "";
	/** IP */
	private String com_ip = "";
	/** 작업일자 */
	private String reg_date = "";
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getDatexx() {
		return datexx;
	}
	public void setDatexx(String datexx) {
		this.datexx = datexx;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getRent_yn() {
		return rent_yn;
	}
	public void setRent_yn(String rent_yn) {
		this.rent_yn = rent_yn;
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
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
