package file.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import file.bean.FileDTO;


@Mapper
public interface FileMapper {
	
	public void boardFileInsert(FileDTO fileDTO);
	
	public void boardFiledelete(String uuid);
	
	public void boardFiledeleteAll(int Board_Num);
	
	public List<FileDTO> findByBoardNum(int board_Num);

	public FileDTO findByBoardNumOne(int board_num);

}
