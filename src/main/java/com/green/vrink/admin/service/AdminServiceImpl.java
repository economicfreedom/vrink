package com.green.vrink.admin.service;

import com.green.vrink.admin.dto.AdminApplyDto;
import com.green.vrink.admin.dto.CheatCheckDto;
import com.green.vrink.admin.dto.PagingDto;
import com.green.vrink.admin.repository.interfaces.AdminRepository;
import com.green.vrink.community.dto.FreeBoardDTO;
import com.green.vrink.user.repository.model.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminServiceImpl implements AdminService {

    private final AdminRepository adminRepository;

    @Override
    public List<AdminApplyDto> getAllAdminApplyList() {
        return adminRepository.getAllAdminApplyList();
    }

    @Override
    public List<AdminApplyDto> getAllAdminApplyListByType(String classification) {
        return adminRepository.getAllAdminApplyListByType(classification);
    }

    @Override
    public List<AdminApplyDto> getAllAdminApplyListByPaging(PagingDto paging) {
        return adminRepository.getAllAdminApplyListByPaging(paging);
    }

    @Override
    public List<AdminApplyDto> getAllAdminApplyListByTypePaging(PagingDto paging) {
        return adminRepository.getAllAdminApplyListByTypePaging(paging);
    }

    @Override
    public List<FreeBoardDTO> getAllFreeboardList() {
        return adminRepository.getAllFreeboardList();
    }

    @Override
    public List<FreeBoardDTO> getAllFreeboardListByPaging(PagingDto paging) {
        return adminRepository.getAllFreeboardListByPaging(paging);
    }

    @Override
    public List<User> getAllUser() {
        return adminRepository.getAllUser();
    }

    @Override
    public List<User> getAllUserByType(String classification) {
        return adminRepository.getAllUserByType(classification);
    }

    @Override
    public List<User> getAllUserPaging(PagingDto paging) {
        return adminRepository.getAllUserPaging(paging);
    }

    @Override
    public List<User> getAllUserByTypePaging(PagingDto paging) {
        return adminRepository.getAllUserByTypePaging(paging);
    }

    @Override
    public Integer userTotalCount() {
        return adminRepository.userTotalCount();
    }

    @Override
    public Integer userTotalCountClassification(PagingDto paging) {
        return adminRepository.userTotalCountClassification(paging);
    }

    @Override
    public FreeBoardDTO getFreeboardById(Integer id) {
        return adminRepository.getFreeboardById(id);
    }

    @Override
    public Integer countAllFreeboard() {
        return adminRepository.countAllFreeboard();
    }

    @Override
    public Integer countAllAdminApply() {
        return adminRepository.countAllAdminApply();
    }

    @Override
    public Integer countAdminApplyByType(PagingDto paging) {
        return adminRepository.countAdminApplyByType(paging);
    }

    @Transactional
    public void changeApply(Integer applyId, Integer accepted) {
        int result = adminRepository.changeApply(applyId, accepted);
//        if(result != 1) {
//            throw new CustomRestfulException("승인 상태 변경에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
    }

    @Transactional
    public void changeCheater(Integer applyId, String content) {
        int result = adminRepository.changeCheater(applyId, content);
//        if(result != 1) {
//            throw new CustomRestfulException("승인 상태 변경에 실패했습니다", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
    }

    public boolean getCheatCheckList(String number) throws IOException {

        log.info("중고나라 사기 계좌 조회 크롤링 서비스 실행");

        String cheatCheckURL = "https://web.joongna.com/fraud/result?inputValue=" +
                number +
                "&type=account_number";

        List<CheatCheckDto> cheatCheckList = new ArrayList<>();
        Document document = Jsoup.connect(cheatCheckURL).get();

        Elements contents = document.getElementsByClass("text-[14px] text-jngreen");

        for (Element content : contents) {
            CheatCheckDto cheatCheckDto = CheatCheckDto.builder()
                    .subject(content.text())		// 제목
                    .build();
            cheatCheckList.add(cheatCheckDto);
        }

        if(cheatCheckList.size() == 3) return false;
        else return true;
    }

}
