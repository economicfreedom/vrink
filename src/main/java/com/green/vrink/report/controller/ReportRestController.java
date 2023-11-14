package com.green.vrink.report.controller;

import com.green.vrink.report.dto.ReportDTO;
import com.green.vrink.report.service.ReportService;
import com.green.vrink.user.repository.model.User;
import com.green.vrink.util.Check;
import com.green.vrink.util.Define;
import com.green.vrink.util.LoginCheck;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static com.green.vrink.util.Check.isNull;

@RequestMapping("/report")
@RestController
@RequiredArgsConstructor
@Slf4j
public class ReportRestController {


    private final ReportService reportService;
    private final HttpSession httpSession;

    @PostMapping("/report-board")
    public ResponseEntity<?> reportBoard(@Valid @RequestBody ReportDTO reportDTO, BindingResult bindingResult) {
        log.info("report dto {}", reportDTO);

        CustomMessage customMessage = null;
        User user = (User) httpSession.getAttribute(Define.USER);

        if (user == null) {
            customMessage = new CustomMessage(
                    "로그인후 이용 가능합니다."
                    , (short) 400);
            return ResponseEntity.badRequest().body(customMessage);
        }

        if (bindingResult.hasErrors()) {
            String defaultMessage = bindingResult.getFieldError().getDefaultMessage();
            customMessage = new CustomMessage(
                    defaultMessage
                    , (short) 400);
            return ResponseEntity.badRequest().body(customMessage);
        }


        Integer checkRes = reportService.checkReport(reportDTO);

        if (!isNull(checkRes)) {
            customMessage = new CustomMessage(
                    "이미 신고하신 글 입니다."
                    , (short) 400);
            return ResponseEntity.badRequest().body(customMessage);
        }


        Integer res = reportService.saveReportBoard(reportDTO);
        if (res == 1) {
            customMessage = new CustomMessage(
                    "정상적으로 신고 되었습니다."
                    , (short) 200);

            return ResponseEntity.ok(customMessage);
        } else {

            customMessage = new CustomMessage(
                    "신고에 실패하였습니다. 문의 게시판을 이용해주세요"
                    , (short) 400);
            return ResponseEntity.badRequest().body(customMessage);
        }


    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    private static class CustomMessage {
        private String message;
        private Short code;


    }
}
