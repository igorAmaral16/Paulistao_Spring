package com.fateczl.Av2Paulistaoo.model;

public class GrupoMostrar {
	
	private String nomeTime;
	private int jogosDisputados;
	private int vitorias;
	private int empates;
	private int derrotas;
	private int golsMarcados;
	private int golsSofridos;
	private int saldoGols;
	private int pontos;
	
	public String getNomeTime() {
		return nomeTime;
	}
	public void setNomeTime(String nomeTime) {
		this.nomeTime = nomeTime;
	}
	public int getJogosDisputados() {
		return jogosDisputados;
	}
	public void setJogosDisputados(int jogosDisputados) {
		this.jogosDisputados = jogosDisputados;
	}
	public int getVitorias() {
		return vitorias;
	}
	public void setVitorias(int vitorias) {
		this.vitorias = vitorias;
	}
	public int getEmpates() {
		return empates;
	}
	public void setEmpates(int empates) {
		this.empates = empates;
	}
	public int getDerrotas() {
		return derrotas;
	}
	public void setDerrotas(int derrotas) {
		this.derrotas = derrotas;
	}
	public int getGolsMarcados() {
		return golsMarcados;
	}
	public void setGolsMarcados(int golsMarcados) {
		this.golsMarcados = golsMarcados;
	}
	public int getGolsSofridos() {
		return golsSofridos;
	}
	public void setGolsSofridos(int golsSofridos) {
		this.golsSofridos = golsSofridos;
	}
	public int getSaldoGols() {
		return saldoGols;
	}
	public void setSaldoGols(int saldoGols) {
		this.saldoGols = saldoGols;
	}
	public int getPontos() {
		return pontos;
	}
	public void setPontos(int pontos) {
		this.pontos = pontos;
	}
	@Override
	public String toString() {
		return "GrupoMostrar [nomeTime=" + nomeTime + ", jogosDisputados=" + jogosDisputados + ", vitorias=" + vitorias
				+ ", empates=" + empates + ", derrotas=" + derrotas + ", golsMarcados=" + golsMarcados
				+ ", golsSofridos=" + golsSofridos + ", saldoGols=" + saldoGols + ", pontos=" + pontos + "]";
	}
}
