package com.dy.model;

/**
 * @author DY
 *
 * USER:Deng
 * DATE:2018年3月13日
 * TIME:下午4:03:21
 *
 */
public class CartItem {
		
		private Goods goods; //商品信息
		private int goodNum; // 商品数量
		private double subtotal; //商品小计价格
		
		
		public Goods getGoods() {
			return goods;
		}
		public void setGoods(Goods goods) {
			this.goods = goods;
		}
		public int getGoodNum() {
			return goodNum;
		}
		public void setGoodNum(int goodNum) {
			this.goodNum = goodNum;
		}
		
		public double getSubtotal() {
			return goodNum * goods.getSellPrice();
		}

		
 
}
