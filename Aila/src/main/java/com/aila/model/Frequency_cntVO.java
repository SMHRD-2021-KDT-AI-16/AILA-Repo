package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class Frequency_cntVO {
	private int fc_idx;
	private int food_idx;
	private String food_name;
	private String fc_word;
	private int fc_rank;
	private int fc_cnt;
	private String created_at;
	private int fc_emotion;
	private String fc_resource;
	
}