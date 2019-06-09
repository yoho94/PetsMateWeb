package com.petsmate.dto;

import java.util.List;

public class PetList {
	private List<PetVO> petList = null;

	public List<PetVO> getPetList() {
		return petList;
	}

	public void setPetList(List<PetVO> petList) {
		this.petList = petList;
	}

	@Override
	public String toString() {
		return "PetList [petList=" + petList + "]";
	}
	
}
