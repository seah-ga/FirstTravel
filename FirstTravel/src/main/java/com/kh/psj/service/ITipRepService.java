package com.kh.psj.service;

import java.util.List;

import com.kh.psj.domain.TipRepVo;



public interface ITipRepService {
	public List<TipRepVo> getRepList(int tip_no) throws Exception;
	public void deleteRepList(TipRepVo tipRepVo) throws Exception;
	public void writeRepList(TipRepVo tipRepVo) throws Exception;
	public void modifyRepList(TipRepVo tipRepVo) throws Exception;
	
}
