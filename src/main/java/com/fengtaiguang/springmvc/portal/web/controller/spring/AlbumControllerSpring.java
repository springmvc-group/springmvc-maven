package com.fengtaiguang.springmvc.portal.web.controller.spring;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/views/album/")
public class AlbumControllerSpring {

	@RequestMapping("save")
	public String save() {
		System.out.println("........");
		return null;
	}

	@RequestMapping(value = "/{day}", method = RequestMethod.GET)
	public Map<String, String> getForDay(@PathVariable @DateTimeFormat(iso = ISO.DATE) Date day, Model model) {
		Map<String ,String> map=new HashMap();
		map.put("name", "111111");
		return map;
	}
}
