package com.green.vrink.user.controller;

import com.green.vrink.morph.service.MorphService;
import com.green.vrink.payment.dto.PriceDTO;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.dto.EditorPriceDTO;
import com.green.vrink.user.dto.EditorPriceListDTO;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorService;
import com.green.vrink.user.service.EditorServiceImpl;
import com.green.vrink.util.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;


@Controller
@RequestMapping("/editor")
@RequiredArgsConstructor
@Slf4j
public class EditorController {

    private final ReviewService reviewService;
    private final EditorService editorService;
    private final MorphService morphService;
    private final HttpSession session;
    private final UserRepository userRepository;
    @GetMapping("/editor-detail/{editorId}")
    public String editorDetail(@PathVariable("editorId") Integer editorId
            , HttpSession session
            , Model model
    ) {
        if (editorId == null) {
            return "redirect:/";
        }
        List<ReviewDTO> reviewDTOS = reviewService.findByIdAll(editorId);
        String morph = morphService.getMorph(editorId);


        model.addAttribute("reviewList", reviewDTOS);
        log.info("reviewList {}", reviewDTOS);

        EditorDTO editorDTO = editorService.responseEditorDeatil(editorId);
        model.addAttribute("editorDetail", editorDTO);
        List<EditorPriceDTO> editorPrice = editorService.responsePrice(editorId);
        model.addAttribute("editorPrice", editorPrice);
        log.info("editorDetail{}", editorDTO);
        log.info("morph : {}",morph);
        model.addAttribute("morph",morph);


        return "user/editorDetail";
    }

    @GetMapping("/editor-write")
    public String editorWrite() {

        return "user/editorWrite";
    }


    @GetMapping("/editor-edit")
    public String editorEdit(@RequestParam("editor-id") Integer editorId, Model model) {
        if (session.getAttribute(Define.EDITOR_ID) == null || editorId == null || session.getAttribute(Define.EDITOR_ID) != editorId) {
            return "redirect:/";
        }
        EditorDTO editorDTO = editorService.responseEditorEdit(editorId);
        model.addAttribute("editorEdit", editorDTO);
        return "user/editorEdit";
    }

    @GetMapping("/login")
    public String login() {
        return "layout/header";
    }

    @GetMapping("/apply-form")
    @StandardCheck
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
        String vrm = editorService.getVrm(editorId);
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
        Integer total = editorService.getTotal();
        pageDTO.setArticleTotalCount(total);
        List<EditorDTO> editorDTO = editorService.getList(cri);
        AsyncPageDTO asyncPageDTO = new AsyncPageDTO();
        asyncPageDTO.setPageDTOs(editorDTO);
        asyncPageDTO.setHasNext(1, pageDTO.getEndPage());
        model.addAttribute("list", editorDTO);
        model.addAttribute("next", asyncPageDTO.isHasNext());
        return "user/editorList";
    }
    
    @GetMapping("/editor-price")
    public String editorPrice(@RequestParam("editor-id") Integer editorId,Model model) {
        if(session.getAttribute(Define.EDITOR_ID) == null ||
                session.getAttribute(Define.EDITOR_ID) != editorId) {
            return "redirect:/";
        }
        List<EditorPriceDTO> editorPriceDTO = editorService.responsePrice(editorId);
        model.addAttribute("editorPriceDTO",editorPriceDTO);
    	return "user/editorPrice";
    }

    @PostMapping("/editor-price")
    public String EditorPrice(EditorPriceListDTO editorPriceListDTO) {
        editorService.requestEditorPrice(editorPriceListDTO);

        return "redirect:/editor/editor-detail/"+session.getAttribute(Define.EDITOR_ID);
    }

    @GetMapping("/calculate/point")
    public String calculatePoint(Model model) {
        User user = (User) session.getAttribute(Define.USER);
        if (user == null) {
            return "user/applyForm";
        }
        if (Objects.equals(user.getEditor(), "editor")) {
            User newUser = userRepository.findByUserId(user.getUserId());
            model.addAttribute("newUser", newUser);
            return "user/calculatePoint";
        }

        return "user/applyForm";
    }
}
