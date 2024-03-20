package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter

public class ReviewVO {
	
	private int review_idx;
	private int food_idx;
	private String review_content;
	private String created_at;
	private int review_rating;
	private String review_source;
	
} 
