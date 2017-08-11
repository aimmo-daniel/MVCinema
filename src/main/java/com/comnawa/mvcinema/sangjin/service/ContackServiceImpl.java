package com.comnawa.mvcinema.sangjin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.comnawa.mvcinema.sangjin.model.dao.ContactDAO;
import com.comnawa.mvcinema.sangjin.model.dto.ContactDTO;
import com.comnawa.mvcinema.sungwon.model.member.dto.MemberDTO;

@Service
public class ContackServiceImpl implements ContactService {
	@Inject
	ContactDAO contactDao;

	@Override
	public void insert(ContactDTO dto) {
		contactDao.insert(dto);
	}

	@Override
	public List<ContactDTO> oto_list(String userid, int start, int end) {
		return contactDao.oto_list(userid, start, end);
	}

	@Override
	public ContactDTO oto_view(int idx) {
		return contactDao.oto_view(idx);
	}

	@Override
	public int countOto(String userid) {
		return contactDao.countOto(userid);
	}

	@Override
	public MemberDTO userInfo(String userid) {
		return contactDao.userInfo(userid);
	}

	@Override
	public void DeleteAll(String userid) {
		contactDao.DeleteAll(userid);
	}

	@Override
	public void DeleteOne(int idx) {
		contactDao.DeleteOne(idx);
	}

}
