package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CartListDTO {
	private String user_id;
	private int cart_number;
	private int product_number;
	private int product_count;
	private int product_sort_number;
	private String product_size;
	
	private int num;
	private String product_name;
	private int product_price;
	private String stored_thumbnail;
	
	private String cartUserId = user_id;
	private int cartProductNumber = product_number;
	private int productCount = product_count;
	
	
}
