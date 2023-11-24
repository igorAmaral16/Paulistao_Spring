<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Times Participantes</title>
		<link rel="stylesheet" type="text/css" href='<c:url value="./resources/css/style.css"/>'>
	</head>
<body>
	<ul>
		<li><a href="index">VOLTAR</a></li>
	</ul>
	<h1>Times Participantes</h1>
	<div align="center">
		<form action="listarTimes" method="post">
			<table> 
				<tr>
					<td><input type="submit" id="botao" name="enviar" value="LISTAR"></td>
				</tr>
			</table>
		</form>
		</div>
 
  <main>
    <section>
      <br />
      <c:if test="${not empty erro }">
        <div class="mensagem-erro">
          <h2><c:out value="${erro }" /></h2>
        </div>
      </c:if>
      <c:if test="${not empty saida }">
        <div class="mensagem-sucesso">
          <h2><c:out value="${saida }" /></h2>
        </div>
      </c:if>
      <c:if test="${not empty Times }">
        <table>
          <thead>
            <tr>
              <th>Código</th>
              <th>Time</th>
              <th>Cidade</th>
              <th>Estádio</th>
              <th>Material Esportivo</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${Times }" var="t">
              <tr>
                <td><c:out value="${t.codigoTime }"></c:out></td>
                <td><c:out value="${t.nomeTime }"></c:out></td>
                <td><c:out value="${t.cidade }"></c:out></td>
                <td><c:out value="${t.estadio }"></c:out></td>
                <td><c:out value="${t.matEsportivo }"></c:out></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
    </section>
  </main>