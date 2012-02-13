<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<title>Filme | Exibi&ccedil;&atilde;o</title>
	</head>
	<body>
		<a href="${pageContext.request.contextPath}/filme">Listagem</a> | <a href="${pageContext.request.contextPath}/filme/criar">Novo</a><br/><br/>

		Título: ${filme.titulo}<br/>

		Artistas:<br/>

		<c:forEach items="${filme.artistas}" var="artista">
			- ${artista.nome}<br/>
		</c:forEach><br/>

		<a href="${pageContext.request.contextPath}/filme/${filme.id}/editar">Editar</a>
	</body>
</html>
