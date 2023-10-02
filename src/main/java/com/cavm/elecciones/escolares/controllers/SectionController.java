package com.cavm.elecciones.escolares.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cavm.elecciones.escolares.models.Section;
import com.cavm.elecciones.escolares.services.ISectionService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/section")
public class SectionController {
	
	@Autowired
	private ISectionService SectionService;
	
	
	@GetMapping("")
	public String grade(Model model) {
		Section nuevoSection = new Section();
		model.addAttribute("ruta", "section");
		model.addAttribute("title", "Sección");
		model.addAttribute("sections", SectionService.findAllByOrderById());
		model.addAttribute("nuevoSection", nuevoSection);
		return "section";
	}
	
	@PostMapping("")
	public String grade(@Valid Section nuevoSection, BindingResult result) {
		if(!result.hasErrors()) {
			SectionService.save(nuevoSection);
		}
		return "redirect:/section";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable Long id) {
		if(id >0) {
			SectionService.deleteById(id);
		}
		return "redirect:/section";
	}
	
}
