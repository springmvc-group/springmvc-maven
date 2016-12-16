package com.fengtaiguang.springmvc.portal.web.controller.spring;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.sys.entity.User;

@Controller
@RequestMapping("/views/user/")
public class UserControllerSpring {

	
	@RequestMapping("input")
	public String input() {
		System.out.println("........input");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}
	// uri  method(get/post/put/delete.....)   params  
	@RequestMapping(value="action",method=RequestMethod.GET)
	public String action_get() {
		System.out.println("........action_get");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}
	@RequestMapping(value="action",method=RequestMethod.POST)
	public String action_post() {
		System.out.println("........action_post");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}
	@RequestMapping(value="action",method=RequestMethod.PUT)
	public String action_put() {
		System.out.println("........action_put");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}
	@RequestMapping(value="action",method=RequestMethod.DELETE)
	public String action_delete() {
		System.out.println("........action_delete");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}
	
	@RequestMapping("save")
	@ResponseBody
	public  User save(User user) {
		System.out.println("........input user:"+user);
		user.setUserId("u001");
		return user;
	}
	@RequestMapping(value = "update")  
    public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {  
  
        System.out.println("开始");  
        String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
//        String fileName = new Date().getTime()+".jpg";  
        System.out.println(path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        model.addAttribute("fileUrl", request.getContextPath()+"/upload/"+fileName);  
  
        return "result";  
    }  
}
