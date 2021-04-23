package com.temp.CityTemp.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class TempController {
	
	@GetMapping("/temp")
	public ModelAndView show(@RequestParam("city") String city,ModelMap model) {
		 try {
		 RestTemplate restTemplate = new RestTemplate();
		 
		 String response = restTemplate.getForObject("http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=56724058e93c04beb8781191db4e5e34", String.class);
		 model.put("result",response);
		 System.out.println(response);
		 }
		 catch(Exception e) {
			 String response="City : "+city+" is Not Found";
			 model.put("error",response);
		 }
		 return new ModelAndView("login");
		 
	}
		 
	
	@GetMapping(value="/login")
	public ModelAndView view() {
		return new ModelAndView("login");
	}

}
