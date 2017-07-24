package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sangjin.model.dao.MovieDAO;
import com.comnawa.mvcinema.sangjin.model.dto.MovieDTO;

@Service
public class MovieServiceImpl implements MovieService {
	@Inject
	MovieDAO movieDao;

	@Override
	public List<MovieDTO> movieList(String order_type) {
		return movieDao.movieList(order_type);
	}

}
