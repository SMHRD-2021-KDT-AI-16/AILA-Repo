package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter

public class NewsVO {

	private int news_idx;
	private String news_key;
	private String news_title;
	private String news_link;
	private String news_publisher;
	private String created_at;
}
