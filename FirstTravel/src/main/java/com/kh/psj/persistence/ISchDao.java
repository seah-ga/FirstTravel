package com.kh.psj.persistence;

import java.util.List;

import com.kh.psj.domain.SchVo;

public interface ISchDao {
	public void insertSch(SchVo schVo) throws Exception;
	public void deleteSch(SchVo schVo) throws Exception;
	public void updateSch(SchVo schVo) throws Exception;
	public List<SchVo> selectAllSch(int user_code) throws Exception;
	public SchVo selectSchByDate(SchVo schVo) throws Exception;

}
