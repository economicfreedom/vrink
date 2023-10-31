package com.green.vrink.user.service;

import com.green.vrink.user.dto.*;
import com.green.vrink.util.Criteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.vrink.user.repository.interfaces.UserRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class EditorServiceImpl implements EditorService{
	private final UserRepository userRepository;



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
    	for (int i = 0; i < editorPriceListDTO.getOptions().size(); i++) {
            String option = editorPriceListDTO.getOptions().get(i);
            Integer price = editorPriceListDTO.getPrices().get(i);

            EditorPriceDTO priceDTO = new EditorPriceDTO();
            priceDTO.setEditorId(editorPriceListDTO.getEditorId());
            priceDTO.setOption(option);
            priceDTO.setPrice(price);

            userRepository.insertPrice(priceDTO);
        }
    	return 0;
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
}
