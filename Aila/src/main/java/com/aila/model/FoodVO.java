package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter

public class FoodVO {
	private int food_idx;
	private String company_key;
	private String food_name;
	private String food_type;
	private int food_price;
	private int deli_charge;
	private int total_purchase;
}
