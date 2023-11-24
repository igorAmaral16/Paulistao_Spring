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

import com.fateczl.Av2Paulistaoo.model.Grupo;
import com.fateczl.Av2Paulistaoo.persistence.GruposDao;

@Controller
public class FormarGruposController {
	
	@Autowired
	GruposDao gDao;
	
	@RequestMapping(name = "formarGrupos", value = "/formarGrupos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
			return new ModelAndView("formarGrupos");
		}
	
	@RequestMapping(name="formarGrupos", value = "/formarGrupos", method = RequestMethod.POST)
	public ModelAndView formarGrupos(ModelMap model, @RequestParam Map<String,String> allParam ) {
		
		String btnEnviar = allParam.get("enviar");
		
		List<Grupo> grupos = new ArrayList<>();
        String erro = "";
        String saida = "";
        
        try {
     	   if(btnEnviar.equalsIgnoreCase("GERAR")) {
     		   grupos = gDao.gerarGrupo();
     	   }
     	   
        } catch (SQLException | ClassNotFoundException e) {
     	   erro = ("Não foi possível gerar grupos, tente novamente. ") + e.getMessage();
        } finally {
     	   model.addAttribute("erro", erro);
     	   model.addAttribute("saida", saida);
     	   model.addAttribute("grupos", grupos);
        }
        
		return new ModelAndView("formarGrupos");
	}
	
}
