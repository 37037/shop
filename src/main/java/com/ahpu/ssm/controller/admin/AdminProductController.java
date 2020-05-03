package com.ahpu.ssm.controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.pojo.Category;
import com.ahpu.ssm.pojo.PageBean;
import com.ahpu.ssm.pojo.Product;
import com.ahpu.ssm.service.admin.ProductService;
import com.ahpu.ssm.util.UUIDUtil;

@Controller
@RequestMapping("/admin")
public class AdminProductController {  
	
	@Autowired
	ProductService service;

	@RequestMapping("/showAddProduct")
	public String showAddProduct() {
		return "admin/product/add";
	}
	
	@RequestMapping("/listProduct")
	public ModelAndView listProduct(int curPage) {
		ModelAndView mav = new ModelAndView();
		PageBean page = service.listProduct(curPage);
		mav.setViewName("admin/product/list");
		mav.addObject("page",page);
		return mav;
	}
	
	
	
	@RequestMapping("/addProducts")
	public ModelAndView addProduct(Product p,String cid,MultipartFile pictrueFile) throws IllegalStateException, IOException {

		// 设置图片名称，不能重复，使用 uuid
		String picName = UUIDUtil.getUUId();

		// 获取提交上来的文件名
		String oriName = pictrueFile.getOriginalFilename();
		System.out.println(oriName);
		System.out.println(23);

		// 通过文件名获取后缀名
		String extName = oriName.substring(oriName.lastIndexOf("."));

		// 上传图片
		pictrueFile.transferTo(new File("C:\\Users\\Administrator\\Desktop\\C\\src\\main\\webapp\\pic\\" + picName + extName));
		System.out.print(picName);
		p.setPid(UUIDUtil.getUUId());

		p.setPimage(picName + extName);

		Category c = new Category();

		c.setCid(cid);

		p.setCategory(c);

		p.setPdate(new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss").format(new Date()));

		ModelAndView mav = new ModelAndView();

		service.addProduct(p);

		mav.addObject("msg","添加商品成功");

		mav.setViewName("admin/welcome");

		return mav;
	}
	
	@RequestMapping("/updateProduct")
	public ModelAndView updateProduct(MultipartFile pictrueFile,Product p)throws IllegalStateException ,IOException{

		if(pictrueFile.getSize()!= 0){
			String picName = UUIDUtil.getUUId();

			// 获取提交上来的文件名
			String oriName = pictrueFile.getOriginalFilename();
			System.out.println(11);
			System.out.println(oriName);
			System.out.println(45);

			// 通过文件名获取后缀名
			String extName = oriName.substring(oriName.lastIndexOf("."));

			// 上传图片
			pictrueFile.transferTo(new File("C:\\Users\\Administrator\\Desktop\\C\\src\\main\\webapp\\pic\\" + picName + extName));
			p.setPimage(picName + extName);
			service.updateProduct(p);
		}else {
			service.updateProduct1(p);
		}


		ModelAndView mav = new ModelAndView();


		mav.addObject("msg", "修改成功");
		mav.setViewName("admin/welcome");
		return mav;
	}
	
	@RequestMapping("/editProduct")
	public ModelAndView editProduct(String pid) {
		ModelAndView mav = new ModelAndView();
		Product p = service.queryProductByPid(pid);
		mav.setViewName("admin/product/edit");
		mav.addObject("product",p);
		return mav;
	}

	@RequestMapping("/deleteProduct")
	public ModelAndView deleteProduct(Product p) {
		ModelAndView mav = new ModelAndView();
		service.deleteProduct(p);
		mav.addObject("msg", "删除成功");
		mav.setViewName("admin/welcome");
		return mav;
	}

	@RequestMapping("/find")
	public ModelAndView find(String name,int curPage) {
		ModelAndView mav = new ModelAndView();
		PageBean page=service.listsearchProduct(name,curPage);
		mav.addObject("page", page);
		System.out.println(page);
		mav.setViewName("admin/product/findp");
		return mav;
	}
}
