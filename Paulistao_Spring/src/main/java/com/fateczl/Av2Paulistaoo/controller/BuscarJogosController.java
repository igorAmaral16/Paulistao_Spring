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
public class BuscarJogosController {
	
	@Autowired
	JogosDao jDao;
	
	@RequestMapping(name = "buscarJogos", value = "/buscarJogos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
			return new ModelAndView("buscarJogos");
		}
	
	@RequestMapping(name="buscarJogos", value = "/buscarJogos", method = RequestMethod.POST)
	public ModelAndView buscarJogos(ModelMap model, @RequestParam Map<String,String> allParam ) {
		
		String dataRe = allParam.get("data");
		
		List<Jogo> listaJogos = new ArrayList<>();
		String erro = "";
		String saida = "";
		
		try {
			if(dataRe != null && !dataRe.isEmpty()) {
			    listaJogos = jDao.buscarJogos(dataRe);
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = "Erro inesperado, por favor, tente novamente." + e.getMessage();
		}finally {
			
        model.addAttribute("saida", saida);
        model.addAttribute("erro", erro);     
        model.addAttribute("listaJogos", listaJogos);
        
        }
		
		return new ModelAndView("buscarJogos");
	}

}
