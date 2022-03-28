package userpage.service;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import userpage.bean.AddressDTO;
import userpage.bean.CartListDTO;
import userpage.bean.ListPagingDTO;
import userpage.bean.MenuImgDTO;
import userpage.bean.ProductDTO;
import userpage.bean.Product_ImageFileDTO;
import userpage.bean.Product_SortDTO;
import userpage.bean.SearchPagingDTO;
import userpage.bean.User_InfoDTO;
import userpage.dao.UserPageDAO;

@Service
public class UserPageServiceImpl implements UserPageService {
	@Autowired
	private UserPageDAO userPageDAO;
	@Autowired
	private ListPagingDTO listPagingDTO;
	@Autowired
	private SearchPagingDTO searchPagingDTO;
	private SimpleDateFormat sdf;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;
	@Override
	public void kakaoLogin(HttpSession httpSession, String email, String kakaoId, String name) {
		User_InfoDTO user_infoDTO = new User_InfoDTO();
		user_infoDTO.setName(name);
		user_infoDTO.setRank_num(1);
		user_infoDTO.setEmail(email);
		user_infoDTO.setUser_id(kakaoId);
		user_infoDTO.setMileage(2000);
		user_infoDTO.setUser_pwd("");
		user_infoDTO.setAddr1("");
		user_infoDTO.setAddr2("");
		user_infoDTO.setEmail_check("1");
		System.out.println(user_infoDTO);
		try {
			userPageDAO.joinOk(user_infoDTO);
			
		}catch(Exception e){
			System.out.println(e);
			e.printStackTrace();
	
		}
		
		httpSession.setAttribute("memUser_InfoDTO", user_infoDTO);
	}
	@Override
	public String loginOk(HttpSession httpSession, Map<String, String> map) {
		System.out.println(map);
		User_InfoDTO user_InfoDTO = userPageDAO.loginOk(map);
		if(user_InfoDTO==null) {
			return "fail";
		}
		if (passwordEncoder.matches(map.get("user_pwd"),user_InfoDTO.getUser_pwd())) {
			httpSession.setAttribute("memUser_InfoDTO", user_InfoDTO);
			String phone = "0"+user_InfoDTO.getPhone();
			System.out.println(phone);
			String phone1="";
			String phone2="";
			String phone3="";
			if(!phone.equals("00")) {
				 phone1 = phone.substring(0,3); //01020381973 - 010
				phone2 = phone.substring(3,7); //
				phone3 = phone.substring(7);			
			}

			httpSession.setAttribute("phone1", phone1);
			httpSession.setAttribute("phone2", phone2);
			httpSession.setAttribute("phone3", phone3);
			
			String tel = "0"+user_InfoDTO.getTel();
			String tel1="";
			String tel2="";
			String tel3="";
			System.out.println(user_InfoDTO.getTel());
			if(!tel.equals("02")) {
				tel1 = tel.substring(0,tel.length()-7); //01020381973 - 010
				tel2 = tel.substring(tel.length()-7,tel.length()-4); //
				tel3 = tel.substring(tel.length()-4);			
			}

			httpSession.setAttribute("tel1", tel1);
			httpSession.setAttribute("tel2", tel2);
			httpSession.setAttribute("tel3", tel3);
			return "ok";
		} else {
			return "fail";
		}
	}

	@Override
	public void logout(HttpSession httpSession) {
		httpSession.invalidate();
	}

	@Override
	public void joinOk(User_InfoDTO user_infoDTO) {
		user_infoDTO.setUser_pwd(passwordEncoder.encode(user_infoDTO.getUser_pwd()));
		System.out.println(user_infoDTO);
		userPageDAO.joinOk(user_infoDTO);
	}

	@Override
	public String checkId(String id) {
		User_InfoDTO userDTO = userPageDAO.checkId(id);
		if (userDTO == null)
			return "non_exist";
		else

			return "exist";
	}

	@Override
	public void editOk(HttpSession httpSession, User_InfoDTO user_infoDTO) {
		userPageDAO.editOk(user_infoDTO);
		httpSession.invalidate();
	}

	@Override
	public void deleteOk(HttpSession httpSession, User_InfoDTO user_infoDTO) {
		userPageDAO.deleteOk(user_infoDTO);
		httpSession.invalidate();
	}

	@Override
	public String findIdEmail(HttpSession httpSession, Map<String, String> map) {
		List<User_InfoDTO> userDTO = userPageDAO.findIdEmail(map);
		if (userDTO.size() == 0)
			return "emailfail";
		else {
			sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			List<String> userIdArr = new ArrayList<String>();
			String userName = "";
			String userEmail = "";
			List<String> date = new ArrayList<String>();
			List<String> userRank = new ArrayList<String>();
			for (User_InfoDTO u : userDTO) {
				userIdArr.add("\"" + u.getUser_id() + "\"");
				userName = u.getName();
				date.add("\""+sdf.format(u.getUser_insertdate())+"\"");
				userRank.add(u.getRank_num()==1?"\""+"일반회원"+"\"":"\""+"특수회원"+"\"");
				userEmail = u.getEmail();
			}
			httpSession.setAttribute("memId", userIdArr);
			httpSession.setAttribute("memName", userName);
			httpSession.setAttribute("memOption", "Email");
			httpSession.setAttribute("memKeyword", userEmail);

			
			httpSession.setAttribute("memSys", date);

			httpSession.setAttribute("memRank", userRank);

		}
		return "emailok";
	}

