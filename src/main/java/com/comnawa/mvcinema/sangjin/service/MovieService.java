package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;


public interface MovieService {
	List<MovieDTO> movieList(String order_type);
	List<MovieDTO> ScdmovieList();
	List<MovieDTO> Sort_grade();
	public MovieDTO movie_view(int idx);
}
