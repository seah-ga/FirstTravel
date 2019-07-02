package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.psj.domain.CartVo;

@Repository
public class CartDaoImpl implements ICartDao {
	@Inject
	SqlSession sqlSession;
	
	final String NAME_SPACE = "cart."; 
	@Override
	public void insertCart(CartVo cartVo) throws Exception{
		sqlSession.insert(NAME_SPACE + "insert", cartVo);
		
	}

	@Override
	public List<CartVo> selectAllCart(int user_code) throws Exception{
		List<CartVo> list = sqlSession.selectList(NAME_SPACE + "select", user_code);
		return list;
	}

}
