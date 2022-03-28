package userpage.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MenuImgDTO {
	private String menu;
	private String stored_thumbnail;
}
