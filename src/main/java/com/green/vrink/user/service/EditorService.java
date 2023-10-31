package com.green.vrink.user.service;

import com.green.vrink.user.dto.*;
import com.green.vrink.util.Criteria;

import java.util.List;

public interface EditorService {
	Integer requestApproval(ApprovalDTO approvalDTO);
	Integer requestEditorWrite(EditorWriteDTO editorWriteDTO);
	EditorDTO responseEditorDeatil(Integer editorId);
	EditorDTO responseEditorEdit(Integer editorId);
	Integer requestEditorEdit(EditorDTO editorDTO);

    String getVrm(Integer editorId);
	List<EditorDTO> getList(Criteria cri);

	Integer getTotal();
	
	Integer requestEditorPrice(EditorPriceListDTO editorPriceListDTO);
	Integer findEditorId(Integer userId);
	Integer calculatePoint(CalculatePointDto calculatePointDto);
	Integer updatePoint(Integer userId, Integer point);
}
