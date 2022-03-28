package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Product_ImageFileDTO {
	private int file_number;
	private String origin_file_name;
	private String stored_file_name;
	private String stored_thumbnail;
	private int product_number;
}
