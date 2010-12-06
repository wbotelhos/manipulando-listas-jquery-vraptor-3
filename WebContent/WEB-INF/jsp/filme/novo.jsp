<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>http://wbotelhos.com.br</title>

		<script type="text/javascript" src="<c:url value='/js/jquery.min.js'/>"></script>
	</head>
	<body>
		<form action="<c:url value='/filme'/>" method="post">
			<fieldset style="width: 300px;">
				<legend>Filme</legend>
				<label>T&iacute;tulo:</label>
				<input type="text" name="filme.titulo" value="${filme.titulo}"/>
			</fieldset>

			<fieldset id="artista-container" style="width: 300px;">
				<legend>
					Artistas
					<img src="<c:url value='/img/adicionar.png'/>" alt="+" onclick="adicionarArtista();"/>
				</legend>

				<c:forEach items="${filme.artistaList}" var="item" varStatus="status">
					<div data-index="${status.index}" class="artista-item">
						<label>Nome:</label>
						<input type="text" name="filme.artistaList[${status.index}].nome" value="${item.nome}"/>
						<img src="<c:url value='/img/remover.png'/>" alt="-" class="btn-remover-ator"/>
					</div>
				</c:forEach>
			</fieldset><br/>

			<input type="submit" value="Salvar"/>
		</form>

		<script type="text/javascript">
			$('.btn-remover-ator').live('click', function() {
				$(this).parent().remove();
			});
	
			function adicionarArtista() {
				var $container	= $('#artista-container'),
					$artistas	= $container.children('.artista-item'),
					firstIndex	= $artistas.first().data('index'),
					lastIndex	= $artistas.last().data('index');

				if (firstIndex === undefined) {
					firstIndex = 0;
					lastIndex = 0;
				}

				var index = parseInt(firstIndex) + parseInt(lastIndex) + 1;

				$('<div class="artista-item">' +
					'<label>Nome:</label>' +
					'<input type="text" name="filme.artistaList[' + index + '].nome" value="${item.nome}"/>' +
					'<img src=\'<c:url value="/img/remover.png"/>\' alt="-" class="btn-remover-ator"/>' +
				'</div>')
				.data('index', index)
				.appendTo($container);
			};
		</script>
	</body>
</html>