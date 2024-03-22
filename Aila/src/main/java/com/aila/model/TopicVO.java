package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class TopicVO {

	
	private int topic_idx;
	private int food_idx;
	private String food_name;
	private int topic_emotion;
	private int topic_rank;
	private String topic_content;
	private int topic_rating;
	private String created_at;
	private String review_source;
	
	
	
}
