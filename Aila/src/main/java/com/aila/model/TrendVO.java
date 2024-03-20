package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Setter
@Getter

public class TrendVO {

	private String trend_index;
	private String created_at;
	private String search_form;
	private int search_rank;
	private String search_word;

}
