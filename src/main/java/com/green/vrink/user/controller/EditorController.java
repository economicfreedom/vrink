package com.green.vrink.user.controller;

import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.service.EditorServiceImpl;
import com.green.vrink.util.AsyncPageDTO;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/editor")
@RequiredArgsConstructor
@Slf4j
public class EditorController {

    private final ReviewService reviewService;
    private final EditorServiceImpl editorServiceImpl;

    @GetMapping("/editor-detail/{editorId}")
    public String editorDetail(@PathVariable("editorId") Integer editorId
            , HttpSession session
            , Model model
    ) {
        if (editorId == null) {
            return "redirect:/";
        }
        List<ReviewDTO> reviewDTOS = reviewService.findByIdAll(1);
        model.addAttribute("reviewList", reviewDTOS);
        log.info("reviewList {}", reviewDTOS);

        EditorDTO editorDTO = editorServiceImpl.responseEditorDeatil(editorId);
        model.addAttribute("editorDetail", editorDTO);
        log.info("editorDetail{}", editorDTO);

        return "user/editorDetail";
    }

    @GetMapping("/editor-write")
    public String editorWrite() {

        return "user/editorWrite";
    }

    @GetMapping("/editor-edit/{editorId}")
    public String editorEdit(@PathVariable("editorId") Integer editorId, Model model) {
        if (editorId == null) {
            return "redirect:/";
        }
        EditorDTO editorDTO = editorServiceImpl.responseEditorEdit(editorId);
        model.addAttribute("editorEdit", editorDTO);
        return "user/editorEdit";
    }

    @GetMapping("/login")
    public String login() {
        return "layout/header";
    }

    @GetMapping("/apply-form")
    public String applyPage() {


        return "user/applyForm";
    }

    @GetMapping("/vrm")
    public String showVrmModel(
            @RequestParam(name = "editor-id")
            Integer editorId
            , Model model
    ) {
if (editorId == null) {
            return "redirect:/";
        }
        String vrm = editorServiceImpl.getVrm(editorId);
        vrm = vrm.replace("\\", "/");
        model.addAttribute("vrm", vrm);
        log.info("vrm 경로 {}", vrm);
        return "user/showVrm";
    }

    @GetMapping("/list")
    public String editorList(Model model) {
        Criteria cri = new Criteria();
        cri.setPageNum(1);
        cri.setCountPerPage(6);
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        Integer total = editorServiceImpl.getTotal();
        pageDTO.setArticleTotalCount(total);
        List<EditorDTO> editorDTO = editorServiceImpl.getList(cri);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setPageDTOs(editorDTO);
        asyncPageDTO.setHasNext(1, pageDTO.getEndPage());
        model.addAttribute("list", editorDTO);
        model.addAttribute("next", asyncPageDTO.isHasNext());
        return "user/editorList";
    }
    
    @GetMapping("/editor-price") 
    public String editorPrice() {
    	return "user/editorPrice";
    }
}
