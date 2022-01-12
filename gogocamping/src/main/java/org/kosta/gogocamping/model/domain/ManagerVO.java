package org.kosta.gogocamping.model.domain;

public class ManagerVO {
	private String managerId;
	private String managerName;
	private String managerPassword;
	
	public ManagerVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ManagerVO(String managerId, String managerName, String managerPassword) {
		super();
		this.managerId = managerId;
		this.managerName = managerName;
		this.managerPassword = managerPassword;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPassword() {
		return managerPassword;
	}

	public void setManagerPassword(String managerPassword) {
		this.managerPassword = managerPassword;
	}
	
	
}
