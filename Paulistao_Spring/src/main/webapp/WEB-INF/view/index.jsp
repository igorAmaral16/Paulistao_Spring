<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Menu</title>
    <link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
  </head>
  <body>
  
  	<div id="menu">
		<ul>
	       <li> <a href="formarGrupos">Formar Grupos</a></li>
	       <li> <a href="listarTimes">Listar Times em Ordem Alfabética</a></li>
	       <li> <a href="listarJogos">Gerar Jogos</a></li>
	       <li> <a href="mostrarGrupos">Mostrar Grupos</a></li>
	       <li> <a href="buscarJogos">Pesquisar Jogo por Data</a></li>
	   	</ul>	
	 </div>
	 <br />
	 <br />
	 <br />
	 <br />
	 <br />
	 <div id="titulo" align = "center">
	 	<h1> PAULISTÃO 2023</h1>
	 </div>
	 <br />
	 <br />
	 <br />
	 <div id="menuS">
	 	<ul>
	 		<table>
		 		<td>
			 		<h3><a href="inserirGols"> Inserir Gols </a></h3>
			 		<h3><a href="buscarGrupos"> Buscar Grupos </a></h3>
			 		<h3><a href="classificacaoGeral"> Classificação Geral </a></h3>
		 		</td>
	 		</table>
	 	</ul>
	 </div>
  </body>
</html>
