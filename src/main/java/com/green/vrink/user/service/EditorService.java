package com.green.vrink.user.service;

import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.EditorDTO;
import com.green.vrink.user.dto.EditorWriteDTO;
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
}
