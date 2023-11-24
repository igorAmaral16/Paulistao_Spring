package com.fateczl.Av2Paulistaoo.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fateczl.Av2Paulistaoo.model.Jogo;

@Repository
public class JogosDao implements IJogosDao{
	
	@Autowired
	private GenericDao gDao;

	@Override
	public List<Jogo> listarJogos() throws SQLException, ClassNotFoundException {
		List<Jogo> jogos = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL sp_GerarJogos}";
		
		CallableStatement cs = con.prepareCall(procedure);
		cs.execute();
		
		String sql = "SELECT timeA, gols_timeA, timeB, gols_timeB, data_jogo FROM jogosGerados";
		PreparedStatement ps = con.prepareStatement(sql);	
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Jogo jogo = new Jogo();
			jogo.setNomeTimeA(rs.getString("timeA"));
			jogo.setGolsTimeA(rs.getInt("gols_timeA"));
			jogo.setNomeTimeB(rs.getString("timeB"));
			jogo.setGolsTimeB(rs.getInt("gols_timeB"));
			jogo.setData(LocalDate.parse(rs.getString("data_jogo"))); 
			
			jogos.add(jogo);
		}
		rs.close();
		ps.close();	
		cs.close();
		con.close();
		
		return jogos;
	}

	@Override
	public List<Jogo> buscarJogos(String data) throws SQLException, ClassNotFoundException {
		List<Jogo> jogos = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		String sql = "SELECT codigo_jogo, timeA, gols_timeA, timeB, gols_timeB, data_jogo FROM jogosGerados WHERE data_jogo = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setString(1, data);

		
		ResultSet rs = ps.executeQuery();		
		while(rs.next()) {
			Jogo jogo = new Jogo();
			jogo.setIdJogo(rs.getInt("codigo_jogo"));
			jogo.setNomeTimeA(rs.getString("timeA"));
			jogo.setGolsTimeA(rs.getInt("gols_timeA"));			
			jogo.setNomeTimeB(rs.getString("timeB"));
			jogo.setGolsTimeB(rs.getInt("gols_timeB"));
			jogo.setData(LocalDate.parse(rs.getString("data_jogo"))); 
			
			jogos.add(jogo);
		}
		rs.close();
		ps.close();		
		con.close();
		
		return jogos;
	}

	@Override
	public void inserirResultado(int cj, int gta, int gtb) throws ClassNotFoundException, SQLException {
		
		Connection con = gDao.getConnection();
		
		String procedure = "{CALL p_atualizaJogo (?, ?, ?)}";
		
			CallableStatement cs = con.prepareCall(procedure);
			
			cs.setInt(1, cj);
	        cs.setInt(2, gta);
	        cs.setInt(3, gtb);  
	        cs.executeUpdate();
	        
	        cs.close();
	        con.close();
	}

	@Override
	public List<Jogo> buscarJogosParaInserir(String data) throws SQLException, ClassNotFoundException {
		List<Jogo> jogos = new ArrayList<>();
		
		Connection con = gDao.getConnection();
		String sql = "SELECT codigo_jogo, timeA, gols_timeA, timeB, gols_timeB, data_jogo FROM jogosGerados WHERE data_jogo = ?";
	
		PreparedStatement ps = con.prepareStatement(sql);	
		ps.setString(1, data);

		
		ResultSet rs = ps.executeQuery();		
		while(rs.next()) {
			Jogo jogo = new Jogo();
			
			jogo.setIdJogo(rs.getInt("codigo_jogo"));
			jogo.setNomeTimeA(rs.getString("timeA"));
			jogo.setGolsTimeA(rs.getInt("gols_timeA"));			
			jogo.setNomeTimeB(rs.getString("timeB"));
			jogo.setGolsTimeB(rs.getInt("gols_timeB"));
			jogo.setData(LocalDate.parse(rs.getString("data_jogo"))); 
			
			jogos.add(jogo);
		}
		rs.close();
		ps.close();		
		con.close();
		
		return jogos;
	}

}
