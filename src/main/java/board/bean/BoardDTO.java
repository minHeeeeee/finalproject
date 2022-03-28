package board.bean;

import java.util.Date;
import java.util.List;

import file.bean.FileDTO;
import lombok.Data;


@Data
public class BoardDTO {
	private int board_num;
	private String user_name;
	private String name;
	private String user_id;
	private String subject;
	private String content;
	private int group_num; //글의 그룹
	private int layer; //댓글 계층
	private int orders; // 레벨당 순서
	private int parant_num; // 부모글 번호. 이것이 있어야 계속 댓글 달때 어느 게시물에 대한 댓글인지 식별가능
	private int hit; //조회수
	private Date regDate;
	private Date updateDate;
	private Date logtime;
	private int board_category_num;
	private int reply;
	private String pwd;
	private int product_number;
	
	private List<FileDTO> fileList;
}
