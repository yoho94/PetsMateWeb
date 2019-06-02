package com.petsmate.dto;

public class PetVO {
	private String id, name, ps;
	private int pet_code, weight;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPs() {
		return ps;
	}
	public void setPs(String ps) {
		this.ps = ps;
	}
	public int getPet_code() {
		return pet_code;
	}
	public void setPet_code(int pet_code) {
		this.pet_code = pet_code;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "PetVO [id=" + id + ", name=" + name + ", ps=" + ps + ", pet_code=" + pet_code + ", weight=" + weight
				+ "]";
	}
	
	

}
