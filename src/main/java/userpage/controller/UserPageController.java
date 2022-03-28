package userpage.controller;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import userpage.bean.AddressDTO;
import userpage.bean.CartListDTO;
import userpage.bean.MenuImgDTO;
import userpage.bean.ProductDTO;
import userpage.bean.User_InfoDTO;
import userpage.service.UserPageService;

@Controller
public class UserPageController {
	@Autowired
	private UserPageService userPageService;
	@Autowired
	private HttpServletRequest httpServletRequest;

	@GetMapping(value="/index")
	public String index () {
		return "index";
	}
	
	@GetMapping(value = "login")
	public String login() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/login.jsp");
		return "index";
	}
	
	@PostMapping(value = "loginOk")
	@ResponseBody
	public String loginOk(HttpSession httpSession, @RequestParam Map<String, String> map) {
		
		return userPageService.loginOk(httpSession,map);
	}
	
	@PostMapping(value="logout")
	public String logout(HttpSession httpSession) {
	 userPageService.logout(httpSession);
	 return "index";
	}
	
	@GetMapping(value="join")
	public String write() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/join.jsp");
		return "index";
	}
	@PostMapping(value = "/joinOk")
	@ResponseBody
	public void joinOk(@ModelAttribute User_InfoDTO user_infoDTO, @RequestParam Map<String, Integer> map) {
		String tel1 = map.get("tel1") + "";// 02
		String tel2 = map.get("tel2") + "";// 123
		String tel3 = map.get("tel3") + "";// 1234

		int tel = Integer.parseInt(tel1 + tel2 + tel3);

		user_infoDTO.setTel(tel);

		String phone1 = map.get("phone1") + "";// 02
		String phone2 = map.get("phone2") + "";// 123
		String phone3 = map.get("phone3") + "";// 1234

		int phone = Integer.parseInt(phone1 + phone2 + phone3);

		user_infoDTO.setPhone(phone);

		user_infoDTO.setMileage(2000);
		userPageService.joinOk(user_infoDTO);
	}
	
	@PostMapping(value="/checkId")
	@ResponseBody
	public String checkId(@RequestParam String id) {
		System.out.println(id);
		return userPageService.checkId(id);
	}
	@GetMapping(value="account")
	public String account() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/account.jsp");
		return "index";
	}
	
	@GetMapping(value = "edit")
	public String edit(HttpSession session) {
		
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/edit.jsp");
		return "index";
	}

	@PostMapping(value = "editOk")
	@ResponseBody
	public void editOk(HttpSession httpSession,@ModelAttribute User_InfoDTO user_infoDTO,@RequestParam Map<String, String> map) {
		String tel1 = map.get("tel1") + "";// 02
		String tel2 = map.get("tel2") + "";// 123
		String tel3 = map.get("tel3") + "";// 1234

		int tel = Integer.parseInt(tel1 + tel2 + tel3);

		user_infoDTO.setTel(tel);

		String phone1 = map.get("phone1") + "";// 02
		String phone2 = map.get("phone2") + "";// 123
		String phone3 = map.get("phone3") + "";// 1234

		int phone = Integer.parseInt(phone1 + phone2 + phone3);

		user_infoDTO.setPhone(phone);

		userPageService.editOk(httpSession,user_infoDTO);
	}
	
	@PostMapping(value = "deleteOk")
	@ResponseBody
	public void deleteOk(HttpSession httpSession,@ModelAttribute User_InfoDTO user_infoDTO) {
		userPageService.deleteOk(httpSession,user_infoDTO);
	}
	@GetMapping(value="findId")
	public String findId() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/findId.jsp");
		return "index";
	}
	@GetMapping(value="findPwd")
	public String findPwd() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/findPwd.jsp");
		return "index";
	}
	@GetMapping(value="findIdResult")
	public String findIdResult() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/findIdResult.jsp");
		return "index";
	}
	@GetMapping(value="findPwdResult")
	public String findPwdResult() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/findPwdResult.jsp");
		return "index";
	}
	@PostMapping(value="findIdEmail")
	@ResponseBody
	public String findidEmail(HttpSession httpSession,@RequestParam Map<String, String> map) {
		//System.out.println(map);
		return userPageService.findIdEmail(httpSession,map);
		
	}
	
	@PostMapping(value="findIdPhone")
	@ResponseBody
	public String findidPhone(HttpSession httpSession,@RequestParam Map<String, String> map) {
		//System.out.println(map);
		return userPageService.findIdPhone(httpSession,map);
		
	}
	@PostMapping(value="findPwdEmail")
	@ResponseBody
	public String findPwd(HttpSession httpSession,@RequestParam Map<String,String>map) {
		//System.out.println(map);
		return userPageService.findPwdEmail(httpSession,map);
		
	}
	

	@PostMapping(value="findPwdPhone")
	@ResponseBody
	public String findPwdPhone(HttpSession httpSession,@RequestParam Map<String,String>map) {
		//System.out.println(map);
		return userPageService.findPwdPhone(httpSession,map);
		
	}
	@PostMapping(value = "temppwd")
	@ResponseBody
	public void temppwd(HttpServletResponse response, @RequestParam Map<String,String>map) throws Exception {
		System.out.println(map);
		userPageService.temppwd(response,map);
	}
	@PostMapping(value = "temppwd2")
	@ResponseBody
	public void temppwd2(HttpServletResponse response, @RequestParam Map<String,String>map) throws Exception {
		userPageService.temppwd2(map);
	}
	@GetMapping(value="tempalert")
	public String tempalert() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/templert.jsp");
		return "index";
	}
	@GetMapping(value="addresses")
	public String addresses() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/address.jsp");
		return "index";
	}
	@PostMapping(value = "getAddresses")
	@ResponseBody
	public List<AddressDTO> getAddresses(@RequestParam String user_id) {

		return userPageService.getAddresses(user_id);
	}
	@GetMapping(value="addressNew")
	public String addressNew() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/addressNew.jsp");
		return "index";
	}
	@PostMapping(value = "addNew")
	@ResponseBody
	public void addNew(@RequestParam Map<String, String> map) {
		map.put("phone", map.get("phone1") + map.get("phone2") + map.get("phone3"));
		//System.out.println("map : " + map);
		userPageService.addNew(map);

	}
	@GetMapping(value="addressEdit")
	public String addressEdit() {
		httpServletRequest.setAttribute("display", "/WEB-INF/userpage/addressEdit.jsp");
		return "index";
	}
	@PostMapping(value = "addEdit")
	@ResponseBody
	public void addEdit(@RequestParam Map<String, String> map,@ModelAttribute AddressDTO addressDTO) {
		map.put("phone", map.get("phone1") + map.get("phone2") + map.get("phone3"));
		addressDTO.setPhone(Integer.parseInt(map.get("phone")));
		//System.out.println(addressDTO);
		userPageService.addEdit(addressDTO);
	}
	@PostMapping(value= "getEdit")
	@ResponseBody
	public AddressDTO getEdit(@RequestParam String addr_number) {
		return userPageService.getEdit(addr_number);
	}
	@PostMapping(value = "delEdit")
	@ResponseBody
	public void delEdit(@RequestParam String[] checkbox) {
		for(String addr_number:checkbox) {
		userPageService.delEdit(addr_number);
		}
	}
	
	@PostMapping(value = "/kakaoLogin")
	@ResponseBody
	public void kakaoLogin(HttpSession httpSession,@RequestParam String email,@RequestParam String kakaoId,@RequestParam String name) {
		
		userPageService.kakaoLogin(httpSession,email,kakaoId,name);
		
	}
	@PostMapping(value = "getMainImg")
	@ResponseBody
	public List<MenuImgDTO> getMainImg(){
		return userPageService.getMainImg();
	}
	@PostMapping(value = "getNavImg")
	@ResponseBody
	public List<MenuImgDTO> getNavImg(){
		return userPageService.getNavImg();
	}
	//------------------------------------------------------------------------------------------------
	@GetMapping(value = "brands")
	public String brands() {
		httpServletRequest.setAttribute("display", "/WEB-INF/productpage/brands.jsp");
		return "index";
	}
	
	@GetMapping(value = "list")
	public String list(@RequestParam(required=false, defaultValue = "1")String pg,@RequestParam String category) {
		httpServletRequest.setAttribute("display", "/WEB-INF/productpage/list.jsp");
		httpServletRequest.setAttribute("pg", pg);
		return "index";
	}
	
	@GetMapping(value = "detail")
	public String detail(@RequestParam String seq) {
		httpServletRequest.setAttribute("display", "/WEB-INF/productpage/detail.jsp");
		httpServletRequest.setAttribute("seq", seq);
		return "index";
	}
	
	@PostMapping(value = "getList")
	@ResponseBody
	public Map<String,Object> getList(@RequestParam String category,@RequestParam(required=false, defaultValue = "1") String pg) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("category", category.split("&")[0]);
		map.put("pg", pg);
		System.out.println(map);
		return userPageService.getList(map);
	}
	
	@PostMapping(value = "getDetail")
	@ResponseBody
	public Map<String,Object> getDetail(@RequestParam String product_number) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("imgs", userPageService.getDetailImg(product_number));
		map.put("productDTO", userPageService.getProduct(product_number));
		map.put("sizes", userPageService.getSizes(product_number));
		System.out.println(map);
		return map;
	}
	@PostMapping(value = "getSearchList")
	@ResponseBody
	public Map<String, Object> getSearchList(@RequestParam String product_name, 
			@RequestParam(required = false, defaultValue = "1") String pg) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("product_name", product_name);
		map.put("pg", pg);
		return userPageService.getSearchList(map);
	}
	
	@PostMapping(value = "searchList")
	public String searchList(@RequestParam String product_name) {
		httpServletRequest.setAttribute("product_name", product_name); //Session 대신에 Requset, Request는 페이지에 뿌리고 데이터가 없어짐.
		httpServletRequest.setAttribute("display", "/WEB-INF/productpage/searchList.jsp");
		return "index";
	}
	@GetMapping(value = "cart")
	public String cart(HttpSession httpSession, Model model) {
		
		httpServletRequest.setAttribute("display", "/WEB-INF/productpage/cart.jsp");
		return "index";
	}
	@PostMapping(value = "getCartList")
	@ResponseBody
	public List<CartListDTO> getCartList(HttpSession httpSession) {
		User_InfoDTO user = (User_InfoDTO) httpSession.getAttribute("memUser_InfoDTO");
		String userId = user.getUser_id();
		return userPageService.cartList(userId);
	}
	@PostMapping(value = "deleteCart")
	@ResponseBody
	public void deleteCart(@RequestParam int cart_number) {
		userPageService.deleteCart(cart_number);
	}
	@PostMapping(value = "addCart")
	@ResponseBody
	public void addCart(HttpSession httpSession,@RequestParam int product_sort_number) {
		User_InfoDTO user = (User_InfoDTO) httpSession.getAttribute("memUser_InfoDTO");
		CartListDTO cartListDTO=new CartListDTO();
		cartListDTO.setProduct_sort_number(product_sort_number);
		cartListDTO.setUser_id(user.getUser_id());
		userPageService.addCart(cartListDTO);
	}
	//------------------------------------------------------------------------------------------------------
	@GetMapping(value="checkout")
	public String checkout() {
		httpServletRequest.setAttribute("display", "/WEB-INF/orderpage/checkout.jsp");
		return "index";
	}
	@GetMapping(value="quickorder")
	public String quickorder() {
		httpServletRequest.setAttribute("display", "/WEB-INF/orderpage/quickorder.jsp");
		return "index";
	}
	@PostMapping(value = "getQuickorder")
	@ResponseBody
	public CartListDTO getQuickorder(@RequestParam int product_sort_number) {
		return userPageService.getQuickorder(product_sort_number);
	}
	//---------------------------------------------
}
