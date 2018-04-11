package com.dy.model;

import java.util.Date;

public class Goods {

	private int e_id; // '商品唯一id',
	private String equName; // '器材名称',
	private float sellPrice; // '器材出售价格',
	private float marketPrice; // '器材市场价',
	private int number; // '器材拥有数量',
	private int sellNumber; // '器材销售数量',
	private int isHot; // '是否热销，0为否1为是',
	private int isNew; // '是否新品，0为否1为是',
	private String equDescription; // '商品描述',
	private String vendorName; // '厂家名',
	private String equPicture; // '商品图片',
	private int cateSecId; // '二级分类，指向categorysecond表的cateSecId',
	private int uid;// "发布用户id"
	private int status;// 商品状态
	private Date releaseTime;

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public String getEquName() {
		return equName;
	}

	public void setEquName(String equName) {
		this.equName = equName;
	}

	public float getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(float sellPrice) {
		this.sellPrice = sellPrice;
	}

	public float getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(float marketPrice) {
		this.marketPrice = marketPrice;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getSellNumber() {
		return sellNumber;
	}

	public void setSellNumber(int sellNumber) {
		this.sellNumber = sellNumber;
	}

	public int getIsHot() {
		return isHot;
	}

	public void setIsHot(int isHot) {
		this.isHot = isHot;
	}

	public int getIsNew() {
		return isNew;
	}

	public void setIsNew(int isNew) {
		this.isNew = isNew;
	}

	public String getEquDescription() {
		return equDescription;
	}

	public void setEquDescription(String equDescription) {
		this.equDescription = equDescription;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getEquPicture() {
		return equPicture;
	}

	public void setEquPicture(String equPicture) {
		this.equPicture = equPicture;
	}

	public int getCateSecId() {
		return cateSecId;
	}

	public void setCateSecId(int cateSecId) {
		this.cateSecId = cateSecId;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}

	public String toString() {
		return "{e_id:" + e_id + "equName:" + equName + "sellPrice:" + sellPrice + "marketPrice:" + marketPrice + "number:" + number + "器材销售数量sellNumber:" + sellNumber + "是否热销，0为否1为是isHot:" + isHot + "是否新品，0为否1为是isNew:" + isNew + "商品描述equDescription:" + equDescription + "厂家名vendorName:" + vendorName
				+ "商品图片equPicture:" + equPicture + "cateSecId:" + cateSecId + "uid:" + uid + "releaseTime:" + releaseTime +"}";
	}
}
