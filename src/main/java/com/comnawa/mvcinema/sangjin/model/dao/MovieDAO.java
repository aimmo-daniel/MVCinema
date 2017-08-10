package com.comnawa.mvcinema.sangjin.model.dao;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;

public interface MovieDAO {
	List<MovieDTO> movieList(String order_type);
	List<MovieDTO> ScdmovieList();
	List<MovieDTO> Sort_grade();
	public MovieDTO movie_view(int idx);
}
