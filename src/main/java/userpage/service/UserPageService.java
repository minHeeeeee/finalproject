package userpage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userpage.bean.AddressDTO;
import userpage.bean.CartListDTO;
import userpage.bean.MenuImgDTO;
import userpage.bean.ProductDTO;
import userpage.bean.Product_ImageFileDTO;
import userpage.bean.Product_SortDTO;
import userpage.bean.User_InfoDTO;


public interface UserPageService {

	public String loginOk(HttpSession httpSession, Map<String, String> map);

	public Map<String, Object> getList(Map<String, String> map);

	public void joinOk(User_InfoDTO user_infoDTO);

	public String checkId(String id);

	public void logout(HttpSession httpSession);

	public void editOk(HttpSession httpSession, User_InfoDTO user_infoDTO);

	public void deleteOk(HttpSession httpSession, User_InfoDTO user_infoDTO);

	public String findIdEmail(HttpSession httpSession,Map<String, String> map);

	public String findIdPhone(HttpSession httpSession,Map<String, String> map);

	public String findPwdEmail(HttpSession httpSession,Map<String, String> map);

	public String findPwdPhone(HttpSession httpSession,Map<String, String> map);

	public void temppwd(HttpServletResponse response, Map<String, String> map) throws Exception;

	public void temppwd2(Map<String, String> map);

	public void sendEmail(User_InfoDTO userDTO, String div) throws Exception;

	public List<Product_ImageFileDTO> getDetailImg(String product_number);

	public ProductDTO getProduct(String product_number);

	public List<Product_SortDTO> getSizes(String product_number);

	public List<AddressDTO> getAddresses(String user_id);

	public void addNew(Map<String, String> map);

	public void addEdit(AddressDTO addressDTO);

	public AddressDTO getEdit(String addr_number);

	public void delEdit(String addr_number);
	
	public Map<String, Object> getSearchList(Map<String, String> map);

	public void kakaoLogin(HttpSession httpSession, String email, String kakaoId, String name);

	public List<CartListDTO> cartList(String userId);

	public void deleteCart(int cart_number);

	public void addCart(CartListDTO cartListDTO);

	public CartListDTO getQuickorder(int product_sort_number);

	public List<MenuImgDTO> getMainImg();

	public List<MenuImgDTO> getNavImg();
}
