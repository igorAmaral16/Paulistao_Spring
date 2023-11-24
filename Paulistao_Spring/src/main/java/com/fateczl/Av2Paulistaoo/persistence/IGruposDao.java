package com.fateczl.Av2Paulistaoo.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fateczl.Av2Paulistaoo.model.Grupo;
import com.fateczl.Av2Paulistaoo.model.GrupoMostrar;

public interface IGruposDao {
	List<Grupo> gerarGrupo() throws SQLException, ClassNotFoundException;
	public List<Grupo> listarGrupoA() throws SQLException, ClassNotFoundException;
	public List<Grupo> listarGrupoB() throws SQLException, ClassNotFoundException;
	public List<Grupo> listarGrupoC() throws SQLException, ClassNotFoundException;
	public List<Grupo> listarGrupoD() throws SQLException, ClassNotFoundException;
	public List<GrupoMostrar> listarGrupos(String grupo) throws SQLException, ClassNotFoundException;
	public List<GrupoMostrar> listarClassificacao(String grupo) throws SQLException, ClassNotFoundException;

}
