package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.psj.domain.PsjPagingDto;
import com.kh.psj.domain.SearchDto;
import com.kh.psj.domain.TipUpDownVo;
import com.kh.psj.domain.TipVo;

@Repository
public class TipDaoImpl implements ITipDao{
	
	@Inject
	SqlSession sqlSession;
	
	final String NAME_SPACE = "tip.";
	
	@Override
	public void insert(TipVo tipVo) throws Exception{
		sqlSession.insert(NAME_SPACE + "insert", tipVo);
		
	}

	@Override
	public void delete(int tip_no) throws Exception{
		sqlSession.delete(NAME_SPACE + "delete", tip_no);
		
	}

	@Override
	public void update(TipVo tipVo) throws Exception{
		sqlSession.update(NAME_SPACE + "update", tipVo); 
		
	}

	@Override
	public void update_tipUp_plus(TipVo tipVo) throws Exception{
		sqlSession.update(NAME_SPACE + "update_tipUp_plus", tipVo);
		
	}

	@Override
	public void update_tipDown_plus(TipVo tipVo) throws Exception{
		sqlSession.update(NAME_SPACE + "update_tipDown_plus", tipVo);
		System.out.println("dao  tipdown:" + tipVo);
		
	}

	@Override
	public List<TipVo> select(TipVo tipVo) throws Exception{
//		System.out.println("daoTipVo" + tipVo);
		List<TipVo> list = sqlSession.selectList(NAME_SPACE + "select", tipVo);
//		System.out.println("dao tipList" + list);
		return list;
	}

	@Override
	public int selectCount(SearchDto searchDto) throws Exception{
		int count = sqlSession.selectOne(NAME_SPACE + "selectCount", searchDto);
		return count;
	}

	@Override
	public void insert_tbl_tipUpDown(TipVo tipVo) throws Exception {
		sqlSession.insert(NAME_SPACE + "insert_tbl_tipUpDown", tipVo);
		
	}

	@Override
	public List<TipUpDownVo> select_tipUpDown(TipUpDownVo updownVo) throws Exception {
		List<TipUpDownVo> list = sqlSession.selectList(NAME_SPACE + "select_tbl_updown", updownVo);
		return list;
	}

	@Override
	public void update_tipUp_minus(TipVo tipVo) throws Exception {
		sqlSession.update(NAME_SPACE + "update_tipUp_minus", tipVo);
		
	}

	@Override
	public void update_tipDown_minus(TipVo tipVo) throws Exception {
		sqlSession.update(NAME_SPACE + "update_tipDown_minus", tipVo);
		
	}

	@Override
	public void delete_tbl_tipUpDown(TipVo tipVo) throws Exception {
		sqlSession.delete(NAME_SPACE + "delete_tbl_updown", tipVo);
		
	}



}
