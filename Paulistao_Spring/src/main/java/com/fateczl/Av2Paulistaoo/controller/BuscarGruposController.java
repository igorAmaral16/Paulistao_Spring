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

import com.fateczl.Av2Paulistaoo.model.GrupoMostrar;
import com.fateczl.Av2Paulistaoo.persistence.GruposDao;

@Controller
public class BuscarGruposController {
	
	@Autowired
	GruposDao gDao;
	
	@RequestMapping(name = "buscarGrupos", value = "/buscarGrupos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
			return new ModelAndView("buscarGrupos");
		}
	
	@RequestMapping(name="buscarGrupos", value = "/buscarGrupos", method = RequestMethod.POST)
	public ModelAndView buscarGrupos(ModelMap model, @RequestParam Map<String,String> allParam ) {
		
		String grupo = allParam.get("grupo");
		
		List<GrupoMostrar> listaGrupos = new ArrayList<>();
		String erro = "";
		String saida = "";
		
		try {
			if(grupo != null && !grupo.isEmpty()) {
				listaGrupos = gDao.listarGrupos(grupo);
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = "Erro inesperado, por favor, tente novamente." + e.getMessage();
		}finally {
			
        model.addAttribute("saida", saida);
        model.addAttribute("erro", erro);     
        model.addAttribute("listaGrupos", listaGrupos);
        
        }
		
		return new ModelAndView("buscarGrupos");
	}

}
