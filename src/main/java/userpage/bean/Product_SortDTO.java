package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Product_SortDTO {
	private int product_sort_num;
	private int product_number;
	private String product_size;
	private int product_stock;
	private double product_length;
	private double product_shoulder;
	private double product_chest;
	private double product_sleeve;
	private double product_waist_width;
	private double product_thigh_width;
	private double product_ankle_circumference;
	private double product_front_rise;
	private double product_cap_length;
	private double product_cap_circumference;
	private String product_detail;
}
