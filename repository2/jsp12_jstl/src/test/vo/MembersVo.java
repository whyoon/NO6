package test.vo;

import java.util.Date;

public class MembersVo {
	private int num;
	private String name;
	private String phone;
	private String addr;
	private Date regdate;
	
	public MembersVo() {} // 디폴트생성자
	
	public MembersVo(int num, String name, String phone, String addr, Date regdate) {
		super();
		this.num = num;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.regdate = regdate;
	}
	
	// setter 메소드
	public int getNum() {
		return num;
	}

	

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	// getter 메소드
	@Override
	public String toString() {
		return "MembersVo [num=" + num + ", name=" + name + ", phone=" + phone + ", addr=" + addr + ", regdate="
				+ regdate + "]";
	}
}	
