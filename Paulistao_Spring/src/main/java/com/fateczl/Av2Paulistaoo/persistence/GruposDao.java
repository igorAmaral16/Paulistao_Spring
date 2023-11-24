package com.fateczl.Av2Paulistaoo.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.Av2Paulistaoo.model.Grupo;
import com.fateczl.Av2Paulistaoo.model.GrupoMostrar;

@Repository
public class GruposDao implements IGruposDao{
	
	@Autowired
	GenericDao gDao;

	@Override
	public List<Grupo> gerarGrupo() throws SQLException, ClassNotFoundException {
		List<Grupo> grupos = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL sp_gerar_grupo}";
		String sql = " SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time";
		
		try {
		CallableStatement cs = con.prepareCall(procedure);
		cs.execute();
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			Grupo grupo = new Grupo();
			grupo.setNomeTime(rs.getString("nome_time"));
			grupo.setGrupo(rs.getString("grupo"));
			grupos.add(grupo);
		}
		rs.close();
		ps.close();
		cs.close();
		
		} catch(Exception e) {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Grupo grupo = new Grupo();
				grupo.setNomeTime(rs.getString("nome_time"));
				grupo.setGrupo(rs.getString("grupo"));
				grupos.add(grupo);
			}
			rs.close();
			ps.close();
			
		}
		con.close();
		
		return grupos;
	}

	@Override
	public List<Grupo> listarGrupoA() throws SQLException, ClassNotFoundException {
		List<Grupo> gpA = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'A'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoA = new Grupo();
			grupoA.setNomeTime(rs.getString("nome_time"));
			grupoA.setGrupo(rs.getString("grupo"));
			gpA.add(grupoA);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpA;
	}

	@Override
	public List<Grupo> listarGrupoB() throws SQLException, ClassNotFoundException {
		List<Grupo> gpB = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'B'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoB = new Grupo();
			grupoB.setNomeTime(rs.getString("nome_time"));
			grupoB.setGrupo(rs.getString("grupo"));
			gpB.add(grupoB);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpB;
	}

	@Override
	public List<Grupo> listarGrupoC() throws SQLException, ClassNotFoundException {
		List<Grupo> gpC = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'C'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoC = new Grupo();
			grupoC.setNomeTime(rs.getString("nome_time"));
			grupoC.setGrupo(rs.getString("grupo"));
			gpC.add(grupoC);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpC;
	}

	@Override
	public List<Grupo> listarGrupoD() throws SQLException, ClassNotFoundException {
		List<Grupo> gpD = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT t.nome_time, g.grupo FROM grupos g, times t WHERE t.codigo_time = g.codigo_time AND Grupo = 'D'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Grupo grupoD = new Grupo();
			grupoD.setNomeTime(rs.getString("nome_time"));
			grupoD.setGrupo(rs.getString("grupo"));
			gpD.add(grupoD);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gpD;
	}

	@Override
	public List<GrupoMostrar> listarGrupos(String grupo) throws SQLException, ClassNotFoundException {
		List<GrupoMostrar> gp = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT nome_time, num_jogos_disputados, vitorias, empates, derrotas, gols_marcados, gols_sofridos, saldo_gols, pontos FROM dbo.fn_estGrupo(?)";
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setString(1, grupo);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			GrupoMostrar grupoMostrar = new GrupoMostrar();
			
			grupoMostrar.setNomeTime(rs.getString("nome_time"));
			grupoMostrar.setJogosDisputados(rs.getInt("num_jogos_disputados"));
			grupoMostrar.setVitorias(rs.getInt("vitorias"));
			grupoMostrar.setEmpates(rs.getInt("empates"));
			grupoMostrar.setDerrotas(rs.getInt("derrotas"));
			grupoMostrar.setGolsMarcados(rs.getInt("gols_marcados"));
			grupoMostrar.setGolsSofridos(rs.getInt("gols_sofridos"));
			grupoMostrar.setSaldoGols(rs.getInt("saldo_gols"));
			grupoMostrar.setPontos(rs.getInt("pontos"));
			
			gp.add(grupoMostrar);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gp;
	}
	
	@Override
	public List<GrupoMostrar> listarClassificacao(String grupo) throws SQLException, ClassNotFoundException {
		List<GrupoMostrar> gp = new ArrayList<>();
		Connection con = gDao.getConnection();
		
		String sql = "SELECT nome_time, num_jogos_disputados, vitorias, empates, derrotas, gols_marcados, gols_sofridos, saldo_gols, pontos FROM dbo.fn_classificacaoGeral(?)";
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setString(1, grupo);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			GrupoMostrar grupoMostrar = new GrupoMostrar();
			
			grupoMostrar.setNomeTime(rs.getString("nome_time"));
			grupoMostrar.setJogosDisputados(rs.getInt("num_jogos_disputados"));
			grupoMostrar.setVitorias(rs.getInt("vitorias"));
			grupoMostrar.setEmpates(rs.getInt("empates"));
			grupoMostrar.setDerrotas(rs.getInt("derrotas"));
			grupoMostrar.setGolsMarcados(rs.getInt("gols_marcados"));
			grupoMostrar.setGolsSofridos(rs.getInt("gols_sofridos"));
			grupoMostrar.setSaldoGols(rs.getInt("saldo_gols"));
			grupoMostrar.setPontos(rs.getInt("pontos"));
			
			gp.add(grupoMostrar);
		}
		rs.close();
		ps.close();
		con.close();
		
		return gp;
	}
}
