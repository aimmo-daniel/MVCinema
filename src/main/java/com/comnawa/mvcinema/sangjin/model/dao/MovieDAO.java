package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;

public interface MovieDAO {
	List<MovieDTO> movieList(String order_type);
	List<MovieDTO> searchMovie(String keyword);
	List<MovieDTO> ScdmovieList();
	public MovieDTO movie_view(int idx);
}
