package com.nicolas.ninjagold.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@PostMapping("/gold")
	public String enviarGold(HttpSession sesion, @RequestParam(value = "lugar", required = false) String lugar) {
		int gold = 0;
		ArrayList<String> act = new ArrayList<>();
		String timeStamp = new SimpleDateFormat("MMMM dd YYYY hh:mm a").format(new Date());

		if (sesion.getAttribute("gold") == null) {
			sesion.setAttribute("gold", gold);
			sesion.setAttribute("act", act);
			

		} else {
			gold = (int) sesion.getAttribute("gold");
			act = (ArrayList<String>) sesion.getAttribute("act");
		}
		
		if(lugar.equals("farm")) {
			int cantidad = new Random().nextInt(11)+10;
			gold += cantidad;
			act.add(0,"You entered a farm and earned "+cantidad+" gold "+"("+timeStamp+")");
			sesion.setAttribute("act", act);
			sesion.setAttribute("gold", gold);
			return "redirect:/gold";
		}
		if(lugar.equals("cave")) {
			int cantidad = new Random().nextInt(5,11);
			gold += cantidad;
			act.add(0,"You entered a cave and earned "+cantidad+" gold "+"("+timeStamp+")");
			sesion.setAttribute("act", act);
			sesion.setAttribute("gold", gold);
			return "redirect:/gold";
		}
		if(lugar.equals("house")) {
			int cantidad = new Random().nextInt(2,6);
			gold += cantidad;
			act.add(0,"You entered a house and earned "+cantidad+" gold "+"("+timeStamp+")");
			sesion.setAttribute("act", act);
			sesion.setAttribute("gold", gold);
			return "redirect:/gold";
		}
		if(lugar.equals("spa")) {
			int cantidad = new Random().nextInt(5,21);
			gold += cantidad;
			act.add(0,"You entered a spa and earned "+cantidad+" gold "+"("+timeStamp+")");
			sesion.setAttribute("act", act);
			sesion.setAttribute("gold", gold);
			return "redirect:/gold";
		}
		if(lugar.equals("casino")) {
			int cantidad = new Random().nextInt(-50,51);
			
			if(cantidad>=0) {
				gold += cantidad;
				act.add(0,"You entered a casino and earned "+cantidad+" gold "+"("+timeStamp+")");
			}
			else {
				gold += cantidad;
				act.add(0,"You entered a casino and lost "+cantidad+" gold "+"("+timeStamp+")");
			}
			
			sesion.setAttribute("act", act);
			sesion.setAttribute("gold", gold);
			return "redirect:/gold";
		}
		
		
		return "redirect:/gold";
	}

	@GetMapping("/gold")
	public String index(HttpSession sesion, Model model) {
		model.addAttribute("gold",sesion.getAttribute("gold"));
		model.addAttribute("act",sesion.getAttribute("act"));
		return "index.jsp";
	}
	
	@GetMapping("/actividades")
	public String actividades() {
		return "actividades.jsp";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/gold";
	}
}
