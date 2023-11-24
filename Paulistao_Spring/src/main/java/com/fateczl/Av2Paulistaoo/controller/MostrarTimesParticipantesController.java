package com.fateczl.Av2Paulistaoo.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fateczl.Av2Paulistaoo.model.Time;
import com.fateczl.Av2Paulistaoo.persistence.TimesDao;

@Controller
public class MostrarTimesParticipantesController {
	
	@Autowired
	TimesDao tDao;
	
	@RequestMapping(name = "listarTimes", value = "/listarTimes", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
			return new ModelAndView("listarTimes");
		}
	
	@RequestMapping(name="listarTimes", value = "/listarTimes", method = RequestMethod.POST)
	public ModelAndView formarGrupos(ModelMap model, @RequestParam Map<String,String> allParam ) {
		
		String btnEnviar = allParam.get("enviar");
		
		List<Time> Times = new ArrayList<>();
	    String erro = "";
	    String saida = "";
	    
	    try {
	    	if(btnEnviar.equalsIgnoreCase("LISTAR")) {
	    		Times = tDao.listarTimes();
	    	}
	    } catch (SQLException | ClassNotFoundException e) {
	    	erro = ("Não foi possível listar os times, tente novamente. ") + e.getMessage();
	    } finally {
	    	model.addAttribute("erro", erro);
	    	model.addAttribute("saida", saida);
	    	model.addAttribute("Times", Times);
	    	}
        
		return new ModelAndView("listarTimes");
	}

}
