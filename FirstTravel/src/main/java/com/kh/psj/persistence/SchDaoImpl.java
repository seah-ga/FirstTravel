package com.kh.psj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public List<SchVo> selectAllSch() throws Exception {		
		sqlSession.selectList(NAME_SPACE + "selectAllSch"); 
		return null;
	}
	//ID + 날짜별 스케쥴
	@Override
	public SchVo selectSchByDate(SchVo schVo) throws Exception {
		
		return null;
	}
	
}
