package file.service;

import java.util.List;

import file.bean.FileDTO;


public interface FileService {
	public void boardFileInsert(FileDTO fileDTO);
	
	public void boardFiledelete(String uuid);
	
	public void boardFiledeleteAll(int Board_Num);
	
	public List<FileDTO> findByBoardNum(int Board_Num);
}
