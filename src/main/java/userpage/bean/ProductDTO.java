package userpage.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ProductDTO {
	private int product_number;
	private String product_name;
	private int product_price;
	private String product_descrip;
	private Date product_date;
	private int sale;
}
