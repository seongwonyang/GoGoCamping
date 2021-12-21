package org.kosta.gogocamping.model.domain;

public class ProductVO {
	private int productId;
	private String productName;
	private int price;
	private String productInfo;
	private int stock;
	private String productImg;
	private String productImgStored;
	private SellerVO sellerVO;
	private CategoryVO categoryVO;
	
	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductVO(String productName, int price, String productInfo, int stock, String productImg, String productImgStored, SellerVO sellerVO,
			CategoryVO categoryVO) {
		super();
		this.productName = productName;
		this.price = price;
		this.productInfo = productInfo;
		this.stock = stock;
		this.productImg = productImg;
		this.productImgStored = productImgStored;
		this.sellerVO = sellerVO;
		this.categoryVO = categoryVO;
	}
	
	
	public ProductVO(int productId, String productName, int price, String productInfo, int stock, String productImg, String productImgStored,
			SellerVO sellerVO, CategoryVO categoryVO) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.productInfo = productInfo;
		this.stock = stock;
		this.productImg = productImg;
		this.productImgStored = productImgStored;
		this.sellerVO = sellerVO;
		this.categoryVO = categoryVO;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductImgStored() {
		return productImgStored;
	}

	public void setProductImgStored(String productImgStored) {
		this.productImgStored = productImgStored;
	}

	public SellerVO getSellerVO() {
		return sellerVO;
	}

	public void setSellerVO(SellerVO sellerVO) {
		this.sellerVO = sellerVO;
	}

	public CategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", price=" + price
				+ ", productInfo=" + productInfo + ", stock=" + stock + ", productImg=" + productImg
				+ ", productImgStored=" + productImgStored + ", sellerVO=" + sellerVO + ", categoryVO=" + categoryVO
				+ "]";
	}
	
}

