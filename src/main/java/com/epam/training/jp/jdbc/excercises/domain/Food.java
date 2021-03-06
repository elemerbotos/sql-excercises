package com.epam.training.jp.jdbc.excercises.domain;


public class Food {

	private int id;
	
	private String name;
	private int price;
	private int calories;
	private boolean isVegan;
	
	public int getPrice() {
		return price;
	}

	public Food setPrice(int price) {
		this.price = price;
		return this;
	}

	public int getId() {
		return id;
	}

	public Food setId(int id) {
		this.id = id;
		return this;
	}

	public String getName() {
		return name;
	}

	public Food setName(String name) {
		this.name = name;
		return this;
	}

	public int getCalories() {
		return calories;
	}

	public Food setCalories(int calories) {
		this.calories = calories;
		return this;
	}

	public boolean isVegan() {
		return isVegan;
	}

	public Food setVegan(boolean isVegan) {
		this.isVegan = isVegan;
		return this;
	}

	@Override
	public String toString() {
		return "Food [id=" + id + ", name=" + name + ", price=" + price + ", calories=" + calories + ", isVegan=" + isVegan + "]";
	}
	
	
	
}
