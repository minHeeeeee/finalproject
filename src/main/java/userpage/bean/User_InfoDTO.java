package userpage.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class User_InfoDTO {
	private String user_id;
	private int rank_num;
	private String user_pwd;
	private String name;
	private int zipcode;
	private String addr1;
	private String addr2;
	private int tel;
	private int phone;
	private String email;
	private String email_check;
	private Date user_insertdate;
	private int mileage;
}
