package com.fateczl.Av2Paulistaoo.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

@Repository
public class GenericDao {

	private Connection con;

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		String hostName = "localhost";
		String dbName = "trabalho1";
		String user = "sa";
		String senha = "123456";
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		con = DriverManager.getConnection(String.format(
				"jdbc:jtds:sqlserver://%s:1433;databaseName=%s;user=%s;password=%s;", hostName, dbName, user, senha));

		return con;
	}
	
}
