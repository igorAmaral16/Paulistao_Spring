package com.fateczl.Av2Paulistaoo.model;

public class Time {
	private int codigoTime;
	private String nomeTime;
	private String cidade;
	private String estadio;
	private String matEsportivo;
	
	public int getCodigoTime() {
		return codigoTime;
	}
	public void setCodigoTime(int codigoTime) {
		this.codigoTime = codigoTime;
	}
	public String getNomeTime() {
		return nomeTime;
	}
	public void setNomeTime(String nomeTime) {
		this.nomeTime = nomeTime;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstadio() {
		return estadio;
	}
	public void setEstadio(String estadio) {
		this.estadio = estadio;
	}
	public String getMatEsportivo() {
		return matEsportivo;
	}
	public void setMatEsportivo(String matEsportivo) {
		this.matEsportivo = matEsportivo;
	}
	
	@Override
	public String toString() {
		return "Time [codigoTime=" + codigoTime + ", nomeTime=" + nomeTime + ", cidade=" + cidade + ", estadio="
				+ estadio + ", matEsportivo=" + matEsportivo + "]";
	}
	
}
