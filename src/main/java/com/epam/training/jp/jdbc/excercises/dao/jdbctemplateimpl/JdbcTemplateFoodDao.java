package com.epam.training.jp.jdbc.excercises.dao.jdbctemplateimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import com.epam.training.jp.jdbc.excercises.dao.FoodDao;
import com.epam.training.jp.jdbc.excercises.domain.Food;

public class JdbcTemplateFoodDao extends JdbcDaoSupport implements FoodDao {

	public JdbcTemplateFoodDao(DataSource dataSource) {
		setDataSource(dataSource);
	}

	@Override
	public Food findFoodByName(String name) {
		String sql = "SELECT * from FOOD WHERE NAME = ? ";
		return  this.getJdbcTemplate().queryForObject(
				sql,
		        new String[]{name},
		        new RowMapper<Food>() {
					public Food mapRow(ResultSet rs, int rowNum) throws SQLException {
						Food food = new Food();
						food.setId(rs.getInt(1));
					    food.setCalories(rs.getInt(2));
					    food.setVegan(rs.getBoolean(3));
					    food.setName(rs.getString(4));
					    food.setPrice(rs.getInt(5));
		                return food;
		              }
		          });
	}

	@Override
	public void updateFoodPriceByName(String name, int newPrice) {
		String sql = "UPDATE food SET PRICE = ? WHERE NAME = ?";
		this.getJdbcTemplate().update(sql, new Object[] {newPrice, name});
	}

	@Override
	public void save(List<Food> foods) {
		String sql = "INSERT INTO food (CALORIES, ISVEGAN, NAME, PRICE) VALUES (?, ?, ?, ?)";
		for(Food food : foods) {
			this.getJdbcTemplate().update(sql, new Object[] {
					food.getCalories(), food.isVegan(), food.getName(), food.getPrice()});
		}
	}

	@Override
	public List<Food> getAllFoods() {
		String sql = "SELECT * from FOOD; ";
		return  this.getJdbcTemplate().query(
				sql,
		        new RowMapper<Food>() {
					public Food mapRow(ResultSet rs, int rowNum) throws SQLException {
						Food food = new Food();
						food.setId(rs.getInt(1));
					    food.setCalories(rs.getInt(2));
					    food.setVegan(rs.getBoolean(3));
					    food.setName(rs.getString(4));
					    food.setPrice(rs.getInt(5));
		                return food;
		              }
		          });
	}

	
}
