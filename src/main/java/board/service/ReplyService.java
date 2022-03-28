package board.service;

import java.util.List;

import board.bean.ReplyDTO;


public interface ReplyService {
	
	
	public int write(ReplyDTO replyDTO);

	public List<ReplyDTO> getList(int board_num);

	public ReplyDTO get(int reply_num);

	public int update(ReplyDTO replyDTO);

	public int delete(int reply_num);




}
