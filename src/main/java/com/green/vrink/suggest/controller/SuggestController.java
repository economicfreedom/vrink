package com.green.vrink.suggest.controller;

import com.green.vrink.notice.dto.NoticeDto;
import com.green.vrink.notice.service.NoticeService;
import com.green.vrink.suggest.dto.GetSuggestDto;
import com.green.vrink.suggest.dto.SuggestReplyDto;
import com.green.vrink.suggest.service.SuggestService;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/suggest")
@RequiredArgsConstructor
public class SuggestController {

    private final HttpSession session;
    private final UserRepository userRepository;
    private final SuggestService suggestService;
    private final NoticeService noticeService;

    @GetMapping("/post")
    public String postSuggest() {
        User user = (User) session.getAttribute(Define.USER);
        if (user == null) {
            return "main";
        }
        return "suggest/suggestWrite";
    }

    @GetMapping("/get/{suggestId}")
    public String getSuggest(@PathVariable int suggestId, Model model) {
        GetSuggestDto suggest = suggestService.getSuggest(suggestId);
        if (suggest == null) {
            return "main";
        }

        Criteria cri = new Criteria();
        Integer replyCount = suggestService.getReplyCount(suggestId);
        cri.setPageNum(1);
        cri.setCountPerPage(5);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(replyCount);

        List<SuggestReplyDto> replyList = suggestService.getSuggestReplyList(suggestId, cri);


        boolean next = pageDTO.getEndPage() > 1;


        model.addAttribute("suggest", suggest);
        model.addAttribute("suggestReply", replyList);
        model.addAttribute("next", next);
        model.addAttribute("replyCount", replyCount);

        return "suggest/suggestDetail";
    }

    @GetMapping("/patch/{suggestId}")
    public String patchSuggest(@PathVariable int suggestId, Model model) {
        User user = (User) session.getAttribute(Define.USER);
        GetSuggestDto suggest = suggestService.getSuggest(suggestId);

        if (user == null || suggest == null || user.getUserId() != suggest.getUserId()) {
            return "main";
        }

        model.addAttribute("suggest", suggest);

        return "suggest/suggestPatch";
    }

    @GetMapping("/list")
    public String getSuggestList(@RequestParam(name = "page-num", defaultValue = "1") Integer pageNum
            , @RequestParam(name = "keyword", defaultValue = "") String keyword
            , @RequestParam(name = "type", defaultValue = "") String type
            , Model model) {
        Criteria criteria = new Criteria();
        criteria.setType(type);
        criteria.setKeyword(keyword);
        criteria.setCountPerPage(10);
        criteria.setPageNum(pageNum);

        Integer total = suggestService.getTotal(criteria);
        List<GetSuggestDto> suggestList = suggestService.getSuggestList(criteria);
        if (pageNum.intValue() == 1) {
            List<NoticeDto> noticeList = noticeService.noticeList("suggest");
            model.addAttribute("noticeList", noticeList);

        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(criteria);
        pageDTO.setArticleTotalCount(total);

        model.addAttribute("pageDTO", pageDTO);
        model.addAttribute("suggestList", suggestList);
        model.addAttribute("total", total);

        return "suggest/suggestList";
    }


}
