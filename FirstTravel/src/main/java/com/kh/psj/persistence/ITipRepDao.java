package com.kh.psj.persistence;

import java.util.List;

import com.kh.psj.domain.TipRepVo;



public interface ITipRepDao {
	public List<TipRepVo> select(int tip_no) throws Exception;
	public void delete(TipRepVo tipRepVo) throws Exception;
	public void insert(TipRepVo tipRepVo) throws Exception;
	public void update(TipRepVo tipRepVo) throws Exception;
	
}
