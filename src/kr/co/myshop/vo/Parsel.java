package kr.co.myshop.vo;
//배송 클래스
public class Parsel {
	private int parselNo;			//배송코드
	private String parselAddr;		//배송지
	private String cusTel;			//연락처
	private String parselCompany;	//배송회사
	private String parselTel;		//배송기사연락처
	private int parselState;		//배송상태 - (0:배송전,1:배송중,2:도착,3:구매결정)
	
	
	
	public int getParselNo() {
		return parselNo;
	}
	public void setParselNo(int parselNo) {
		this.parselNo = parselNo;
	}
	
	public String getParselAddr() {
		return parselAddr;
	}
	public void setParselAddr(String parselAddr) {
		this.parselAddr = parselAddr;
	}
	public String getCusTel() {
		return cusTel;
	}
	public void setCusTel(String cusTel) {
		this.cusTel = cusTel;
	}
	public String getParselCompany() {
		return parselCompany;
	}
	public void setParselCompany(String parselCompany) {
		this.parselCompany = parselCompany;
	}
	public String getParselTel() {
		return parselTel;
	}
	public void setParselTel(String parselTel) {
		this.parselTel = parselTel;
	}
	public int getParselState() {
		return parselState;
	}
	public void setParselState(int parselState) {
		this.parselState = parselState;
	}
	
	

}
