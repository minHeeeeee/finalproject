package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ListDTO {
	private int product_number;
	private String product_name;
	private int product_price;
	private String stored_thumbnail;
}