	@Override
	public String findIdPhone(HttpSession httpSession, Map<String, String> map) {
		List<User_InfoDTO> userDTO = userPageDAO.findIdPhone(map);
		if (userDTO.size() == 0)
			return "phonefail";
		else {
			List<String> userIdArr = new ArrayList<String>();
			String userName = "";
			int userPhone = 0;
			sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
			List<String> date = new ArrayList<String>();
			List<String> userRank = new ArrayList<String>();
			for (User_InfoDTO u : userDTO) {
				userIdArr.add("\"" + u.getUser_id() + "\"");
				userName = u.getName();
				date.add("\""+sdf.format(u.getUser_insertdate())+"\"");
				userRank.add(u.getRank_num()==1?"\""+"일반회원"+"\"":"\""+"특수회원"+"\"");
				userPhone = u.getPhone();
			}
			httpSession.setAttribute("memId", userIdArr);
			httpSession.setAttribute("memName", userName);
			httpSession.setAttribute("memOption", "휴대폰번호");
			httpSession.setAttribute("memKeyword", "0" + userPhone);

			httpSession.setAttribute("memSys", date);
			httpSession.setAttribute("memRank", userRank);

		}
		return "phoneok";
	}

	@Override
	public String findPwdEmail(HttpSession httpSession, Map<String, String> map) {
		User_InfoDTO userDTO = userPageDAO.findPwdEmail(map);
		if (userDTO == null)
			return "emailfail";
		else {
			httpSession.setAttribute("memName", userDTO.getName());
			httpSession.setAttribute("memOption", "Email");
			httpSession.setAttribute("memKeyword", userDTO.getEmail());
			httpSession.setAttribute("memId", userDTO.getUser_id());
			httpSession.setAttribute("memEmail", userDTO.getEmail());

		}
		return "emailok";
	}

	@Override
	public String findPwdPhone(HttpSession httpSession, Map<String, String> map) {
		User_InfoDTO userDTO = userPageDAO.findPwdPhone(map);
		if (userDTO == null)
			return "phonefail";
		else {
			httpSession.setAttribute("memName", userDTO.getName());
			httpSession.setAttribute("memOption", "휴대폰번호");
			httpSession.setAttribute("memKeyword", "0"+userDTO.getPhone());
			httpSession.setAttribute("memId", userDTO.getUser_id());
		}
		return "phoneok";
	}
	@Override
	public void temppwd(HttpServletResponse response, Map<String, String> map) throws Exception {
		//response.setContentType("text/html;charset=utf-8");
		User_InfoDTO userDTO = userPageDAO.checkId(map.get("user_id"));
		//PrintWriter out = response.getWriter();
		System.out.println(userDTO);
		
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			// 비밀번호 변경
			userDTO.setUser_pwd(pw);
			map.put("user_pwd", pw);
			map.put("rank_num", "4");
			//회원 등급 변경
			userPageDAO.updatePwd(map);
			// 비밀번호 변경 메일 발송
			sendEmail(userDTO, "findpw");

			//out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			//out.close();
	}
	@Override
	public void sendEmail(User_InfoDTO userDTO, String div) throws Exception {
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
        p.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Authenticator auth = new MyAuthentication();
        Session session = Session.getInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
 
        try {
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress();
            
            from = new InternetAddress("theCShop<dltjdgh0204@naver.com>");
            msg.setFrom(from);
 
            InternetAddress to = new InternetAddress(userDTO.getEmail());
            msg.setRecipient(javax.mail.Message.RecipientType.TO, to);
 
            msg.setSubject("[the C shop]"+userDTO.getUser_id()+"님 임시비밀번호가 전송되었습니다.", "UTF-8");
            msg.setText("안녕하세요 the C shop입니다<br>"+
                         userDTO.getName()+"님 저희 쇼핑몰을 이용해 주셔서 감사합니다<br>"+
            		" 회원님("+userDTO.getUser_id()+")의 임시비밀번호는 : "+userDTO.getUser_pwd()+"입니다", "UTF-8");
            msg.setHeader("content-Type", "text/html");
 
            javax.mail.Transport.send(msg);
        } catch (AddressException addr_e){
            addr_e.printStackTrace();
        } catch (MessagingException msg_e){
            msg_e.printStackTrace();
        }
		
	}
	class MyAuthentication extends Authenticator {
		 
	    PasswordAuthentication account;
	 
	    public MyAuthentication(){
	        String id = "dltjdgh0204";
	        String pw = "PKBZSX1KDRDY";
	        account = new PasswordAuthentication(id, pw);
	    }
	 
