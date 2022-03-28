package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class ReplyDTO {
	private int reply_num;
	private int board_num;
	private String replyer;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date replyDate;
	private Date updateDate;
}
