package com.kh.psj.service;

import com.kh.psj.domain.SchVo;

public interface ISchService {
	public void writeSch(SchVo schVo) throws Exception;
	public void deleteSch(SchVo schVo) throws Exception;
	public void modifySch(SchVo schVo) throws Exception;
	public void showSchByDate(SchVo schVo) throws Exception;
	public void showAllSch(int user_code) throws Exception;

}
