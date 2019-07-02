package com.kh.psj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.psj.domain.CartVo;
import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;
import com.kh.psj.persistence.ICartDao;
import com.kh.psj.persistence.ISchDao;

@Service
public class CartServiceImpl implements ICartService{
	@Inject
	ICartDao cartDao;
	@Inject
	ISchDao schDao;

	@Override
	public List<CartVo> showCartList(int user_code) throws Exception {
		List<CartVo> list = cartDao.selectAllCart(user_code);
		return list;
	}

	@Override
	@Transactional
	public void putItemToCart(CartVo cartVo) throws Exception{
		cartDao.insertCart(cartVo);
		String sch_date = cartVo.getDeparture_date();
		String sch_content =  cartVo.getArr_city() + " 출발 ";  
		int user_code = cartVo.getUser_code();
		
		SchTitleVo schTitleVo = new SchTitleVo();
		schTitleVo.setSch_d_content(sch_content);
		schTitleVo.setSch_d_date(sch_date);
		schTitleVo.setUser_code(user_code);
		
		schDao.insertSchTitle(schTitleVo);
		
		
	}

}
