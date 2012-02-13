package br.com.wbotelhos.controller;

import java.util.Collection;

import br.com.caelum.vraptor.Get;
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

	@Get("/")
	public void index() {
		result.redirectTo(this).listagem();
	}

	@Get("/filme/criar")
	public void criar() {

	}

	@Post("/filme")
	public void salvar(Filme filme) {
		filmeDao.save(filme);
		result.redirectTo(this).listagem();
	}

	@Get("/filme/{filme.id}")
	public Filme exibir(Filme filme) {
		return filmeDao.loadById(filme.getId());
	}

	@Get("/filme/{filme.id}/editar")
	public Filme editar(Filme filme) {
		return filmeDao.loadById(filme.getId());
	}

	@Get("/filme")
	public Collection<Filme> listagem() {
		return filmeDao.loadAll();
	}

}
