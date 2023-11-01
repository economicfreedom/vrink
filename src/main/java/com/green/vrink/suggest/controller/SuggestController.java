package com.green.vrink.suggest.controller;

import com.green.vrink.suggest.repository.model.Suggest;
import com.green.vrink.suggest.service.SuggestServiceImpl;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.user.service.UserService;
import com.green.vrink.util.Define;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
            return "user/applyForm";
        }
        return "suggest/suggestWrite";
    }

    @GetMapping("/get/{suggestId}")
    public String getSuggest(@PathVariable int suggestId, Model model) {
        Suggest suggest = suggestService.getSuggest(suggestId);
        if (suggest == null) {
            return "user/applyForm";
        }
        String writerNickname = userRepository.findUserNicknameById(suggest.getUserId());

        model.addAttribute("writerNickname", writerNickname);
        model.addAttribute("suggest", suggest);

        return "suggest/suggestDetail";
    }
    @GetMapping("/patch/{suggestId}")
    public String patchSuggest(@PathVariable int suggestId, Model model) {
        User user = (User)session.getAttribute(Define.USER);
        Suggest suggest = suggestService.getSuggest(suggestId);

        if (user == null || suggest == null || user.getUserId() != suggest.getUserId()) {
            return "user/applyForm";
        }

        model.addAttribute("suggest", suggest);

        return "suggest/suggestPatch";
    }

}
