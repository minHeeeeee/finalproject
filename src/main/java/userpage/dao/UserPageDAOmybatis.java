package userpage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import userpage.bean.AddressDTO;
import userpage.bean.CartListDTO;
import userpage.bean.ListDTO;
import userpage.bean.MenuImgDTO;
import userpage.bean.ProductDTO;
import userpage.bean.Product_ImageFileDTO;
import userpage.bean.Product_SortDTO;
import userpage.bean.User_InfoDTO;

@Repository
@Transactional
public class UserPageDAOmybatis implements UserPageDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public User_InfoDTO loginOk(Map<String, String> map) {
		return sqlSession.selectOne("userPageSQL.loginOk", map);
	}

	@Override
	public void joinOk(User_InfoDTO user_infoDTO) {
		sqlSession.insert("userPageSQL.joinOk", user_infoDTO);
	}

	@Override
	public User_InfoDTO checkId(String id) {
		return sqlSession.selectOne("userPageSQL.checkId", id);
	}
	@Override
	public void editOk(User_InfoDTO user_infoDTO) {
		sqlSession.insert("userPageSQL.editOk", user_infoDTO);		
	}
	@Override
	public void deleteOk(User_InfoDTO user_infoDTO) {
		sqlSession.insert("userPageSQL.deleteOk", user_infoDTO);	
	}
	@Override
	public List<User_InfoDTO> findIdEmail(Map<String, String> map) {
		return sqlSession.selectList("userPageSQL.findIdEmail",map);
	}
	@Override
	public List<User_InfoDTO> findIdPhone(Map<String, String> map) {
		return sqlSession.selectList("userPageSQL.findIdPhone",map);
	}
	@Override
	public User_InfoDTO findPwdEmail(Map<String, String> map) {
		return sqlSession.selectOne("userPageSQL.findPwdEmail",map);
	}
	@Override
	public User_InfoDTO findPwdPhone(Map<String, String> map) {
		return sqlSession.selectOne("userPageSQL.findPwdPhone",map);
	}
	@Override
	public void updatePwd(Map<String, String> map) {
		System.out.println(map);
		sqlSession.update("userPageSQL.updatePwd",map);
	}
	@Override
	public List<AddressDTO> getAddresses(String user_id) {
		return sqlSession.selectList("userPageSQL.getAddresses", user_id);
	}
	@Override
	public void addNew(Map<String, String> map) {
		sqlSession.insert("userPageSQL.addNew", map);

	}
	@Override
	public void addEdit(AddressDTO addressDTO) {
		sqlSession.update("userPageSQL.addEdit", addressDTO);		
	}
	@Override
	public AddressDTO getEdit(String addr_number) {
		return sqlSession.selectOne("userPageSQL.getEdit",addr_number);
	}
	@Override
	public void delEdit(String addr_number) {
		sqlSession.delete("userPageSQL.delEdit", addr_number);

	}
	@Override
	public List<MenuImgDTO> getMainImg() {
		return sqlSession.selectList("userPageSQL.getMenuImg");
	}
	@Override
	public List<MenuImgDTO> getNavImg() {
		return sqlSession.selectList("userPageSQL.getMenuImg");
	}
	// -------------------------------------------------------------------

	@Override
	public List<ListDTO> getList(Map<String, String> map) {
		return sqlSession.selectList("userPageSQL.getList", map);
	}

	@Override
	public int getSearchTotalA(Map<String, String> map) {
		return sqlSession.selectOne("userPageSQL.getSearchTotalA", map);
	}

	@Override
	public List<Product_ImageFileDTO> getDetailImg(int product_number) {
		return sqlSession.selectList("userPageSQL.getDetailImg",product_number);
	}
	@Override
	public ProductDTO getProduct(int product_number) {
		return sqlSession.selectOne("userPageSQL.getProduct",product_number);
	}
	@Override
	public List<Product_SortDTO> getSizes(int product_number) {
		return sqlSession.selectList("userPageSQL.getSizes",product_number);
	}
	@Override
	public List<ListDTO> getSearchList(Map<String, String> map) {
		return sqlSession.selectList("userPageSQL.getSearchList", map);
	}
	
	@Override
	public int getSearchTotalB(Map<String, String> map) {
		return sqlSession.selectOne("userPageSQL.getSearchTotalB", map);
	}

	@Override
	public List<CartListDTO> cartList(String userId) {
		return sqlSession.selectList("userPageSQL.cartList", userId);
	}
	@Override
	public void deleteCart(int cart_number) {
		sqlSession.delete("userPageSQL.deleteCart",cart_number);
	}
	@Override
	public void addCart(CartListDTO cartListDTO) {
		sqlSession.insert("userPageSQL.addCart", cartListDTO);
	}
	@Override
	public CartListDTO getQuickorder(int product_sort_number) {
		return sqlSession.selectOne("userPageSQL.getQuickorder",product_sort_number);
	}
}
