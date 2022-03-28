package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class AddressDTO {
	
private int addr_number;	
private String user_id;
private int zipcode;
private String addr1;
private String addr2;
private String addr_name;
private String user_name;
private int phone;



}
