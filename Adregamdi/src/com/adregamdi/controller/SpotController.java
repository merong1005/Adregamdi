package com.adregamdi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.adregamdi.dto.SpotDTO;
import com.adregamdi.service.SpotService;

@Controller
@RequestMapping("/spot")
public class SpotController {
	
	@Autowired
	SpotService spotService;

	@GetMapping("/local_main")
	public String localMain() {
		return "spot/local_main";
	}
	
	@GetMapping("/local_detail")
	public String localDetail(@RequestParam("local_no") int local_no) {
		return "spot/local_detail";
	}
	
	@GetMapping("/thema_main")
	public String themaMain() {
		return "spot/thema_main";
	}
	
	@GetMapping("/thema_detail")
	public String themaDetail(@RequestParam("thema_no") int thema_no) {
		return "spot/thema_detail";
	}
		
	@GetMapping("/write")
	public String write(@ModelAttribute("writeSpotDTO") SpotDTO writeSpotDTO, Model model ) {
		
		return "spot/write";
	}
	
	
	@PostMapping("/write_proc")
	public String spotWriteProc(@ModelAttribute("writeSpotDTO") SpotDTO writeSpotDTO, BindingResult result, Model model) {
		
		
		if(result.hasErrors()) {
			return "spot/write";
		}
		
		spotService.addSpotInfo(writeSpotDTO);
		
		model.addAttribute("spot_idx", writeSpotDTO.getSpot_idx());
		
		
		
		return "spot/write_success";
	}
	
	
	@GetMapping("/read") 
	public String spotRead(@ModelAttribute("readSpotDTO")SpotDTO readSpotDTO, @RequestParam("spot_idx")int spot_idx, Model model){
		
		readSpotDTO = spotService.getSpotInfo(spot_idx);
		model.addAttribute("readSpotDTO", readSpotDTO);
		
		return "spot/read";
	}
	
	@GetMapping("/modify")
	public String spotModify(@ModelAttribute("modifySpotDTO")SpotDTO modifySpotDTO) {
		return "spot/modify";
	}
	
	@PostMapping("/modify_proc")
	public String spotModifyProc(@ModelAttribute("modifySpotDTO")SpotDTO modifySpotDTO, BindingResult result) {
		
		return "spot/modify_success";
	}
	
	@GetMapping("/delete") 
	public String spotDelete() {
		return "spot/delete";
	}
	
	
}