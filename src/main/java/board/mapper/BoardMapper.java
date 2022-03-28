package board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import board.bean.BoardDTO;


@Mapper
public interface BoardMapper {
	public List<BoardDTO> getBoardList(int board_category_num);
	
	public List<BoardDTO> getListWithPaging(Map<String, String> map);

	public void write(BoardDTO boardDTO);

	public BoardDTO get(int board_num);

	public void boardReplyWrite(BoardDTO boardDTO);

	public int getTotalCount(String board_category_num);

	public void modify(BoardDTO boardDTO);

	public void delete(int board_num);

	public int getMaxBoardNumber();

	public void writeSelectKey(BoardDTO boardDTO);

	public List<BoardDTO> getPostList(int board_category_num);

	public List<BoardDTO> getReview(int product_number);

	public BoardDTO getNewPost(int board_category_num);
	
	
}
