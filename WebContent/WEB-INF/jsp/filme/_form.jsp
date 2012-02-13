<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<a href="${pageContext.request.contextPath}/filme">Listagem</a><br/><br/>

<form action="${pageContext.request.contextPath}/filme" method="post">
	<c:if test="${filme != null && filme.id != null}">
		<input type="hidden" name="filme.id" value="${filme.id}" />
	</c:if>

	<fieldset style="width: 300px;">
		<legend>Filme</legend>
		<label>T&iacute;tulo:</label>
		<input type="text" name="filme.titulo" value="${filme.titulo}" />
	</fieldset>

	<fieldset id="artista-container" style="width: 300px;">
		<legend>
			Artistas
			<img src="${pageContext.request.contextPath}/img/adicionar.png" alt="+" onclick="adicionar();" />
		</legend>

		<c:forEach items="${filme.artistas}" var="artista" varStatus="status">
			<div class="artista">
				<label>Nome:</label>
				<input type="text" name="filme.artistas[${status.index}].nome" value="${artista.nome}" />
				<input type="hidden" name="filme.artistas[${status.index}].id" value="${artista.id}" />

				<img src="${pageContext.request.contextPath}/img/remover.png" alt="-" class="button-remover" />
			</div>
		</c:forEach>
	</fieldset><br/>

	<input type="submit" value="Salvar" />
</form>

<script type="text/javascript">
	var model =
		'<div class="artista">' +
			'<label>Nome:</label>' +
			'<input type="text" name="filme.artistas[0].nome" />' +

			'<img src="${pageContext.request.contextPath}/img/remover.png" alt="-" class="button-remover" />' +
		'</div>';

	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});

	function adicionar() {
		$('#artista-container').append(model);

		reorderIndexes();
	};

	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;

		$('.artista').each(function(index) {
			var $campos = $(this).find('input'),
				$input	,
				name	;

			$campos.each(function() {
				$input	= $(this),
				name	= $input.attr('name');

				$input.attr('name', name.replace(regex, '[' + index + ']'));
			});
		});
	};
</script>
