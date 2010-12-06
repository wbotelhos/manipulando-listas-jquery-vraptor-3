package br.com.wbotelhos.dao;

import java.io.Serializable;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.wbotelhos.model.Filme;

/**
 * @author Washington Botelho dos Santos
 * @artigo http://www.wbotelhos.com.br/2010/12/06/manipulando-listas-com-jquery-e-vraptor-3
 */

@Component
@SessionScoped
public class FilmeDao implements Serializable {

	private static final long serialVersionUID = -7968330624901437028L;

	private Filme filme = new Filme();
	private Integer id = 1;

	public Filme salvar(Filme filme) {
		filme.setId(id++);
		this.filme = filme;
		return this.filme;
	}

	public Filme loadById(Integer id) {
		return filme;
	}

}