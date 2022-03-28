package board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import board.bean.ReplyDTO;
import board.service.ReplyService;



@RequestMapping("/reply")
@Controller
//@RestController
/* 왜 그런지는 모르겠으나 RestController로 해야 get.jsp의 showList바로 동작함 
 답 : write()에도 @ResponseBody붙이니 정상 작동
 write()시에도 ajax써서 그런것이 아닌가 생각함...
 
 */
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@PostMapping("/write")
	@ResponseBody
	public void write(ReplyDTO replyDTO) {
		
		System.out.println("/write : " + replyDTO);
		
		int insertCount = replyService.write(replyDTO);
		System.out.println("Reply INSERT COUNT: " + insertCount);
	}
	
	
	@PostMapping("/list")
	@ResponseBody
	public List<ReplyDTO> getList(int board_num) {
		System.out.println("/board_num : " + board_num);
		List<ReplyDTO> list = replyService.getList(board_num);
		return list;
	}
	
	/*
	@PostMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyDTO>> getList(int board_num) {
		System.out.println("/board_num : " + board_num);
		List<ReplyDTO> list = replyService.getList(board_num);
		return new ResponseEntity<List<ReplyDTO>>(list, HttpStatus.OK);
	}
	*/
	
	@PostMapping("/get")
	@ResponseBody
	public ReplyDTO get(int reply_num) {
		System.out.println("reply_num : " + reply_num);
		ReplyDTO replyDTO = replyService.get(reply_num);
		return replyDTO;
	}
	
	@PostMapping("/update")
	@ResponseBody
	public void update(ReplyDTO replyDTO) {
		System.out.println("/update : " + replyDTO);
		int updateCount = replyService.update(replyDTO);
		System.out.println("Reply update COUNT: " + updateCount);
	}
	
	
	@PostMapping("/delete")
	@ResponseBody
	public void delete(int reply_num) {
		System.out.println("delete ReplyNum : " + reply_num);
		int deleteCount = replyService.delete(reply_num);
		System.out.println("Reply delete COUNT: " + deleteCount);
	}
	
	
}
