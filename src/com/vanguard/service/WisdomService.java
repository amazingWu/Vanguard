package com.vanguard.service;

import java.util.List;

import javax.annotation.Resource;

import com.vanguard.dao.WisdomDao;
import com.vanguard.entity.Example;
import com.vanguard.entity.Wisdom;

public class WisdomService {
	private WisdomDao wisdomDao;

	@Resource
	public void setWisdomDao(WisdomDao wisdomDao) {
		this.wisdomDao = wisdomDao;
	}
	
	/**
	 * 查询列表
	 * @return
	 */
	public List<Wisdom> WisdomList(){
		return wisdomDao.WisdomList();
	}
	
	/**
	 * 增加或更新
	 * @param wisdom
	 */
	public void AddUpdateWisdom(Wisdom wisdom){
		wisdomDao.AddUpdateWisdom(wisdom);
	}
	/**
	 * 删除
	 * @param id
	 */
	public void DelWisdom(final int id){
		wisdomDao.DelWisdom(id);
	}
	
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	public Wisdom GetWisdom(int id){
		return wisdomDao.GetWisdom(id);
	}
	

}
