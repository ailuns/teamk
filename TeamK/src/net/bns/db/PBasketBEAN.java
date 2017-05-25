package net.bns.db;

import java.sql.Timestamp;

public class PBasketBEAN {
	private String [] countp;
	private int cost,ori_cost,pb_num,ori_num;
	private String id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getOri_num() {
		return ori_num;
	}
	public void setOri_num(int ori_num) {
		this.ori_num = ori_num;
	}
	public int getPb_num() {
		return pb_num;
	}
	public void setPb_num(int pb_num) {
		this.pb_num = pb_num;
	}
	private String subject, intro, img;
	private Timestamp date;
	public int getOri_cost() {
		return ori_cost;
	}
	public void setOri_cost(int ori_cost) {
		this.ori_cost = ori_cost;
	}
	public String[] getCountp() {
		return countp;
	}
	public void setCountp(String[] countp) {
		this.countp = countp;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

}
