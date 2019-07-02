package com.kh.psj.service;

import java.util.List;

import com.kh.psj.domain.CartVo;

public interface ICartService {
	public List<CartVo> showCartList(int user_code) throws Exception;
	public void putItemToCart(CartVo cartVo) throws Exception;

}
