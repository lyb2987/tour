package model.DTO;


public class ReservationAndFPListAndP {
	private ReservationDTO rsv;
	private FellowPassengerDTO fp;
	private PackageDTO pkg;
	
	public ReservationDTO getRsv() {
		return rsv;
	}
	public void setRsv(ReservationDTO rsv) {
		this.rsv = rsv;
	}
	public FellowPassengerDTO getFp() {
		return fp;
	}
	public void setFp(FellowPassengerDTO fp) {
		this.fp = fp;
	}
	public PackageDTO getPkg() {
		return pkg;
	}
	public void setPkg(PackageDTO pkg) {
		this.pkg = pkg;
	}
}
