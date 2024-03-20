package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter

public class ReviewVO {
	
	private String review_idx;
	private String review_content;
	private String review_source;
	private int review_date;
	private int review_rating;

} 
