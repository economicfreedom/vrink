package com.green.vrink.user.service;

import com.green.vrink.util.Criteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.dto.EditorWriteDTO;
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
    
    @Override
    public EditorDTO responseEditorDeatil(Integer editorId) {
    	
    	return userRepository.findByEditorId(editorId);
    }
    
    @Override
    public EditorDTO responseEditorEdit(Integer editorId) {
    	
    	return userRepository.findByEditorId(editorId);
    }
    
    @Override
    public Integer requestEditorEdit(EditorDTO editorDTO) {
    	
    	return userRepository.updateByEditorId(editorDTO);
    }

    @Override
    public String getVrm(Integer editorId) {
        return userRepository.findVrmById(editorId);
    }

    @Override
    public List<EditorDTO> getList(Criteria cri) {
        return userRepository.findEditorList(cri);
    }
}
