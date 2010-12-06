package br.com.wbotelhos.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.wbotelhos.dao.FilmeDao;
import br.com.wbotelhos.model.Filme;

/**
 * @author Washington Botelho dos Santos
 * @artigo http://www.wbotelhos.com.br/2010/12/06/manipulando-listas-com-jquery-e-vraptor-3
 */

@Resource
public class FilmeController {

	private Result result;
	private FilmeDao filmeDao;

	public FilmeController(Result result, FilmeDao filmeDao) {
		this.result = result;
		this.filmeDao = filmeDao;
	}

	@Path("/")
	public void index() {
		result.of(this).novo(null);
	}

	@Get
	@Path("/filme/novo")
	public Filme novo(Filme filme) {
		return filme;
	}

	@Post
	@Path("/filme")
	public void salvar(Filme filme) {
		filme = filmeDao.salvar(filme);
		result.redirectTo(this).exibir(filme);
	}

	@Get
	@Path("/filme/exibir/{filme.id}")
	public Filme exibir(Filme filme) {
		return filmeDao.loadById(filme.getId());
	}

	@Get
	@Path("/filme/editar/{filme.id}")
	public void editar(Filme filme) {
		result.redirectTo(this).novo(filmeDao.loadById(filme.getId()));
	}



}