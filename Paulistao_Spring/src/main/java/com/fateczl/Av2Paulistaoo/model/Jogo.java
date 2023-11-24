package com.fateczl.Av2Paulistaoo.model;

import java.time.LocalDate;

public class Jogo {
	
	private int idJogo;
	private String nomeTimeA;
	private String nomeTimeB;
	private int golsTimeA;
	private int golsTimeB;
	private LocalDate data;
	
	public Jogo(int idJogo, String nomeTimeA, String nomeTimeB, int golsTimeA, int golsTimeB, LocalDate data) {
		super();
		this.idJogo = idJogo;
		this.nomeTimeA = nomeTimeA;
		this.nomeTimeB = nomeTimeB;
		this.golsTimeA = golsTimeA;
		this.golsTimeB = golsTimeB;
		this.data = data;
	}
	public Jogo() {
		
	}
	
	public int getIdJogo() {
		return idJogo;
	}
	public void setIdJogo(int idJogo) {
		this.idJogo = idJogo;
	}
	public String getNomeTimeA() {
		return nomeTimeA;
	}
	public void setNomeTimeA(String nomeTimeA) {
		this.nomeTimeA = nomeTimeA;
	}
	public String getNomeTimeB() {
		return nomeTimeB;
	}
	public void setNomeTimeB(String nomeTimeB) {
		this.nomeTimeB = nomeTimeB;
	}
	public int getGolsTimeA() {
		return golsTimeA;
	}
	public void setGolsTimeA(int golsTimeA) {
		this.golsTimeA = golsTimeA;
	}
	public int getGolsTimeB() {
		return golsTimeB;
	}
	public void setGolsTimeB(int golsTimeB) {
		this.golsTimeB = golsTimeB;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "Jogo [nomeTimeA=" + nomeTimeA + ", nomeTimeB=" + nomeTimeB + ", golsTimeA=" + golsTimeA + ", golsTimeB="
				+ golsTimeB + ", data=" + data + "]";
	}
}
