package com.ahpu.ssm.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ahpu.ssm.pojo.PageBean;
import com.ahpu.ssm.pojo.admin;
import com.ahpu.ssm.pojo.notice;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ahpu.ssm.pojo.User;
import com.ahpu.ssm.service.UserService;
import com.ahpu.ssm.util.UUIDUtil;

import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	UserService service;
	@RequestMapping("/getuser")
	public ModelAndView getuser(int curPage){
		ModelAndView mav=new ModelAndView();
		PageBean page =service.listUser( curPage);

		mav.addObject("page",page);
		mav.setViewName("admin/usermanage/messageuser");
		return  mav;
	}
	@RequestMapping("/finduserbyname")
	public ModelAndView finduserbyname(String uname){
		ModelAndView mav=new ModelAndView();
		User u=service.finduser(uname);

		mav.addObject("u",u);
		mav.setViewName("admin/usermanage/finduser");
		return  mav;
	}
	@RequestMapping("/deleteuser")
	public ModelAndView  deleteuser(String uid){
		ModelAndView mav=new ModelAndView();
		service.deleteuser(uid);
		mav.addObject("msg", "删除成功");
		mav.setViewName("admin/welcome");
		return mav;

	}
	@RequestMapping("/updateuser")
    public ModelAndView  updateuser(String username){
        ModelAndView mav=new ModelAndView();
        User user =service.finduser(username);

        mav.addObject("user", user);
        mav.setViewName("admin/usermanage/edit");
        return mav;

    }
    @RequestMapping("/updatemessage")
    public ModelAndView  updatemessage(User user){
        ModelAndView mav=new ModelAndView();
        service.updatemessage(user);

        mav.addObject("msg", "修改成功");
        mav.setViewName("admin/welcome");
        return mav;

    }
	@RequestMapping("/adminLogin")
	public String login(){
		return "admin/adminLogin";
	}
	@RequestMapping("doLogin")
	@ResponseBody
	public String dologin(@Param("admin") admin admin,HttpSession session){
//		admin a=new admin();
//		a.setAcount(acount);
//		a.setPwd(pwd);
		if(service.adminLogin(admin)){
			session.setAttribute("admin", admin);
			String msg="yes";
			return msg;
		}else {
			String msg="no";
			return msg;

		}

	}

	
	
	
	@RequestMapping("/addProduct")
	public String addProduct() {
		return "admin/product/add";
	}
	
	@RequestMapping("/index")
	public String index() {
		return "admin/home";
	}
	
	@RequestMapping("/top")
	public String top() {
		return "admin/top";
	}
	@RequestMapping("/bottom")
	public String bottom() {
		return "admin/bottom";
	}
	@RequestMapping("/left")
	public String left() {
		return "admin/left";
	}
	@RequestMapping("/welcome")
	public String welcome() {
		return "admin/welcome";
	}
	@RequestMapping("/notice")
    public  ModelAndView notice(){
	   List<notice> list= service.findnotice();
	    ModelAndView mav=new ModelAndView();
	    mav.setViewName("/admin/notice");
	    mav.addObject("list" ,list);



	    return mav;
    }
    @RequestMapping("/deletenotice")
    public  ModelAndView deletenotice(String nid){
        service.deletenotice(nid);
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/admin/welcome");
        mav.addObject("msg" ,"删除成功");
        return mav;
    }
    @RequestMapping("/updatenotice")
    @ResponseBody
    public  String updatenotice(String notice){

		notice n=new notice();
		n.setNotice(notice);
		n.setTime(new Date(System.currentTimeMillis()));
	    service.addnotice(n);


        return "success";
    }
	
	

}
