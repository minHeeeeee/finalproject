package adminpage.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import userpage.bean.AddressDTO;
import userpage.bean.CartListDTO;
import userpage.bean.MenuImgDTO;
import userpage.bean.ProductDTO;
import userpage.bean.User_InfoDTO;
import userpage.service.UserPageService;

@RestController
@RequestMapping(value = "/admin")
public class AdminPageController {
	
}
