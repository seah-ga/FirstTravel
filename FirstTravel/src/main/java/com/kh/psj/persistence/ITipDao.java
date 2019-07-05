package com.kh.psj.persistence;

import java.util.List;

import com.kh.psj.domain.PsjPagingDto;
import com.kh.psj.domain.SearchDto;
import com.kh.psj.domain.TipUpDownVo;
import com.kh.psj.domain.TipVo;

public interface ITipDao {
	public void insert(TipVo tipVo) throws Exception;
	public void delete(int tip_no) throws Exception;
	public void	update(TipVo tipVo) throws Exception;
	public void update_tipUp_plus(TipVo tipVo) throws Exception;
	public void update_tipUp_minus(TipVo tipVo) throws Exception;
	public void update_tipDown_plus(TipVo tipVo) throws Exception;
	public void update_tipDown_minus(TipVo tipVo) throws Exception;
	public List<TipVo> select(TipVo tipVo) throws Exception;
	public int selectCount(SearchDto searchDto) throws Exception;
	public void insert_tbl_tipUpDown(TipVo tipVo) throws Exception;
	public List<TipUpDownVo> select_tipUpDown(TipUpDownVo updownVo) throws Exception;
	public void delete_tbl_tipUpDown(TipVo tipVo) throws Exception;

}
