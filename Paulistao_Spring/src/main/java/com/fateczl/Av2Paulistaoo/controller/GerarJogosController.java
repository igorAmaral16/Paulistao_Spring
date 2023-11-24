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

import com.fateczl.Av2Paulistaoo.model.Jogo;
import com.fateczl.Av2Paulistaoo.persistence.JogosDao;

@Controller
public class GerarJogosController {
	
	@Autowired
	JogosDao jDao;
	
	@RequestMapping(name = "listarJogos", value = "/listarJogos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
			return new ModelAndView("listarJogos");
		}
	
	@RequestMapping(name="listarJogos", value = "/listarJogos", method = RequestMethod.POST)
	public ModelAndView formarGrupos(ModelMap model, @RequestParam Map<String,String> allParam ) {
		
		String btnEnviar = allParam.get("enviar");
		
		List<Jogo> Jogos = new ArrayList<>();
        String erro = "";
        String saida = "";
        
        try {
     	   if(btnEnviar.equalsIgnoreCase("LISTAR")) {
     		   Jogos = jDao.listarJogos();
     	   }
     	   
        } catch (SQLException | ClassNotFoundException e) {
     	   erro = ("Não foi possível listar os jogos, tente novamente. ") + e.getMessage();
        } finally {
     	  model.addAttribute("erro", erro);
     	  model.addAttribute("saida", saida);
     	  model.addAttribute("Jogos", Jogos);
        }
		return new ModelAndView("listarJogos");
	}

}
