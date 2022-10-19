package egovframework.goncs.memto.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class StatisVO implements Serializable {

	private String sdate = "";
	private String edate = "";
	
	private String us_major11 = "";
	private String us_major11_nm = "";
	/** 문의분야_소분류 */
	private String us_major12 = "";
	private String us_major12_nm = "";
	
	private int s_item1 = 0;
	private int s_item2 = 0;
	private int s_item3 = 0;
	private int s_item4 = 0;
	private int s_item5 = 0;
	private int s_item6 = 0;
	private int s_item7 = 0;
	private int s_item8 = 0;
	private int s_item9 = 0;
	private int s_item10 = 0;
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
	public int getS_item1() {
		return s_item1;
	}
	public void setS_item1(int s_item1) {
		this.s_item1 = s_item1;
	}
	public int getS_item2() {
		return s_item2;
	}
	public void setS_item2(int s_item2) {
		this.s_item2 = s_item2;
	}
	public int getS_item3() {
		return s_item3;
	}
	public void setS_item3(int s_item3) {
		this.s_item3 = s_item3;
	}
	public int getS_item4() {
		return s_item4;
	}
	public void setS_item4(int s_item4) {
		this.s_item4 = s_item4;
	}
	public int getS_item5() {
		return s_item5;
	}
	public void setS_item5(int s_item5) {
		this.s_item5 = s_item5;
	}
	public int getS_item6() {
		return s_item6;
	}
	public void setS_item6(int s_item6) {
		this.s_item6 = s_item6;
	}
	public int getS_item7() {
		return s_item7;
	}
	public void setS_item7(int s_item7) {
		this.s_item7 = s_item7;
	}
	public int getS_item8() {
		return s_item8;
	}
	public void setS_item8(int s_item8) {
		this.s_item8 = s_item8;
	}
	public int getS_item9() {
		return s_item9;
	}
	public void setS_item9(int s_item9) {
		this.s_item9 = s_item9;
	}
	public int getS_item10() {
		return s_item10;
	}
	public void setS_item10(int s_item10) {
		this.s_item10 = s_item10;
	}
	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }
}
