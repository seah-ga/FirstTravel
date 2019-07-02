package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.psj.domain.SchTitleVo;
import com.kh.psj.domain.SchVo;

@Repository
public class SchDaoImpl implements ISchDao{
	
	@Inject
	SqlSession sqlSession;
	
	private final String NAME_SPACE = "schedule.";
	
	// 스케쥴 입력
	@Override
	public void insertSch(SchVo schVo) throws Exception {
		sqlSession.insert(NAME_SPACE + "insertSch", schVo); 
	}
	//스케쥴 삭제
	@Override
	public void deleteSch(SchVo schVo) throws Exception {
		sqlSession.delete(NAME_SPACE + "deleteSch", schVo);
		
	}
	// 스케쥴 업데이트
	@Override
	public void updateSch(SchVo schVo) throws Exception {
		sqlSession.update(NAME_SPACE + "updateSch", schVo);
		
	}
	//ID별 스케쥴
	@Override
	public List<SchVo> selectAllSch(int user_code) throws Exception {		
		List<SchVo> schList = sqlSession.selectList(NAME_SPACE + "selectAllSch", user_code); 
		return schList;
	}
	//ID + 날짜별 스케쥴
	@Override
	public List<SchVo> selectSchByDate(int user_code, String date) throws Exception {
		SchVo schVo = new SchVo();
		schVo.setSch_date(date);
		schVo.setUser_code(user_code);
		List<SchVo> list = sqlSession.selectList(NAME_SPACE + "selectSchByDate", schVo); 
		return list;
	}
	@Override
	public void insertSchTitle(SchTitleVo schTitleVo) throws Exception {
		sqlSession.insert(NAME_SPACE + "insertSchTitle", schTitleVo);
		
	}
	@Override
	public void deleteSchTitle(SchTitleVo schTitleVo) throws Exception {
		sqlSession.delete(NAME_SPACE + "deleteSchTitle", schTitleVo); 
		
	}
	@Override
	public void updateSchTitle(SchTitleVo schTitleVo) throws Exception {
		sqlSession.update(NAME_SPACE + "updateSchTitle", schTitleVo);
		
	}
	@Override
	public List<SchTitleVo> selectSchTitle(SchTitleVo schTitleVo) throws Exception {
		List<SchTitleVo> returnSchTitleVo = sqlSession.selectList(NAME_SPACE + "selectSchTitle", schTitleVo);
		return returnSchTitleVo;
		
	}
	
}
