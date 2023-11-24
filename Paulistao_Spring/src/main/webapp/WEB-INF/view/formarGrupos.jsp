<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gerar grupos</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
	</head>
<body>
	<ul>
		<li><a href="index">VOLTAR</a></li>
	</ul>

	<div align="center">
		<form action="formarGrupos" method="post">
			<table>
				<tr>
					<td><input type="submit" id="botao" name="enviar" value="GERAR"></td>           
				</tr>
			</table>
		</form>
	</div>

	<br />

	<div align="center">
		<c:if test="${not empty erro}">
			<H2><c:out value="${erro}" /></H2>
		</c:if>
		<c:if test="${not empty saida}">
			<H2><c:out value="${saida}" /></H2>
		</c:if>
	</div>

	<div align="center">
		<c:if test="${not empty grupos }">
			<table>
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupos }" var="g">
						<tr>
							<c:choose>
						    <c:when test="${g.grupo == 'A'}">
						        <td class = "grupo-a"><c:out value="${g.nomeTime }"></c:out></td>
								<td class = "grupo-a"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:when test="${g.grupo == 'B'}">
						    	<td class = "grupo-b"><c:out value="${g.nomeTime }"></c:out></td>
								<td class = "grupo-b"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:when test="${g.grupo == 'C'}">
						    	<td class = "grupo-c"><c:out value="${g.nomeTime }"></c:out></td>
								<td class = "grupo-c"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:when test="${g.grupo == 'D'}">
						    	<td class = "grupo-d"><c:out value="${g.nomeTime }"></c:out></td>
								<td class = "grupo-d"><c:out value="${g.grupo }"></c:out></td>
						    </c:when>
						    <c:otherwise>
						        <p>Pelo menos um elemento não tem o valor correto.</p>
						    </c:otherwise>
						</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>
</body>
</html>
