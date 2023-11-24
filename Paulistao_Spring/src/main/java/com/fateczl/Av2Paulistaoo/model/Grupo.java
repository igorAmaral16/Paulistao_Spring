package com.fateczl.Av2Paulistaoo.model;

public class Grupo {
	private String grupo;
	private String nomeTime;
	
	public String getGrupo() {
		return grupo;
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	public String getNomeTime() {
		return nomeTime;
	}
	public void setNomeTime(String nomeTime) {
		this.nomeTime = nomeTime;
	}
	@Override
	public String toString() {
		return "Grupo [grupo=" + grupo + ", nomeTime=" + nomeTime + "]";
	}

	
}
