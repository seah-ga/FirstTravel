package com.kh.psj.service;

import java.util.List;

import com.kh.psj.domain.PsjPagingDto;
import com.kh.psj.domain.SearchDto;
import com.kh.psj.domain.TipUpDownVo;
import com.kh.psj.domain.TipVo;

public interface ITipService {
	public void writeTip(TipVo tipVo) throws Exception;
	public void deleteTip(int tip_no) throws Exception;
	public void	modifyTip(TipVo tipVo) throws Exception;
	public void update_tipUpDown_plus(TipVo tipVo) throws Exception;
	public void update_tipUpDown_minus(TipVo tipVo) throws Exception;
	
	public List<TipVo> showList(TipVo tipVo) throws Exception;
	public int getCount(SearchDto searchDto) throws Exception;
	public List<TipUpDownVo> getUpDown(TipUpDownVo updownVo) throws Exception;
	
	

}
