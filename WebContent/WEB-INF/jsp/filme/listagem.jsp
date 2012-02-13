<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Filme | Listagem</title>
	</head>
	<body>
		<a href="${pageContext.request.contextPath}/filme/criar">Novo</a><br/><br/>

		<c:forEach items="${filmeList}" var="filme">
			${filme.titulo} <a href="${pageContext.request.contextPath}/filme/${filme.id}">Exibir</a> | <a href="${pageContext.request.contextPath}/filme/${filme.id}/editar">Editar</a><br/>  
		</c:forEach>
	</body>
</html>
