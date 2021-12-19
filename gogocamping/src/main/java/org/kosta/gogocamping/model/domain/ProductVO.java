package org.kosta.gogocamping.model.domain;

public class ProductVO {
	   private int productId;
	   private String productName;
	   private int price;
	   private String productInfo;
	   private int stock;
	   private String productImg;
	   private String sellerId;
	   private int categoryNo;

	   public ProductVO() {
	      super();
	      // TODO Auto-generated constructor stub
	   }

	   public ProductVO(int productId, String productName, int price, String productInfo, int stock, String productImg,
	         String sellerId, int categoryNo) {
	      super();
	      this.productId = productId;
	      this.productName = productName;
	      this.price = price;
	      this.productInfo = productInfo;
	      this.stock = stock;
	      this.productImg = productImg;
	      this.sellerId = sellerId;
	      this.categoryNo = categoryNo;
	   }

	// sequence로 생성되는 productId를 제외한 생성자
	   public ProductVO(String productName, int price, String productInfo, int stock, String productImg, String sellerId,
	         int categoryNo) {
	      super();
	      this.productName = productName;
	      this.price = price;
	      this.productInfo = productInfo;
	      this.stock = stock;
	      this.productImg = productImg;
	      this.sellerId = sellerId;
	      this.categoryNo = categoryNo;
	   }

	   public ProductVO(String productName, int price, String productImg) {
		super();
		this.productName = productName;
		this.price = price;
		this.productImg = productImg;
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

	   public String getSellerId() {
	      return sellerId;
	   }

	   public void setSellerId(String sellerId) {
	      this.sellerId = sellerId;
	   }

	   public int getCategoryNo() {
	      return categoryNo;
	   }

	   public void setCategoryNo(int categoryNo) {
	      this.categoryNo = categoryNo;
	   }

	   @Override
	   public String toString() {
	      return "ProductVO [productId=" + productId + ", productName=" + productName + ", price=" + price
	            + ", productInfo=" + productInfo + ", stock=" + stock + ", productImg=" + productImg + ", sellerId="
	            + sellerId + ", categoryNo=" + categoryNo + "]";
	   }

	}