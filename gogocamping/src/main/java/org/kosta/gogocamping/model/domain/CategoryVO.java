package org.kosta.gogocamping.model.domain;

public class CategoryVO {
	private int categoryNo;
	private String categoryName;
	private String detailCategoryName;
	
	public CategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CategoryVO(String categoryName, String detailCategoryName) {
		super();
		this.categoryName = categoryName;
		this.detailCategoryName = detailCategoryName;
	}

	public CategoryVO(int categoryNo, String categoryName, String detailCategoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.detailCategoryName = detailCategoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getDetailCategoryName() {
		return detailCategoryName;
	}

	public void setDetailCategoryName(String detailCategoryName) {
		this.detailCategoryName = detailCategoryName;
	}

	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", detailCategoryName="
				+ detailCategoryName + "]";
	}
	
}
