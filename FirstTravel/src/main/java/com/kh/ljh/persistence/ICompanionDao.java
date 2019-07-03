package com.kh.ljh.persistence;

import com.kh.ljh.domain.CompanionVo;

public interface ICompanionDao {
	//글쓰기 시키기 
	public void insert(CompanionVo vo) throws Exception;

}
