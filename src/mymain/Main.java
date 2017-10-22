package mymain;

public class Main {
	private String tid,tdate,amount,remarks;
	
	public String getTid(){
		return this.tid;
	}
	public String getTdate(){
		return this.tdate;
	}
	public String getAmount(){
		return this.amount;
	}
	public String getRemarks(){
		return this.remarks;
	}
	
	public void setTid(String tid){
		this.tid = tid;
	}
	public void setTdate(String tdate){
		this.tdate = tdate;
	}
	public void setAmount(String amount){
		this.amount = amount;
	}
	public void setRemarks(String remarks){
		this.remarks = remarks;
	}
}
