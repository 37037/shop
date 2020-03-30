package com.ahpu.ssm.pojo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Order implements Serializable{
	private static final long serialVersionUID = 1876028262352613849L;
	private String oid;
	private String address;
	private String name;
	private String telephone;
	private Date ordertime;
	private Integer state;
	private Double total;
	private List<OrderItem> items = new ArrayList<>();
	private User user;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date date) {
		this.ordertime = date;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public List<OrderItem> getItems() {
		return items;
	}
	public void setItems(List<OrderItem> items) {
		this.items = items;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Order [oid=" + oid + ", address=" + address + ", name=" + name + ", telephone=" + telephone
				+ ", ordertime=" + ordertime + ", state=" + state + ", total=" + total + ", items=" + items + "]";
	}
}	
