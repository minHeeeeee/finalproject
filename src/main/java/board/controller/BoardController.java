package board.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.bean.BoardDTO;
import board.bean.Criteria;
import board.bean.PageDTO;
import board.service.BoardService;
import file.bean.FileDTO;



@Controller
@RequestMapping(value = "/board", method = {RequestMethod.GET, RequestMethod.POST})
public class BoardController {
	
	@Autowired
	private BoardService boardService; 
	
		
	//리스트 조회 및 출력
	@GetMapping("/list")
	public String list(@RequestParam Map<String, String> map, Model model) {
		
		String board_category_num = map.get("board_category_num");
		if (Integer.parseInt(board_category_num) == 7) {
			System.out.println("nav.jsp : " + map);
			System.out.println(boardService);
			List<BoardDTO> list = boardService.getPostList(Integer.parseInt(board_category_num));
			model.addAttribute("board_category_num", board_category_num);
			
			for (BoardDTO boardDTO : list) {
				System.out.println("boardDTO : " + boardDTO);
				boardDTO.setFileList(boardService.getFileList(boardDTO.getBoard_num()));
			}
			
			model.addAttribute("list", list);
			model.addAttribute("display", "/WEB-INF/board/post.jsp");
			return "index";
		
		} else {
			System.out.println("nav.jsp : " + map);
			if(map.get("pageNum")==null) {
				map.put("pageNum", "1");
			}
			if(map.get("amount")==null) {
				map.put("amount", "10");
			}
			String pageNum = map.get("pageNum");
			String amount = map.get("amount");
			
			Criteria criteria = new Criteria(Integer.parseInt(pageNum), Integer.parseInt(amount));
			
			List<BoardDTO> list = boardService.getListWithPaging(map);
			int total = boardService.getTotalCount(board_category_num);
			model.addAttribute("pageDTO", new PageDTO(criteria, total));
			model.addAttribute("board_category_num", board_category_num);
			model.addAttribute("list", list);
			
			model.addAttribute("display", "/WEB-INF/board/list.jsp");
			return "index";
		}
	}
	
	
	
	
	
	//원글작성
	@PostMapping("/writeForm")
	public String writeForm(@RequestParam Map<String, String> map, Model model) {
		model.addAttribute("map", map);
		return "/board/write";
	}
	
