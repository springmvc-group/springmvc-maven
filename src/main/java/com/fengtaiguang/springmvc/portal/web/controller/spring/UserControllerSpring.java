package com.fengtaiguang.springmvc.portal.web.controller.spring;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.my.sys.entity.User;

@Controller
@RequestMapping("/views/user/")
public class UserControllerSpring {
	public static String disBasePath = "d:/upload/";
	public static String webBasePath = "/files/";

	@RequestMapping("input")
	public String input() {
		System.out.println("........input");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}

	// uri method(get/post/put/delete.....) params
	@RequestMapping(value = "action", method = RequestMethod.GET)
	public String action_get() {
		System.out.println("........action_get");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}

	@RequestMapping(value = "action", method = RequestMethod.POST)
	public String action_post() {
		System.out.println("........action_post");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}

	@RequestMapping(value = "action", method = RequestMethod.PUT)
	public String action_put() {
		System.out.println("........action_put");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}

	@RequestMapping(value = "action", method = RequestMethod.DELETE)
	public String action_delete() {
		System.out.println("........action_delete");
		// /views/user/user_input.jsp
		return "/user/user_input";
	}

	@RequestMapping("save")
	@ResponseBody
	public User save(User user) {
		System.out.println("........input user:" + user);
		user.setUserId("u001");
		return user;
	}

	@RequestMapping("save_json")
	@ResponseBody
	public User save_json(@RequestBody User user) {
		System.out.println("........input save_json:" + user);
		return user;
	}

	@RequestMapping(value = "upload")
	public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
			ModelMap model) {
		System.out.println("...........上传开始");
		// String path =
		// request.getSession().getServletContext().getRealPath("upload");
		String path = "e:/springmvc-file/";
		String fileName = file.getOriginalFilename();
		System.out.println("..原始的文件名称:" + fileName);
		// String fileName = new Date().getTime()+".jpg";
		System.out.println(path);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "user/upload_result";
	}

	/*
	 * 上传多个文件
	 */
	@RequestMapping(value = "upload_more", produces = "application/json;charset=UTF-8")
	public @ResponseBody Boolean uploadFiles(HttpServletRequest request, @RequestParam("files") MultipartFile[] files) {
		boolean result = false;
		Map fileMap = new HashMap();
		// http://www.baidu.com:9001/myweb/files/
		String realPath;
		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				try {
					// 得到客户端传过来的文件原始名称
					String uniqueName = files[i].getOriginalFilename();
					String sf = uniqueName.substring(uniqueName.lastIndexOf("."));
					// 为上传文件起一个新的名字
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");
					String datePath = new SimpleDateFormat("yyyyMM").format(date);
					String newFile = sdf.format(date) + "-" + (int)( Math.random() * 999) + sf;
					// 将该文件存放到磁盘的路径
					String newFilePath = disBasePath + datePath + "/";
					System.out.println("...realPath=" + newFilePath);
					File d = new File(newFilePath);
					if (!d.exists()) {
						d.mkdirs();
					}
					// 转存文件
					files[i].transferTo(new File(newFilePath, newFile));
					// 构造一个在web服务器上访问的URI
					String fileWebUri = webBasePath + datePath + "/" + newFilePath;
					fileMap.put("uniqueName", fileWebUri);
					result = true;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

}
