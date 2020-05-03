package com.ahpu.ssm.mapper.admin;

import java.util.List;
import java.util.Map;

import com.ahpu.ssm.pojo.Cart;
import com.ahpu.ssm.pojo.Category;
import com.ahpu.ssm.pojo.Product;
import com.ahpu.ssm.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {

	void addProduct(Product p);

	List<Product> queryAllProduct(int i);

	List<Product> findByPage(Map<String, Object> map);

	int selectCount();

	List<Product> findHotProduct();

	Product findProductByPid(String pid);
	Product findProductByPimage(String pimage);

	int countProductByCategory(String cid);

	List<Product> listProductByCategory(Map<String, Object> map);
	
	Product queryProductByPid(String pid);

	void updateProduct(Product p);
	void updateProduct1(Product p);

	void deleteProduct(Product p);

	List<Product> findlatestProduct();
	
	int countProduceBySearch(String search);
	
	List<Product> listProductBySearch(Map<String, Object> map);
	void updateCount(Cart c);

	

}
