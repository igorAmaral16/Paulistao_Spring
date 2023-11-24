package com.fateczl.Av2Paulistaoo.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fateczl.Av2Paulistaoo.model.Jogo;

public interface IJogosDao {
	public List<Jogo> listarJogos() throws SQLException, ClassNotFoundException;
	public List<Jogo> buscarJogos(String data) throws SQLException, ClassNotFoundException;
	public List<Jogo> buscarJogosParaInserir(String data) throws SQLException, ClassNotFoundException;
	public void inserirResultado(int cj, int gta, int gtb) throws ClassNotFoundException, SQLException;

}
