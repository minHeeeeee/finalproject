package board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.ReplyDTO;
import board.mapper.ReplyMapper;



@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int write(ReplyDTO replyDTO) {
		
		return replyMapper.write(replyDTO);
	}
	
	@Override
	public List<ReplyDTO> getList(int board_num) {
		return replyMapper.getList(board_num);
	}
	
	@Override
	public ReplyDTO get(int reply_num) {
		return replyMapper.get(reply_num);
	}
	
	@Override
	public int update(ReplyDTO replyDTO) {
		
		return replyMapper.update(replyDTO);
	}
	
	@Override
	public int delete(int reply_num) {
		return replyMapper.delete(reply_num);
	}
}
