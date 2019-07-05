package com.kh.psj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.kdw.persistence.IMemberDao;
import com.kh.psj.domain.PsjPagingDto;
import com.kh.psj.domain.SearchDto;
import com.kh.psj.domain.TipUpDownVo;
import com.kh.psj.domain.TipVo;
import com.kh.psj.persistence.ITipDao;

@Service
public class TipServiceImpl implements ITipService{

	@Inject
	ITipDao tipDao;
	@Inject // 덕우씨 파일
	IMemberDao memberDao;
	
	@Override
	public void writeTip(TipVo tipVo) throws Exception{
		tipDao.insert(tipVo);
		
	}

	@Override
	public void deleteTip(int tip_no) throws Exception{
		tipDao.delete(tip_no);
		
	}

	@Override
	public void modifyTip(TipVo tipVo) throws Exception{
		tipDao.update(tipVo);
		
	}
	
	@Transactional
	@Override
	public void update_tipUpDown_plus(TipVo tipVo) throws Exception {
		if(tipVo.getUpdownVo().getTip_sort().equals("up")) {
			tipDao.update_tipUp_plus(tipVo);
		}else if(tipVo.getUpdownVo().getTip_sort().equals("down")){
			tipDao.update_tipDown_plus(tipVo);
		}
		tipDao.insert_tbl_tipUpDown(tipVo);
		
	}
	
	@Transactional
	@Override
	public void update_tipUpDown_minus(TipVo tipVo) throws Exception {
		if(tipVo.getUpdownVo().getTip_sort().equals("up")) {
			tipDao.update_tipUp_minus(tipVo);
		}else if(tipVo.getUpdownVo().getTip_sort().equals("down")){
			tipDao.update_tipDown_minus(tipVo);
		}
		tipDao.delete_tbl_tipUpDown(tipVo);
	}
	

	@Override
	public List<TipVo> showList(TipVo tipVo) throws Exception{
		List<TipVo> list = tipDao.select(tipVo);
		return list;
	}

	@Override
	public int getCount(SearchDto searchDto) throws Exception{
		int count = tipDao.selectCount(searchDto);
//		memberDao
		return count;
	}

	@Override
	public List<TipUpDownVo> getUpDown(TipUpDownVo updownVo) throws Exception {
		List<TipUpDownVo> list = tipDao.select_tipUpDown(updownVo);
		return list;
	}

	

}
