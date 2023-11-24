<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
		<title>Grupos</title>
	</head>
<body>

	<ul>
		<li><a href="index">VOLTAR</a></li>
	</ul>
          <div align="center">
          <form action="mostrarGrupos" method="post">
               <table>
                 <tr> 
                 <td><input type="submit" id="botao" name="enviar" value="Mostrar"><td>
                 </tr>
               </table>
          </form>
     </div>
 <br>
     <div align="center">
     
     <div>
		<c:choose>
			<c:when test="${not empty erro}">
				<H1><c:out value="${erro }" /></H1>
			</c:when>
			<c:when test="${not empty saida}">
				<H1><c:out value="${saida }" /></H1>
			</c:when>
		</c:choose>
	</div>
	
	<div>
	<c:if test="${not empty grupoA}">
		<table class = "grupo-a" border="1">
			<thead>
				<tr>
					<th>Nome do Time</th>
					<th>Grupo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${grupoA}" var="ga">
					<tr align="center">
						<td><c:out value="${ga.nomeTime}"></c:out></td>
						<td><c:out value="${ga.grupo}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>	
</div>

<div>
	<c:choose>
		<c:when test="${not empty grupoB}">
			<table class = "grupo-b" border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupoB}" var="gb">
						<tr align="center">
							<td><c:out value="${gb.nomeTime}"></c:out></td>
							<td><c:out value="${gb.grupo}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
	</c:choose>
</div>
<div>
	<c:choose>
		<c:when test="${not empty grupoC}">
			<table class = "grupo-c" border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupoC}" var="gc">
						<tr align="center">
							<td><c:out value="${gc.nomeTime}"></c:out></td>
							<td><c:out value="${gc.grupo}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</div>

<div>
	<c:choose>
		<c:when test="${not empty grupoD}">
			<table  border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupoD}" var="gd">
						<tr class = "grupo-d" align="center">
							<td><c:out value="${gd.nomeTime}"></c:out></td>
							<td><c:out value="${gd.grupo}"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
	</c:choose>
	</div>
	</div>
</body>
</html>