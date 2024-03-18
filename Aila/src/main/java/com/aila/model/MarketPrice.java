package com.aila.model;

public class MarketPrice {
	
	private int mp_idx;
	private String market_name;
	private String food_unit;  // 식품 포장단위 
	private String food_volumn; // 식품 거래량
	private String food_date; // 식품 거래일자
	
	
	public int getMp_idx() {
		return mp_idx;
	}
	public void setMp_idx(int mp_idx) {
		this.mp_idx = mp_idx;
	}
	public String getMarket_name() {
		return market_name;
	}
	public void setMarket_name(String market_name) {
		this.market_name = market_name;
	}
	public String getFood_unit() {
		return food_unit;
	}
	public void setFood_unit(String food_unit) {
		this.food_unit = food_unit;
	}
	public String getFood_volumn() {
		return food_volumn;
	}
	public void setFood_volumn(String food_volumn) {
		this.food_volumn = food_volumn;
	}
	public String getFood_date() {
		return food_date;
	}
	public void setFood_date(String food_date) {
		this.food_date = food_date;
	}
	
	
}
