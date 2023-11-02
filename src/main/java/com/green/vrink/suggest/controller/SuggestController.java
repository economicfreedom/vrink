package com.green.vrink.suggest.controller;

import com.green.vrink.suggest.dto.SuggestReplyDto;
import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.repository.model.SuggestReply;
import com.green.vrink.suggest.service.SuggestServiceImpl;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import com.green.vrink.util.PageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/suggest")
@RequiredArgsConstructor
public class SuggestController {

    private final HttpSession session;
    private final UserRepository userRepository;
    private final SuggestServiceImpl suggestService;
    @GetMapping("/post")
    public String postSuggest() {
        User user = (User)session.getAttribute(Define.USER);
        if (user == null) {
            return "main";
        }
        return "suggest/suggestWrite";
    }

    @GetMapping("/get/{suggestId}")
    public String getSuggest(@PathVariable int suggestId, Model model) {
        Suggest suggest = suggestService.getSuggest(suggestId);
        if (suggest == null) {
            return "main";
        }

        Criteria cri = new Criteria();
        Integer replyCount = suggestService.getReplyCount(suggestId);
        cri.setPageNum(1);
        cri.setCountPerPage(7);

        PageDTO pageDTO = new PageDTO();
        pageDTO.setCri(cri);
        pageDTO.setArticleTotalCount(replyCount);

        List<SuggestReplyDto> replyList = suggestService.getSuggestReplyList(suggestId, cri);

        boolean next = pageDTO.getEndPage() > 1;

        model.addAttribute("suggest", suggest);
        model.addAttribute("suggestReply", replyList);
        model.addAttribute("next",next);
        model.addAttribute("replyCount", replyCount);

        return "suggest/suggestDetail";
    }
    @GetMapping("/patch/{suggestId}")
    public String patchSuggest(@PathVariable int suggestId, Model model) {
        User user = (User)session.getAttribute(Define.USER);
        Suggest suggest = suggestService.getSuggest(suggestId);

        if (user == null || suggest == null || user.getUserId() != suggest.getUserId()) {
            return "main";
        }

        model.addAttribute("suggest", suggest);

        return "suggest/suggestPatch";
    }

}
