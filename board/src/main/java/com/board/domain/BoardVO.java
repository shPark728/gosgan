package com.board.domain;

import java.util.Date;

public class BoardVO {

	private int board_no;
	private int board_view_count;
	private String post_title;
	private String board_content;
	private int post_state;
	private Date post_created_date;
	private Date post_updated_date;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getBoard_view_count() {
		return board_view_count;
	}
	public void setBoard_view_count(int board_view_count) {
		this.board_view_count = board_view_count;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getPost_state() {
		return post_state;
	}
	public void setPost_state(int post_state) {
		this.post_state = post_state;
	}
	public Date getPost_created_date() {
		return post_created_date;
	}
	public void setPost_created_date(Date post_created_date) {
		this.post_created_date = post_created_date;
	}
	public Date getPost_updated_date() {
		return post_updated_date;
	}
	public void setPost_updated_date(Date post_updated_date) {
		this.post_updated_date = post_updated_date;
	}
	
}
