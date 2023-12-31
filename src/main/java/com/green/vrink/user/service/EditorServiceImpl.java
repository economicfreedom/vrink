package com.green.vrink.user.service;

import com.green.vrink.user.dto.*;
import com.green.vrink.user.repository.interfaces.UserRepository;
import com.green.vrink.user.repository.model.Calculator;
import com.green.vrink.util.Criteria;
import com.green.vrink.util.Define;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class EditorServiceImpl implements EditorService {
    private final UserRepository userRepository;
    private final HttpSession session;


    @Transactional
    public Integer requestApproval(ApprovalDTO approvalDTO) {


        return userRepository.requestApproval(approvalDTO);
    }

    @Transactional
    public Integer requestEditorWrite(EditorWriteDTO editorWriteDTO) {
        return userRepository.editorWrite(editorWriteDTO);
    }

    @Transactional
    @Override
    public EditorDTO responseEditorDeatil(Integer editorId) {

        return userRepository.findByEditorId(editorId);
    }

    @Transactional
    @Override
    public EditorDTO responseEditorEdit(Integer editorId) {

        return userRepository.findByEditorId(editorId);
    }

    @Transactional
    @Override
    public Integer requestEditorEdit(EditorDTO editorDTO) {
        if (editorDTO.getTags() != null) {
            userRepository.deleteTagByEditorId(editorDTO.getEditorId());
            TagDTO tagDTO = new TagDTO();
            tagDTO.setEditorId(editorDTO.getEditorId());
            for (int i = 0; i < editorDTO.getTags().length; i++) {
                tagDTO.setTag(editorDTO.getTags()[i]);
                userRepository.insertTag(tagDTO);
            }

        }
        return userRepository.updateByEditorId(editorDTO);
    }

    @Transactional
    @Override
    public String getVrm(Integer editorId) {
        return userRepository.findVrmById(editorId);
    }

    @Transactional
    @Override
    public List<EditorDTO> getList(Criteria cri) {
        return userRepository.findEditorList(cri);
    }

    @Transactional
    @Override
    public Integer getTotal() {
        return userRepository.getTotal();
    }

    @Transactional
    @Override
    public Integer requestEditorPrice(EditorPriceListDTO editorPriceListDTO) {
        EditorPriceDTO priceDTO = new EditorPriceDTO();
        Integer editorId = (Integer) session.getAttribute(Define.EDITOR_ID);
        priceDTO.setEditorId(editorId);
        userRepository.deletePriceByEditorId(editorId);
        for (int i = 0; i < editorPriceListDTO.getOptions().length; i++) {
            String option = editorPriceListDTO.getOptions()[i];
            Integer price = editorPriceListDTO.getPrice()[i];
            priceDTO.setOptions(option);
            priceDTO.setPrice(price);
            userRepository.insertPrice(priceDTO);
        }
        return 1;
    }

    @Override
    public Integer requestEditorPriceEdit(EditorPriceListDTO editorPriceListDTO) {
        EditorPriceDTO priceDTO = new EditorPriceDTO();
        Integer editorId = (Integer) session.getAttribute(Define.EDITOR_ID);
        priceDTO.setEditorId(editorId);
        userRepository.deletePriceByEditorId(editorId);
        for (int i = 0; i < editorPriceListDTO.getOptions().length; i++) {
            String option = editorPriceListDTO.getOptions()[i];
            Integer price = editorPriceListDTO.getPrice()[i];
            priceDTO.setOptions(option);
            priceDTO.setPrice(price);
            userRepository.insertPrice(priceDTO);
        }
        return 1;
    }

    @Override
    public Integer findEditorId(Integer userId) {
        return userRepository.findEditorIdByUserId(userId);
    }

    @Override
    public Integer calculatePoint(CalculatePointDto calculatePointDto) {
        return userRepository.calculatePoint(calculatePointDto);
    }

    @Override
    public Integer updatePoint(Integer userId, Integer point) {
        return userRepository.updatePoint(userId, point);
    }

    @Override
    public Integer getUserIdByEditorId(Integer editorId) {
        return userRepository.findUserIdByEditorId(editorId);
    }

    @Override
    public String getNicknameByEditorId(Integer editorId) {
        Integer userId = userRepository.findUserIdByEditorId(editorId);

        return userRepository.findUserNicknameById(userId);
    }

    @Override
    public List<EditorPriceDTO> responsePrice(Integer editorId) {
        return userRepository.findPriceByEditorId(editorId);
    }

    @Override
    public Integer getEditorIdByUserId(Integer userId) {
        return userRepository.findEditorIdByUserId(userId);
    }

    @Override
    public List<RequestDetailDTO> getRequestList(Criteria cri, int editorId) {
        return userRepository.findRequestListByCriAndEditorId(cri, editorId);
    }

    @Override
    public int getRequestListTotal(Criteria cri, Integer editorId) {
        return userRepository.findRequestListTotalByCriAndEditorId(cri, editorId);
    }

    @Override
    public RequestViewDTO getRequestByPaymentId(Integer paymentId) {
        return userRepository.findRequestByPaymentId(paymentId);
    }

    @Override
    public List<RequestDetailDTO> getRequestDetailListById(Integer paymentId) {
        return null;
    }

    @Override
    public RequestResultDTO getRequestDetailResult(Integer paymentId) {
        List<RequestListDTO> requestListDTO = userRepository
                .findPaymentDetailByPaymentId(paymentId);
        RequestResultDTO requestResultDTO = new RequestResultDTO();
        requestResultDTO.setRequestListDTOS(requestListDTO);

        for (RequestListDTO requestDetailDTO : requestListDTO) {
            requestResultDTO.setSumPrice(requestDetailDTO.getPrice());
            requestResultDTO.setSumQuantity(requestDetailDTO.getQuantity());

        }


        return requestResultDTO;
    }

    @Override
    public String responseEditorTag(Integer editorId) {
        List<TagDTO> tag = userRepository.getTag(editorId);
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < tag.size(); i++) {
            TagDTO tagDTO = tag.get(i);
            tagDTO.getTag();

            if (tag.size() == (i+1)) {
            stringBuffer.append(tagDTO.getTag());
            }else {
            stringBuffer.append(tagDTO.getTag()).append(",");
            }

        }


        return stringBuffer.toString();
    }

    @Override
    public String responseRandomTag() {
        List<TagDTO> tag = userRepository.getRandomTag();
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < tag.size(); i++) {
            TagDTO tagDTO = tag.get(i);
            tagDTO.getTag();

            if (tag.size() == (i+1)) {
                stringBuffer.append(tagDTO.getTag());
            }else {
                stringBuffer.append(tagDTO.getTag()).append(",");
            }

        }
        return stringBuffer.toString();
    }

    @Override
    public Integer getTotal(Criteria criteria) {
        return userRepository.getTotalCount(criteria);
    }

    @Override
    public List<Calculator> getMyCalList(Criteria criteria) {
        return userRepository.getMyCalList(criteria);
    }
}
