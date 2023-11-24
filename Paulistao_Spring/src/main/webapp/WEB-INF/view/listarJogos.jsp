<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Lista de Jogos</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
	</head>
<body>
	<ul>
		<li><a href="index">VOLTAR</a></li>
	</ul>
     <div align="center">
          <form action="listarJogos" method="post">
               <table>
                 <tr>
                 <td><input type="submit" id="enviar" name="enviar" value="LISTAR"><td>
                 
                 </tr>
               </table>
          </form>
     </div>
 <br />
     <div align="center">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty Jogos }">
			<table border="1">
				<thead>
					<tr>
						<th>Time A</th>
						<th>Time B</th>					
						<th>Data</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Jogos }" var="lj">
					<tr>
						<td><c:out value="${lj.nomeTimeA }"></c:out></td>
						
						<td><c:out value="${lj.nomeTimeB }"></c:out></td>
						
						<td><c:out value="${lj.data }"></c:out></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>
</body>
</html>