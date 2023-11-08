package com.green.vrink.user.controller;

import com.green.vrink.morph.service.MorphService;
import com.green.vrink.payment.service.PaymentService;
import com.green.vrink.review.dto.ReviewDTO;
import com.green.vrink.review.service.ReviewService;
import com.green.vrink.user.dto.*;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.EditorService;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
    private final UserService userService;
    private final PaymentService paymentService;

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
        log.info("morph : {}", morph);
        model.addAttribute("morph", morph);


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
    public String editorPrice(@RequestParam("editor-id") Integer editorId, Model model) {
        if (session.getAttribute(Define.EDITOR_ID) == null ||
                session.getAttribute(Define.EDITOR_ID) != editorId) {
            return "redirect:/";
        }
        List<EditorPriceDTO> editorPriceDTO = editorService.responsePrice(editorId);
        model.addAttribute("editorPriceDTO", editorPriceDTO);
        return "user/editorPrice";
    }

    @PostMapping("/editor-price")
    public String EditorPrice(EditorPriceListDTO editorPriceListDTO) {
        editorService.requestEditorPrice(editorPriceListDTO);

        return "redirect:/editor/editor-detail/" + session.getAttribute(Define.EDITOR_ID);
    }

    @GetMapping("/calculate/point")
    public String calculatePoint(Model model) {
        User user = (User) session.getAttribute(Define.USER);
        if (user == null) {
            return "user/applyForm";
        }
        if (Objects.equals(user.getEditor(), "editor")) {
            User newUser = userService.findByUserId(user.getUserId());
            model.addAttribute("newUser", newUser);
            return "user/calculatePoint";
        }

        return "user/applyForm";
    }

    @GetMapping("/request-list")
    public String editorRequestList(
            Model model

            , @RequestParam(
            name = "page-num"
            , required = false
            , defaultValue = "1")
            Integer pageNum
            , @RequestParam(required = false)
            String keyword
            , @RequestParam(required = false)
            String filter
            , @RequestParam(required = false)
            String type

    ) {
        User user = (User) session.getAttribute("USER");
        Integer userId = user.getUserId();
        int editorId = editorService.getEditorIdByUserId(userId);

        Criteria cri = new Criteria();
        cri.setKeyword(keyword);
        cri.setType(type);
        cri.setFilter(filter);
        cri.setPageNum(pageNum);
        cri.setCountPerPage(10);
        int total = editorService.getRequestListTotal(cri, editorId);
        List<RequestDetailDTO> list = editorService.getRequestList(cri, editorId);

        PageDTO pageDTO = new PageDTO();


        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(total);


        model.addAttribute("list", list);
        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("keyword", keyword);
        model.addAttribute("filter", filter);
        model.addAttribute("type", type);

        return "requestList";

    }

    @GetMapping("/request-view/{payment-id}")
    public String requestView(Model model
            , @PathVariable(name = "payment-id")
              Integer paymentId
    ) {

        User user = (User) session.getAttribute(Define.USER);

        int userId = user.getUserId();
        RequestViewDTO requestDTO = editorService
                                          .getRequestByPaymentId(paymentId);
        log.info("requestDTO {}",requestDTO);
        Integer editorId = requestDTO.getEditorId();
        int userIdByEditorId = editorService.getUserIdByEditorId(editorId);

        RequestResultDTO requestDetailResult = editorService.getRequestDetailResult(paymentId);



        model.addAttribute("requestDTO",requestDTO);
        model.addAttribute("detailDTO",requestDetailResult);


        return "requestView";

    }
}
