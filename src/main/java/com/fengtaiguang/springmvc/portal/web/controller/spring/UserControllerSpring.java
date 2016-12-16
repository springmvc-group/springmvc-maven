package com.fengtaiguang.springmvc.portal.web.controller.spring;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Path;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String path = "d:/springmvc/";
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
		model.addAttribute("fileUrl", request.getContextPath() + "/upload/" + fileName);

		return "user/upload_result";
	}

	/*
	 * 上传多个文件
	 */
	@RequestMapping(value = "upload_more", produces = "application/json;charset=UTF-8")
	public @ResponseBody boolean uploadFiles(@RequestParam("files") MultipartFile[] files) {
		boolean result = false;
		String realPath;
		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {
				try {
					String uniqueName = files[i].getOriginalFilename();// 得到文件名

					realPath = "E:" + File.separator + uniqueName;// 文件上传的路径这里为E盘
					System.out.println("...realPath=" + realPath);
					files[i].transferTo(new File(realPath)); // 转存文件
					result = true;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

}
