package model.DTO;

public class ReservationDTO {
	private int rvNum;
	private String rvMId;
	private int rvNumPerson;
	private int rvPNum;
	private int rvPPrice;
	private String rvStatus;
	private int rvTotalPrice;
	
	public int getRvNum() {
		return rvNum;
	}
	public void setRvNum(int rvNum) {
		this.rvNum = rvNum;
	}
	public String getRvMId() {
		return rvMId;
	}
	public void setRvMId(String rvMId) {
		this.rvMId = rvMId;
	}
	public int getRvNumPerson() {
		return rvNumPerson;
	}
	public void setRvNumPerson(int rvNumPerson) {
		this.rvNumPerson = rvNumPerson;
	}
	public int getRvPNum() {
		return rvPNum;
	}
	public void setRvPNum(int rvPNum) {
		this.rvPNum = rvPNum;
	}
	public int getRvPPrice() {
		return rvPPrice;
	}
	public void setRvPPrice(int rvPPrice) {
		this.rvPPrice = rvPPrice;
	}
	public String getRvStatus() {
		return rvStatus;
	}
	public void setRvStatus(String rvStatus) {
		this.rvStatus = rvStatus;
	}
	public int getRvTotalPrice() {
		return rvTotalPrice;
	}
	public void setRvTotalPrice(int rvTotalPrice) {
		this.rvTotalPrice = rvTotalPrice;
	}
	
}
