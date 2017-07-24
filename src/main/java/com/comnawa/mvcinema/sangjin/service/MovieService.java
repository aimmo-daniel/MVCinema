package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;


public interface MovieService {
	List<MovieDTO> movieList(String order_type);
}
