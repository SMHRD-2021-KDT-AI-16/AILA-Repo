package com.aila.db;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aila.model.FoodVO;

public class FoodDAO {
	
private SqlSessionFactory factory = SqlSessionManager.getFactory();
	
	public List<FoodVO> FoodInfo(){

		List<FoodVO> Foods = null;
		
		SqlSession sqlsession = factory.openSession();
		try {
			Foods = sqlsession.selectList("FoodInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			sqlsession.close();
		}
		return Foods;
	}

}