	    public PasswordAuthentication getPasswordAuthentication(){
	        return account;
	    }
	}
	@Override
	public void temppwd2(Map<String, String> map) {
		String numStr = "";
        for (int i = 0; i < 12; i++) {
			numStr += (char) ((Math.random() * 26) + 97);
		}
        System.out.println("수신자 번호 : " + "0"+map.get("phone"));
        System.out.println("인증번호 : " + numStr);
        String api_key = "NCSL9USPV49WXGQK";
    	String api_secret = "OHTPYK9FVPHDCAXUM4AA6YCCWGQS0DRL";
    	Message coolsms = new Message(api_key, api_secret);

    	// 4 params(to, from, type, text) are mandatory. must be filled
    	HashMap<String, String> params = new HashMap<String, String>();
    	System.out.println(map);
    	params.put("to", map.get("phone")); // 수신전화번호
    	params.put("from", "01073323440"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
    	params.put("type", "SMS");
    	params.put("text", "the C shop : 임시 비밀번호는" + "[" + numStr + "]" + "입니다.");
    	params.put("app_version", "test app 1.2"); // application name and version

		map.put("user_pwd", numStr);
		map.put("rank_num", "4");
		userPageDAO.updatePwd(map);
    	try {
    		JSONObject obj = (JSONObject) coolsms.send(params);
    		System.out.println(obj.toString());
    	} catch (CoolsmsException e) {
    		System.out.println(e.getMessage());
    		System.out.println(e.getCode());
    	}
	}
	@Override
	public List<AddressDTO> getAddresses(String user_id) {
		return userPageDAO.getAddresses(user_id);
	}
	@Override
	public void addNew(Map<String, String> map) {
		userPageDAO.addNew(map);

	}
	@Override
	public AddressDTO getEdit(String addr_number) {
		return userPageDAO.getEdit(addr_number);
	}
	@Override
	public void addEdit(AddressDTO addressDTO) {
		userPageDAO.addEdit(addressDTO);
	}
	@Override
	public void delEdit(String addr_number) {
		userPageDAO.delEdit(addr_number);

	}
	@Override
	public List<MenuImgDTO> getMainImg() {
		return userPageDAO.getMainImg();
	}
	@Override
	public List<MenuImgDTO> getNavImg() {
		return userPageDAO.getNavImg();
	}
	// ----------------------------------------------------------------------

	@Override
	public Map<String, Object> getList(Map<String, String> map) {
		// System.out.println(map);
		Map<String, Object> temp = new HashMap<String, Object>();
		map.put("endNum", Integer.parseInt(map.get("pg")) * 20 + "");
		map.put("startNum", Integer.parseInt(map.get("pg")) * 20 - 19 + "");
		// 페이징
		int totalA = userPageDAO.getSearchTotalA(map);// 총글수

		listPagingDTO.setCurrentPage(Integer.parseInt(map.get("pg")));
		listPagingDTO.setPageBlock(3);
		listPagingDTO.setPageSize(20);
		listPagingDTO.setTotalA(totalA);
		listPagingDTO.makePagingHTML();
		temp.put("paging", listPagingDTO.getPagingHTML());
		temp.put("list", userPageDAO.getList(map));
		return temp;
	}

	@Override
	public List<Product_ImageFileDTO> getDetailImg(String product_number) {
		return userPageDAO.getDetailImg(Integer.parseInt(product_number));
	}
	
	@Override
	public ProductDTO getProduct(String product_number) {
		return userPageDAO.getProduct(Integer.parseInt(product_number));
	}
	@Override
	public List<Product_SortDTO> getSizes(String product_number) {
		return userPageDAO.getSizes(Integer.parseInt(product_number));
	}
	@Override
	public Map<String, Object> getSearchList(Map<String, String> map) {
		Map<String, Object> temp = new HashMap<String, Object>();
		map.put("endNum", Integer.parseInt(map.get("pg")) * 20 + "");
		map.put("startNum", Integer.parseInt(map.get("pg")) * 20 - 19 + "");

		int totalB = userPageDAO.getSearchTotalB(map);
		

		searchPagingDTO.setCurrentPage(Integer.parseInt(map.get("pg")));
		searchPagingDTO.setPageBlock(10);
		searchPagingDTO.setPageSize(20);
		searchPagingDTO.setTotalA(totalB);
		searchPagingDTO.makePagingHTML();
		temp.put("paging", searchPagingDTO.getPagingHTML());
		temp.put("totalB", totalB);
		temp.put("list", userPageDAO.getSearchList(map));

		return temp;
	}
	@Override
	public List<CartListDTO> cartList(String userId) {
		return userPageDAO.cartList(userId);
	}
	@Override
	public void deleteCart(int cart_number) {
		userPageDAO.deleteCart(cart_number);
	}
	@Override
	public void addCart(CartListDTO cartListDTO) {
		userPageDAO.addCart(cartListDTO);
	}
	@Override
	public CartListDTO getQuickorder(int product_sort_number) {
		return userPageDAO.getQuickorder(product_sort_number);
	}
}
