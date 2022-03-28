package board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;
import board.mapper.BoardMapper;
import file.bean.FileDTO;
import file.mapper.FileMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	
	@Override
	public List<BoardDTO> getBoardList(int board_category_num) {
		
		return boardMapper.getBoardList(board_category_num);
	}
	
	
	@Override
	public List<BoardDTO> getPostList(int board_category_num) {
		return boardMapper.getPostList(board_category_num);
	}
	
	@Override
	public List<BoardDTO> getListWithPaging(Map<String, String> map) {
		List<BoardDTO> list = boardMapper.getListWithPaging(map);
		return list;
	}
	
	
	@Override
	public void write(BoardDTO boardDTO) {
		if (boardDTO.getFileList() == null || boardDTO.getFileList().size() <= 0) {
			return;
		}
		boardMapper.writeSelectKey(boardDTO);
		
		boardDTO.getFileList().forEach(t -> {
			t.setBoard_Num(boardDTO.getBoard_num());
			System.out.println("fileDTO : " + t);
			fileMapper.boardFileInsert(t);
		});
	}
	
	@Override
	@Transactional
	public void modify(BoardDTO boardDTO) {
		fileMapper.boardFiledeleteAll(boardDTO.getBoard_num());
		boardMapper.modify(boardDTO);
		
		if (boardDTO.getFileList() != null) {
			
			boardDTO.getFileList().forEach(t -> {
				t.setBoard_Num(boardDTO.getBoard_num());
				System.out.println("fileDTO : " + t);
				fileMapper.boardFileInsert(t);
			});
		}
		
		
		
	}
	
	@Override
	public BoardDTO get(int board_num) {
		BoardDTO boardDTO = boardMapper.get(board_num);
		return boardDTO;
	}
	
	@Override
	public void boardReplyWrite(BoardDTO boardDTO) {
		//원글
		System.out.println(boardDTO);
		boardMapper.boardReplyWrite(boardDTO);
	}
	
	@Override
	public int getTotalCount(String board_category_num) {
		return boardMapper.getTotalCount(board_category_num);
	}
	
	
	
	@Override
	public void delete(int board_num) {
		fileMapper.boardFiledeleteAll(board_num);
		boardMapper.delete(board_num);
	}
	
	
	
	@Override
	public void writeSelectKey(BoardDTO boardDTO) {
		boardMapper.writeSelectKey(boardDTO);
	}
	
	@Override
	public List<FileDTO> getFileList(int board_num) {
		return fileMapper.findByBoardNum(board_num);
	}
	@Override
	public List<BoardDTO> getReview(int product_number) {
		return boardMapper.getReview(product_number);
	}


	@Override
	public BoardDTO getNewPost(int board_category_num) {
		return boardMapper.getNewPost(board_category_num);
	}
	@Override
	public FileDTO getFile(int board_num) {
		return fileMapper.findByBoardNumOne(board_num);
	}
}
