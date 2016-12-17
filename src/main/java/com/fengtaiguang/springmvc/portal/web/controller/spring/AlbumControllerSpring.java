package com.fengtaiguang.springmvc.portal.web.controller.spring;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengtaiguang.ddd.framwork.domain.vo.query.IQueryAndResult;
import com.fengtaiguang.ddd.framwork.domain.vo.query.QueryAndResult;
import com.fengtaiguang.photoalbum.application.dto.AlbumDto;
import com.fengtaiguang.springmvc.portal.web.query.QueryAndResultEasyUI;

@Controller
@RequestMapping("/views/album/")
public class AlbumControllerSpring {
	@RequestMapping("main")
	public String main() {
		System.out.println("........album.main");
		// /views/user/user_input.jsp
		return "/album/album";
	}

	@RequestMapping("find")
	@ResponseBody
	public IQueryAndResult find(AlbumDto album) {
		QueryAndResult queryAndResult = new QueryAndResult();
		System.out.println("........list album:" + album);
		AlbumDto albumDto = new AlbumDto();
		List list = new ArrayList();
		for (int i = 0; i < 20; i++) {
			albumDto = new AlbumDto();
			albumDto.setId(UUID.randomUUID() + "");
			albumDto.setNumber(i + 1);
			albumDto.setName("name1");
			albumDto.setDescription("sss");
			list.add(albumDto);
		}
		QueryAndResultEasyUI queryAndResultEasyUI = new QueryAndResultEasyUI();
		queryAndResultEasyUI.setTotal(20);
		queryAndResultEasyUI.setRows(list);

		return queryAndResultEasyUI;
	}
	@RequestMapping("save")
	@ResponseBody
	public Boolean save(AlbumDto album) {
		System.out.println("........save:album"+album);
		return true;
	}
	@RequestMapping("edit")
	@ResponseBody
	public Boolean edit(AlbumDto album) {
		System.out.println("........edit:"+album);
		return true;
	}
	@RequestMapping("view")
	@ResponseBody
	public AlbumDto view(AlbumDto album) {
		System.out.println("........view:"+album);
		return album;
	}
	@RequestMapping("update")
	@ResponseBody
	public Boolean update(AlbumDto album) {
		System.out.println("........update:"+album);
		return true;
	}
	@RequestMapping("delete")
	@ResponseBody
	public Boolean delete(String id) {
		System.out.println("........update:"+id);
		return true;
	}
}
