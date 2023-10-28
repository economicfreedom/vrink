package com.green.vrink.user.service;

import com.green.vrink.user.dto.ApprovalDTO;
import com.green.vrink.user.dto.EditorWriteDTO;

public interface EditorService {
	Integer requestApproval(ApprovalDTO approvalDTO);
	Integer requestEditorWrite(EditorWriteDTO editorWriteDTO);
	
}
