package com.epam.easyshopway.service;

import java.util.List;

import com.epam.easyshopway.model.Cupboard;

public class Main {

	public static void main(String[] args) {
		Cupboard cupboard = new Cupboard(null, 3, "different", "π³ηνε", true);
//		int i= CupboardService.insert(cupboard);
//		int i = CupboardService.delete(1);
//		int i = CupboardService.update(1, cupboard);
//		List<Cupboard> cupboards= CupboardService.getAll();
		Cupboard cupboard2 = CupboardService.getById(1); 
		System.out.println(cupboard2.getDescriptionEn());
	}

}
