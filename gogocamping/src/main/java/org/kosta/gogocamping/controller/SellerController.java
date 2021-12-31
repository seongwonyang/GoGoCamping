package org.kosta.gogocamping.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.domain.OrderDetailVO;
import org.kosta.gogocamping.model.domain.ProductVO;
import org.kosta.gogocamping.model.domain.QnAVO;
import org.kosta.gogocamping.model.domain.SellerVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.ProductMapper;
import org.kosta.gogocamping.model.mapper.QnAMapper;
import org.kosta.gogocamping.model.mapper.SellerMapper;
import org.kosta.gogocamping.model.service.SellerMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SellerController {
	@Resource
	private SellerMapper sellerMapper;
	@Resource
	private ProductMapper productMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private QnAMapper qnaMapper;
	@Resource
	private SellerMailService sellerMailService;

	@Autowired
	public SellerController(SellerMapper sellerMapper, SellerMailService sellerMailService) {
		super();
		this.sellerMapper = sellerMapper;
		this.sellerMailService = sellerMailService;
	}

	@RequestMapping("SellerHome") // 판매자 메인 페이지
	public String home(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginVO") == null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
			model.addAttribute("getSellerProductList", productMapper.getSellerProductList(sellerVO.getSellerId()));
			return "sellerHome.tiles";			
		}
	}

	@RequestMapping("SellerRegisterForm") // 판매자 회원가입 폼
	public String registerSellerForm() {

		return "seller/views/views2/seller-register-form.tiles";
	}

	@RequestMapping("findSellerById") // 아이디 중복체크 위한 아이디 존재여부 확인
	@ResponseBody
	public String findSellerById(String sellerId) {
		SellerVO sellerVO = sellerMapper.findSellerById(sellerId);
		if (sellerVO == null) {
			return "사용 가능한 아이디입니다.";
		} else {
			return "중복된 아이디입니다.";
		}
	}

	@RequestMapping("SellerRegister") // 판매자 회원가입
	public String registerSeller(String sellerId, String sellerPassword, String sellerName, String sellerEmail,
			String sellerTel, String businessNumber, String brand, String sellerPostNumber, String sellerAddress,
			String sellerDetailedAddress, @RequestParam("logoImg") MultipartFile logoImgFile,
			HttpServletRequest request) {
		try {
			if(!logoImgFile.isEmpty()) {

				String resourceSrc = request.getServletContext().getRealPath("/static/image/seller_logo/");
				
		        //파일명
		        String originalFile = logoImgFile.getOriginalFilename();
		        //파일명 중 확장자만 추출                                                //lastIndexOf(".") - 뒤에 있는 . 의 index번호
		        String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		        String storedFileName = sellerId + "_logo." + originalFileExtension;
		        
		        //파일을 저장하기 위한 파일 객체 생성
		        File file = new File(resourceSrc + storedFileName);
		        //파일 저장
		        logoImgFile.transferTo(file);
				
				SellerVO sellerVO = 
						new SellerVO(sellerId, 
						sellerPassword, 
						sellerName, 
						sellerEmail, 
						sellerTel, 
						businessNumber, 
						brand, 
						logoImgFile.getOriginalFilename(), 
						storedFileName,
						sellerPostNumber, 
						sellerAddress, 
						sellerDetailedAddress,0);
				sellerMapper.registerSeller(sellerVO);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:sellerRegisterResultPage";
	}
	
	@RequestMapping("sellerRegisterResultPage")
	public String sellerRegisterResult() {
		return "seller/views/views2/seller-register-result.tiles";
	}

	@RequestMapping("findSellerIdForm") // 판매자 아이디 찾기 폼
	public String findSellerIdForm() {

		return "seller/views/views2/findid-form.tiles";
	}

	@RequestMapping("findSellerIdByBusinessNo") // 판매자 아이디 찾기
	@ResponseBody
	public String findSellerIdByBusinessNo(String sellerName, String businessNumber) {
		SellerVO sellerVO = new SellerVO(null, null, sellerName, null, null, businessNumber, null, null, null, null,
				null, null, 0);
		String sellerId = sellerMapper.findSellerIdByBusinessNo(sellerVO);

		if (sellerId != null) {
			return sellerId;
		} else {
			return "";
		}
	}

	@RequestMapping("findSellerPwForm") // 판매자 비밀번호 찾기 폼
	public String findSellerPwForm() {

		return "seller/views/views2/findpassword-form.tiles";
	}

	@RequestMapping("findSellerPwByBusinessNo") // 판매자 비밀번호 찾기
	@ResponseBody
	public String findSellerPwByBusinessNo(String sellerId, String sellerName, String businessNumber,
			HttpSession session) {
		SellerVO sellerVO = new SellerVO(sellerId, null, sellerName, null, null, businessNumber, null, null, null, null,
				null, null, 0);
		SellerVO sellerPw = sellerMapper.findSellerPwByBusinessNo(sellerVO);
		if (sellerPw == null) {
			return "회원 정보가 일치하지 않습니다.";
		} else {
			String str = getTempPassword();
			session.setAttribute("authCode", str);
			session.setAttribute("sellerId", sellerId);
			sellerMailService.sendMail(sellerId, sellerName, businessNumber, str);
			return "메일 발송 중입니다.";
		}
	}

	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	@RequestMapping("sellerEmailCode") // 비밀번호 인증 코드 입력
	public String sellerEmailCode() {
		return "seller/views/views2/seller-email-code.tiles";
	}

	@RequestMapping("resetPasswordForm") // 비밀번호 재설정
	public String resetPasswordForm() {
		return "seller/views/views2/seller-password-reset.tiles";
	}

	@RequestMapping("resetSellerPassword")
	public String resetCustomerPassword(String sellerId, String sellerPassword, HttpSession session) {
		session.removeAttribute("authCode");
		session.removeAttribute("sellerId");
		SellerVO sellerVO = new SellerVO(sellerId, sellerPassword);
		sellerMapper.updatePassword(sellerVO);
		return "home.tiles";
	}

	@RequestMapping("SellerLoginForm") // 판매자 로그인 폼
	public String loginSellerForm() {

		return "seller/views/views2/seller-login-form.tiles";
	}

	@RequestMapping("SellerLogin") // 판매자 로그인
	@ResponseBody
	public String loginSeller(String sellerId, String sellerPassword, HttpServletRequest request) {
		SellerVO sellerVO = new SellerVO(sellerId, sellerPassword);

		SellerVO loginVO = sellerMapper.loginSeller(sellerVO);

		if (loginVO != null && loginVO.getRegisterAdmin() == 1) {
			HttpSession session = request.getSession(false);
			session.setAttribute("loginVO", loginVO);
			return "로그인성공";
		} else if (loginVO != null && loginVO.getRegisterAdmin() == 0) {
			return "가입 승인이 이루어지지 않았습니다.";
		} else {
			return "아이디 또는 비밀번호를 확인하세요.";
		}
	}

	@RequestMapping("SellerLogout") // 판매자 로그아웃
	public String logoutSeller(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		session.invalidate();

		return "seller/views/views2/seller-login-form.tiles";
	}

	@RequestMapping("RegisterProductForm") // 상품 등록 폼
	public String registerProductForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginVO") == null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			model.addAttribute("categoryList", categoryMapper.getCategoryList());
			return "seller/views/views2/register-product-form.tiles";
		}
	}
	
	@RequestMapping("UpdateProductForm") // 상품 수정 폼
	public String updateProductForm(HttpServletRequest request, Model model, int productId) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginVO")==null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
			model.addAttribute("getSellerProductList", productMapper.getSellerProductList(sellerVO.getSellerId()));
			model.addAttribute("categoryList", categoryMapper.getCategoryList());
			model.addAttribute("getProductInfo", productMapper.getProductInfo(productId));
			return "seller/views/views2/update-product-form.tiles";
		}
	}
	
	@RequestMapping("RegisterProduct") // 상품 등록
	public String registerProduct(String productName, int price, String productInfo, int stock, String categorySelectDetail,
			@RequestParam("productImg") MultipartFile productImgFile, HttpServletRequest request) {
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
		int categoryNo = categoryMapper.getCategoryNoByDetailCategoryName(categorySelectDetail);
		CategoryVO categoryVO = new CategoryVO(categoryNo, null, null);
		try {
			if(!productImgFile.isEmpty()) {
				String productResource = request.getServletContext().getRealPath("/static/image/product_img/");
				// 파일명
				String originalImgFile = productImgFile.getOriginalFilename();
				// 확장자 추출
				String originalImgFileExt = originalImgFile.substring(originalImgFile.lastIndexOf("."));
				// 저장될 파일명
				String storedImgFileName = sellerVO.getBrand() + "_product_img_" + categoryVO.getCategoryNo() + originalImgFileExt;
				// 파일을 저장하기 위한 파일 객체 생성
				File imgFile = new File(productResource + storedImgFileName);
				// 파일 저장
				productImgFile.transferTo(imgFile);
				
				ProductVO productVO = new ProductVO(
						productName,
						price,
						productInfo,
						stock,
						productImgFile.getOriginalFilename(),
						storedImgFileName,
						sellerVO,
						categoryVO);
				productMapper.registerProduct(productVO);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:SellerHome";
	}
	
	@RequestMapping("UpdateProduct") // 상품 수정
	public String updateProduct(String productName, int price, String productInfo, int stock, String categorySelectDetail, int productId,
			@RequestParam("productImg") MultipartFile productImgFile, HttpServletRequest request) {
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
		int categoryNo = categoryMapper.getCategoryNoByDetailCategoryName(categorySelectDetail);
		CategoryVO categoryVO = new CategoryVO(categoryNo, null, null);
		try {
			if(!productImgFile.isEmpty()) {
				String productResource = request.getServletContext().getRealPath("/static/image/product_img/");
				// 파일명
				String originalImgFile = productImgFile.getOriginalFilename();
				// 확장자 추출
				String originalImgFileExt = originalImgFile.substring(originalImgFile.lastIndexOf("."));
				// 저장될 파일명
				String storedImgFileName = sellerVO.getBrand() + "_" + categoryVO.getCategoryNo() + "_" +  productId + originalImgFileExt;
				// 파일을 저장하기 위한 파일 객체 생성
				File imgFile = new File(productResource + storedImgFileName);
				// 파일 저장
				productImgFile.transferTo(imgFile);
				
				ProductVO productVO = new ProductVO(
						productId,
						productName,
						price,
						productInfo,
						stock,
						productImgFile.getOriginalFilename(),
						storedImgFileName,
						categoryVO);
				productMapper.updateProduct(productVO);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "sellerHome.tiles";
	}

	@RequestMapping("QnAList") // 고객 문의 목록
	public String getQnAList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginVO") == null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
			model.addAttribute("getQnAList", qnaMapper.getQnAList(sellerVO.getSellerId()));
			return "seller/views/views2/qna-list.tiles";
		}
	}

	@RequestMapping("QnAAnswerForm") // 고객 문의 답변 폼
	public String answerQnAForm(HttpServletRequest request, Model model, int qnaNo) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginVO")==null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			// SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
			model.addAttribute("getQnAListByNo", qnaMapper.getQnAListByNo(qnaNo));
			return "seller/views/views2/qna-answer-form.tiles";
		}
	}
	
	@RequestMapping("QnAAnswer") // 답변 등록
	public String answerQnA(HttpServletRequest request, Model model, QnAVO qnaVO) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginVO")==null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			
			SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
			qnaMapper.answerQnA(qnaVO);
			model.addAttribute("getQnAList", qnaMapper.getQnAList(sellerVO.getSellerId()));
			return "seller/views/views2/qna-list.tiles";
		}
	}
	
	@RequestMapping("OrderList") // 현재 주문 내역 리스트
	public String getOrderList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginVO")==null) {
			return "seller/views/views2/seller-login-form.tiles";
		}else {
			SellerVO sellerVO = (SellerVO)session.getAttribute("loginVO");
			model.addAttribute("getOrderList", productMapper.getOrderList(sellerVO.getSellerId()));
			return "seller/views/views2/order-list.tiles";
		}
	}
	
	@RequestMapping("updateDeliveryStatus") // 배송 정보 갱신
	@ResponseBody
	public String updateDeliveryStatus(HttpServletRequest request, Model model, int orderDetailNo, String deliveryStatus) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginVO")==null) {
			return "noSession";
		}else {
			try {
				
				Map<String, Object> orderMap = new HashMap<>();
				orderMap.put("orderDetailNo", orderDetailNo);
				if("주문완료".equals(deliveryStatus)) {
					deliveryStatus="배송준비중";
				}else if("배송준비중".equals(deliveryStatus)) {
					deliveryStatus="배송중";
				}else if("배송중".equals(deliveryStatus)) {
					deliveryStatus="배송완료";
				}
				orderMap.put("deliveryStatus", deliveryStatus);
				productMapper.updateDeliveryStatus(orderMap);
				return deliveryStatus;
			
			} catch (Exception e) {
				//System.out.println(e.getMessage());
				return "배송상태 변경 실패";
			}
		}
	}

	@RequestMapping("TotalSoldList") // 전체 판매 내역 리스트
	public String totalSoldOrderList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("loginVO");
		if (session.getAttribute("loginVO") == null) {
			return "seller/views/views2/seller-login-form.tiles";
		} else {
			List<OrderDetailVO> totalSoldList = sellerMapper.getTotalSoldList(sellerVO.getSellerId());
			model.addAttribute("totalSoldList", totalSoldList);
			// System.out.println(sellerMapper.getTotalSoldList(sellerId));
			return "seller/views/views2/total-sold-list.tiles";
		}
	}

	// 날짜별 판매 내역 조회
	@RequestMapping("getTotalSoldListByDate")
	@ResponseBody
	public List<OrderDetailVO> getTotalSoldOrderListByDate(Model model, String sellerId, String startDate,
			String lastDate) {
		System.out.println(sellerId + startDate + " " + lastDate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sellerId", sellerId);
		map.put("startDate", startDate);
		map.put("lastDate", lastDate);
		List<OrderDetailVO> totalSoldList = sellerMapper.getTotalSoldOrderListByDate(map);
		System.out.println(totalSoldList);
		model.addAttribute("totalSoldList", totalSoldList);
		return totalSoldList;
	}
	
}