	@PostMapping("/write")
	public String write(@RequestParam Map<String, String> map, 
						@ModelAttribute BoardDTO boardDTO, 
						RedirectAttributes redirectAttributes) {
		
		System.out.println("map : " + map);
		
		boardDTO.setPwd("11");
		System.out.println("boardDTO : " + boardDTO);
		
		int board_category_num = Integer.parseInt(map.get("board_category_num")); 
		
		if (board_category_num == 7) {
			List<FileDTO> list = boardDTO.getFileList();
			System.out.println("fileDTO list : " + list);
			
			boardService.write(boardDTO);
			redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
			return "redirect:/board/list";
		}
		
		boardService.writeSelectKey(boardDTO);
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", "1");
		redirectAttributes.addAttribute("amount", map.get("amount"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		
		redirectAttributes.addAttribute("display", "/WEB-INF/board/list.jsp");
		return "redirect:/board/list.jsp";
		//return "index";
	}
	
	//게시물 조회
	//board_category_num, board_num, pageNum, amount넘겨받음. 
	@PostMapping("/get")
	public String get(@RequestParam Map<String, String> map, Model model) {
		
		System.out.println("get map : " + map);
		int board_category_num = Integer.parseInt(map.get("board_category_num"));
		int board_num = Integer.parseInt(map.get("board_num")) ;
		
		if (board_category_num == 7) {
			BoardDTO boardDTO = boardService.get(board_num);
			List<FileDTO> list = boardService.getFileList(board_num);
			boardDTO.setFileList(list);
			model.addAttribute("map", map);
			model.addAttribute("boardDTO", boardDTO);
			
			model.addAttribute("display", "/WEB-INF/board/single.jsp");
			return "index";
		}
		
		
		BoardDTO boardDTO = boardService.get(board_num);
		model.addAttribute("map", map);
		model.addAttribute("boardDTO", boardDTO);
		
		model.addAttribute("display", "/WEB-INF/board/get.jsp");
		return "index";
		
		//return "/board/get";
	}
	
	
	
	
	//글 수정 페이지로 이동
	@PostMapping("/modifyForm")
	public String modifyForm(@RequestParam Map<String, String> map, Model model) {
		int board_category_num = Integer.parseInt(map.get("board_category_num"));
		BoardDTO boardDTO = boardService.get(Integer.parseInt(map.get("board_num")));
		if (board_category_num == 7) {
			boardDTO.setFileList(boardService.getFileList(boardDTO.getBoard_num()));
		}
		System.out.println("boardDTOpost : " + boardDTO);
		System.out.println("modifyForm map : " + map); 
		model.addAttribute("map", map);
		model.addAttribute("boardDTO", boardDTO);
		
		model.addAttribute("display", "/WEB-INF/board/modify.jsp");
		return "index";
		
		//return "/board/modify";
	}
	
	//글 수정
	@PostMapping("/modify")
	public String modify(@RequestParam Map<String, String> map, 
			@ModelAttribute BoardDTO boardDTO, 
			RedirectAttributes redirectAttributes) {
		System.out.println("여긴가?");
		boardService.modify(boardDTO);
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", map.get("pageNum"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		
		redirectAttributes.addAttribute("display", "/WEB-INF/board/list.jsp");
		return "redirect:/board/list.jsp";
		//return "index";
	}
	
	//답글 작성 페이지로 이동
	@PostMapping("/replyWriteForm")
	public String replyWriteForm(@RequestParam Map<String, String> map, Model model) {
		BoardDTO boardDTO = boardService.get(Integer.parseInt(map.get("board_num")));
		model.addAttribute("map", map);
		model.addAttribute("boardDTO", boardDTO);
		
		model.addAttribute("display", "/WEB-INF/board/reply.jsp");
		return "index";
	}
	
	@PostMapping("/boardReplyWrite")
	public String boardReplyWrite(@RequestParam Map<String, String> map, 
								  @ModelAttribute BoardDTO boardDTO,
								  RedirectAttributes redirectAttributes) {
		
		boardDTO.setParant_num(boardDTO.getBoard_num());
		System.out.println(boardDTO);
		boardDTO.setPwd("11");
		System.out.println("boardDTO : " + boardDTO);
		boardService.boardReplyWrite(boardDTO);
		
		//댓글 작성후 1페이지 이동
		//redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		//redirectAttributes.addAttribute("pageNum", 1);
		//redirectAttributes.addAttribute("amount", 10);
		
		//댓글 작성후 원글이 있는 페이지로 이동
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", map.get("pageNum"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		
		redirectAttributes.addAttribute("display", "/WEB-INF/board/list.jsp");
		return "redirect:/board/list.jsp";
		//return "index";
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam Map<String, String> map, 
			//@ModelAttribute BoardDTO boardDTO, 
			RedirectAttributes redirectAttributes) {
		System.out.println(map);
		System.out.println("DeleteboardNum : " + map.get("board_num"));
		int board_num = Integer.parseInt(map.get("board_num")) ;
		List<FileDTO> fileList = boardService.getFileList(board_num);
		if (fileList != null) {
			System.out.println("fileList : " + fileList);
			deleteFiles(fileList);
		}
		
		boardService.delete(board_num);
		
		redirectAttributes.addAttribute("board_category_num", map.get("board_category_num"));
		redirectAttributes.addAttribute("pageNum", map.get("pageNum"));
		redirectAttributes.addAttribute("amount", map.get("amount"));
		redirectAttributes.addAttribute("display", "/WEB-INF/board/list.jsp");
		//return "index";
		return "redirect:/board/list.jsp";
	}
	
	
	//게시물의 첨부파일 불러옴
	@PostMapping("/getFileList")
	@ResponseBody
	public List<FileDTO> getFileList(int board_num) {
		System.out.println("getFileList...........");
		return boardService.getFileList(board_num);
	}
	
	//게시물 삭제시 첨부파일 삭제
	
	public void deleteFiles(List<FileDTO> fileList) {
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		System.out.println("delete files.....");
		System.out.println("fileList : " + fileList);
		fileList.forEach(t -> {
			try {
				Path file = Paths.get("C:\\thec\\" + t.getUploadPath() + "\\" + t.getUuid() + "_" + t.getFileName());
				Files.deleteIfExists(file);
			} catch (IOException e) {
				System.out.println("delete file error " + e.getMessage());
			}
			
		});
	}
	
	@PostMapping(value = "/getReview")
	@ResponseBody
	public List<BoardDTO> getReview(@RequestParam int product_number){
		System.out.println(product_number);
		System.out.println();
		return boardService.getReview(product_number);
	}
	@PostMapping(value = "/getNewPost")
	@ResponseBody
	public Map<String,Object> getNewPost(){
		Map<String,Object> map=new HashMap<String,Object>();
		BoardDTO boardDTO = boardService.getNewPost(7);
		FileDTO fileDTO=boardService.getFile(boardDTO.getBoard_num());
		map.put("boardDTO", boardDTO);
		map.put("fileDTO", fileDTO);
		return map;
	}
	
}
