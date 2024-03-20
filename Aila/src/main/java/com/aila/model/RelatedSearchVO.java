package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter

public class RelatedSearchVO {
	
	private int rel_search_idx;
	private String rel_search;
	private String search;
	private int rel_search_rank;
	private int search_cnt;
	private int click_cnt;
}
