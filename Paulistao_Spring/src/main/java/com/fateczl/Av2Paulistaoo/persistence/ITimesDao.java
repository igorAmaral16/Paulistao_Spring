package com.fateczl.Av2Paulistaoo.persistence;

import java.sql.SQLException;
import java.util.List;

import com.fateczl.Av2Paulistaoo.model.Time;

public interface ITimesDao {
	public List<Time> listarTimes() throws SQLException, ClassNotFoundException;

}
