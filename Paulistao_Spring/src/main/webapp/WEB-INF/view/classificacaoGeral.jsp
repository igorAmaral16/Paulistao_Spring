<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Tabela de times</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
	</head>
<body>
	<ul>
		<li><a href="index">VOLTAR</a></li>
	</ul>
     <div>
         	 <form action="buscarTimes" method="post">
               	<table>
                 <tr>
                 	<th>Grupo</th>
                	 <td><input type="text" id="grupo" name="grupo" required><td>
            		 <td><input type="submit" id="botao" name="botao" value="Buscar"><td>
            	 </tr>
           		</table>
      		</form>
 	</div>
   
 <br />
 
     <div>
		<c:if test="${not empty erro }">
			<h1><c:out value="${erro }" /></h1>
		</c:if>
		<c:if test="${not empty saida }">
			<h1><c:out value="${saida }" /></h1>
		</c:if>
	</div>
	<div>
	   <c:choose>
	<c:when test="${not empty listaGrupos }">
		<table>
			<thead>
				<tr>
					<th> Nome Time </th>
					<th> Jogos Disputados </th>
					<th> Vitórias </th>
					<th> Empates </th>
					<th> Derrotas </th>
					<th> Gols Marcados </th>
					<th> Gols Sofridos </th>
					<th> Saldo Gols </th>
					<th> Pontos </th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaGrupos }" var="ij">
					<tr>
						<td><c:out value="${ij.nomeTime }"></c:out></td>
						<td><c:out value="${ij.jogosDisputados }"></c:out></td>
						<td><c:out value="${ij.vitorias }"></c:out></td>
						<td><c:out value="${ij.empates }"></c:out></td>						
						<td><c:out value="${ij.derrotas }"></c:out></td>
						<td><c:out value="${ij.golsMarcados }"></c:out></td>
						<td><c:out value="${ij.golsSofridos }"></c:out></td>
						<td><c:out value="${ij.saldoGols }"></c:out></td>
						<td><c:out value="${ij.pontos }"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
		<c:otherwise>
			<div>
	              <h1>Não tem times registrados</h1>
			</div>
		</c:otherwise>		
		 </c:choose>		
	</div>
</body>
</html>