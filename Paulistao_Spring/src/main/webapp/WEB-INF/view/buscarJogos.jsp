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
          <form action="buscarJogos" method="post">
               <table>
                 <tr>
                 <td><input type="date" id="data" name="data"><td>
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
	<c:when test="${not empty listaJogos }">
		<table>
			<thead>
				<tr>
					<th>Time A</th>
					
					<th>Time B</th>
					
					<th>Data do jogo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listaJogos }" var="lj">
					<tr>
						<td><c:out value="${lj.nomeTimeA }"></c:out></td>
						
						<td><c:out value="${lj.nomeTimeB }"></c:out></td>
						
						<td><c:out value="${lj.data }"></c:out></td>
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