package com.kh.psj.persistence;
import java.util.List;

import com.kh.psj.domain.CartVo;

public interface ICartDao {
	public void insertCart(CartVo cartVo) throws Exception;
	public List<CartVo> selectAllCart(int user_code) throws Exception;

}
