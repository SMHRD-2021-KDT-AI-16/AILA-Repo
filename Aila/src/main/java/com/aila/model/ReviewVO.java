package com.aila.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.protobuf.TextFormat.ParseException;

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
	
	public String getMonth() {
        // 날짜 형식을 파싱하여 월 정보만 추출
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(created_at);
            SimpleDateFormat monthFormat = new SimpleDateFormat("yyyy-MM");
            return monthFormat.format(date);
        } catch (java.text.ParseException e) {
            return null;
        }
    }
	
	
} 
