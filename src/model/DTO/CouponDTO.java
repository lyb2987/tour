package model.DTO;

public class CouponDTO {
	private int cNum;
	private String cMId;
	private String cName;
	private int cDcPrice;
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getcMId() {
		return cMId;
	}
	public void setcMId(String cMId) {
		this.cMId = cMId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public int getcDcPrice() {
		return cDcPrice;
	}
	public void setcDcPrice(int cDcPrice) {
		this.cDcPrice = cDcPrice;
	}
}
