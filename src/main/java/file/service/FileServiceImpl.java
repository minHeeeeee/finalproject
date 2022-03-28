package file.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import file.bean.FileDTO;
import file.mapper.FileMapper;


@Service
public class FileServiceImpl implements FileService {
	
	@Autowired
	private FileMapper fileMapper;
	
	@Override
	public void boardFileInsert(FileDTO fileDTO) {
		fileMapper.boardFileInsert(fileDTO);
	}
	
	@Override
	public void boardFiledelete(String uuid) {
		fileMapper.boardFiledelete(uuid);
	}
	
	@Override
	public void boardFiledeleteAll(int Board_Num) {
		fileMapper.boardFiledeleteAll(Board_Num);
	}
	
	@Override
	public List<FileDTO> findByBoardNum(int board_Num) {
		return fileMapper.findByBoardNum(board_Num);
	}
}
