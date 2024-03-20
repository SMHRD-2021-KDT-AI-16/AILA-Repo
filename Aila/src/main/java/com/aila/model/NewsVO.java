package com.aila.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter

public class NewsVO {

	private int news_idx;
	private String news_name;
	private String news_link;
	private String created_at;
	private int news_publisher;
}
