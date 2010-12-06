<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>http://wbotelhos.com.br</title>
	</head>
	<body>
		${filme.titulo} <a href="<c:url value='/filme/editar/${filme.id}'/>">Editar</a>
		<ul>
			<c:forEach items="${filme.artistaList}" var="artista">
				<li>${artista.nome}</li>
			</c:forEach>
		</ul>
	</body>
</html>