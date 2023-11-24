<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Tabela de Jogos</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
	</head>
<body>
	<ul>
		<li><a href="index">VOLTAR</a></li>
	</ul>
     <div>
         	 <form action="buscarGols" method="post">
               	<table>
                 <tr>
                	 <td><input type="date" id="data" name="data"><td>
            		 <td><input type="submit" id="botao" name="botao" value="Buscar"><td>
            	 </tr>
           		</table>
      		</form>
 	</div>
 	<div>
         	 <form action="inserirGols" method="post">
               	<table>
                 <tr>
                	<td><input type="number" id="codigoJogo" name="codigoJogo" required> Código do jogo<td>
            	 	<td><input type="number" id="golsTimeA" name="golsTimeA" required> Gols do Time A<td>
            	 	<td><input type="number" id="golsTimeB" name="golsTimeB" required> Gols do Time B<td>
            	 	<td><input type="submit" name="botao" id="botao" value="Inserir"><td>

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
	<c:when test="${not empty insereJogos }">
		<table>
			<thead>
				<tr>
					<th>Código Jogo</th>
					<th>Time A</th>
					<th>Gols Time A</th>
					<th>Time B</th>
					<th>Gols Time B</th>
					<th>Data do jogo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${insereJogos }" var="ij">
					<tr>
						<td><c:out value="${ij.idJogo }"></c:out></td>
						<td><c:out value="${ij.nomeTimeA }"></c:out></td>
						<td><c:out value="${ij.golsTimeA }"></c:out></td>
						<td><c:out value="${ij.nomeTimeB }"></c:out></td>						
						<td><c:out value="${ij.golsTimeB }"></c:out></td>
						<td><c:out value="${ij.data }"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
		<c:otherwise>
			<div>
	              <p> Não tem jogos registrados</p>
			</div>
		</c:otherwise>		
		 </c:choose>		
	</div>
</body>
</html>