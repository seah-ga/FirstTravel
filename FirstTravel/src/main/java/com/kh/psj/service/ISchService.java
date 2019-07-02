package com.kh.psj.service;

import java.util.List;

import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;

public interface ISchService {
	public void writeSch(SchVo schVo) throws Exception;
	public void deleteSch(SchVo schVo) throws Exception;
	public void modifySch(SchVo schVo) throws Exception;
	public List<SchVo> showSchByDate(int user_code ,String date) throws Exception;
	public List<SchVo> showAllSch(int user_code) throws Exception;
	
	public void setSchTitle(SchTitleVo schTitleVo) throws Exception;
	public void deleteSchTitle(SchTitleVo schTitleVo) throws Exception;
	public void modifySchTitle(SchTitleVo schTitleVo) throws Exception;
	public List<SchTitleVo> showSchTitle(SchTitleVo schtitleVo) throws Exception;

}
