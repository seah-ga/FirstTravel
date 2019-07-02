package com.kh.psj.persistence;

import java.util.List;

import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;

/**
 * @author KH
 *
 */
public interface ISchDao {
	public void insertSch(SchVo schVo) throws Exception;
	public void deleteSch(SchVo schVo) throws Exception;
	public void updateSch(SchVo schVo) throws Exception;
	public List<SchVo> selectAllSch(int user_code) throws Exception;
	public List<SchVo> selectSchByDate(int user_code, String date) throws Exception;
	
	public void insertSchTitle(SchTitleVo schTitleVo) throws Exception;
	public void deleteSchTitle(SchTitleVo schTitleVo) throws Exception;
	public void updateSchTitle(SchTitleVo schTitleVo) throws Exception;
	public List<SchTitleVo> selectSchTitle(SchTitleVo schTitleVo) throws Exception;

}
