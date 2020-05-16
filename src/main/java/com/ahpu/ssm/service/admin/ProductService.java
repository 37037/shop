package com.ahpu.ssm.service.admin;

import java.util.List;

import com.ahpu.ssm.pojo.*;

public interface ProductService {

	void addProduct(Product p);

	PageBean listProduct(int curPage);

	List<Product> findHotProduct();

	Product findProductByPid(String pid);
	Product findProductByPimage(String pimage);


	PageBean listProductByCategory(String cid, int curPage);

	void updateProduct(Product p);
	void updateProduct1(Product p);


	Product queryProductByPid(String pid);

	void deleteProduct(Product p);

	List<Product> findlatestProduct();
	
	PageBean listsearchProduct(String seastr , int curPage);
	void updateCount(Cart c);
	List<Comments> findcomments( String pid);
	PageBean findallcomments(int curPage);
	PageBean findallcommentsyes(int curPage);
	Comments findcommentsbygid(String gid);
	 void updatecomments(Comments comments);





	

}
