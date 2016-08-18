package com.vanguard.service;

import java.util.List;

import javax.annotation.Resource;

import com.vanguard.dao.ExampleDao;
import com.vanguard.entity.Enums;
import com.vanguard.entity.Example;

public class ExampleService {
	private ExampleDao exampleDao;
	@Resource(name="exampleDao")
	public void setExampleDao(ExampleDao exampleDao) {
		this.exampleDao = exampleDao;
	}

	/**
	 * 增加装修案例
	 * @param example
	 * @return
	 */
	public boolean AddExample(Example example){
		/*try{*/
			exampleDao.AddExample(example);
			return true;
		/*}catch(Exception e){
			return false;
		}*/
	}
	
	/**
	 * 案例列表
	 * @param start
	 * @param offset
	 * @return
	 */
	public List<Example> ExampleList(int start,int offset,Enums.ExampleKind kind){
		return exampleDao.ExampleList(start, offset, kind);
	}
	/**
	 * 案例总量
	 * @return
	 */
	public int ExampleNum(Enums.ExampleKind kind){
		return exampleDao.ExampleNum(kind);
	}
	
	/**
	 * 重置案例的首页滚动和首页推荐
	 */
	public void UpdateRecommend(final int id,final int value,final Enums.ExampleKind kind){
		exampleDao.UpdateRecommend(id, value, kind);
	}
	/**
	 * 删除案例
	 * @param id
	 */
	public void DelExample(long id){
		exampleDao.DelExample(id);
	}
	/**
	 * 根据id查找
	 */
	public Example GetExample(long id){
		return exampleDao.GetExample(id);
	}
	/**
	 * 更新
	 * @param example
	 */
	public void Update(Example example){
		exampleDao.Update(example);
	}


}
