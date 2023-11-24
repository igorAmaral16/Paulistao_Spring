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
public class MostrarGruposController {
	
	@Autowired
	GruposDao gDao;
	
	@RequestMapping(name = "mostrarGrupos", value = "/mostrarGrupos", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) {
		
			return new ModelAndView("mostrarGrupos");
		}
	
	@RequestMapping(name="mostrarGrupos", value = "/mostrarGrupos", method = RequestMethod.POST)
	public ModelAndView mostrarGrupos(ModelMap model, @RequestParam Map<String,String> allParam ) {
		
		String btnEnviar = allParam.get("enviar");
		
		List<Grupo> grupoA = new ArrayList<>();
		List<Grupo> grupoB = new ArrayList<>();
		List<Grupo> grupoC = new ArrayList<>();
		List<Grupo> grupoD = new ArrayList<>();
		
		String erro = "";
		String saida = "";
		
		try {
			if (btnEnviar.equalsIgnoreCase("mostrar")) {
				grupoA = gDao.listarGrupoA();
				grupoB = gDao.listarGrupoB();
				grupoC = gDao.listarGrupoC();
				grupoD = gDao.listarGrupoD();
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = "Erro inesperado, por favor, tente novamente." + e.getMessage();
		}finally {
			model.addAttribute("saida", saida);
			model.addAttribute("erro", erro);
			model.addAttribute("grupoA", grupoA);	       
			model.addAttribute("grupoB", grupoB);
			model.addAttribute("grupoC", grupoC);
			model.addAttribute("grupoD", grupoD);
		}
		
		return new ModelAndView("mostrarGrupos");
	}
}
