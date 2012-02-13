package br.com.wbotelhos.model;

import java.io.Serializable;
import java.util.Collection;

/**
 * @author Washington Botelho dos Santos
 * @artigo http://www.wbotelhos.com.br/2010/12/06/manipulando-listas-com-jquery-e-vraptor-3
 */

public class Filme implements Serializable {

	private static final long serialVersionUID = -5984643569810298849L;

	private Long id;
	private String titulo;
	private Collection<Artista> artistas;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Collection<Artista> getArtistas() {
		return artistas;
	}

	public void setArtistas(Collection<Artista> artistas) {
		this.artistas = artistas;
	}

}
