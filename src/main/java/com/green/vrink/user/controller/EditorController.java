package com.green.vrink.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/editor")
public class EditorController {

	@GetMapping("/editor-detail")
	public String editorDetail() {
		return "files_mushi/editorDetail";
	}
}
