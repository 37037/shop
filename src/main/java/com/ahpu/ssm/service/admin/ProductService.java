package com.ahpu.ssm.service.admin;

import java.util.List;

import com.ahpu.ssm.pojo.Cart;
import com.ahpu.ssm.pojo.PageBean;
import com.ahpu.ssm.pojo.Product;
import com.ahpu.ssm.pojo.User;

public interface ProductService {

	void addProduct(Product p);

	PageBean listProduct(int curPage);

	List<Product> findHotProduct();

	Product findProductByPid(String pid);
	Product findProductByPimage(String pimage);


	PageBean listProductByCategory(String cid, int curPage);

	void updateProduct(Product p);

	Product queryProductByPid(String pid);

	void deleteProduct(Product p);

	List<Product> findlatestProduct();
	
	PageBean listsearchProduct(String seastr , int curPage);
	void updateCount(Cart c);





	

}
