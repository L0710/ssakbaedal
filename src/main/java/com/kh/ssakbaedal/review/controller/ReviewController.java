package com.kh.ssakbaedal.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.order.model.service.OrderService;
import com.kh.ssakbaedal.order.model.vo.V_Order;
import com.kh.ssakbaedal.review.model.exception.ReviewException;
import com.kh.ssakbaedal.review.model.service.ReviewService;
import com.kh.ssakbaedal.review.model.vo.Review;
import com.kh.ssakbaedal.review.model.vo.V_Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rService;

	@Autowired
	private OrderService oService;

	@RequestMapping("rlist.do")
	public ModelAndView reviewList(ModelAndView mv, int mNo, @RequestParam(value = "page", required = false) Integer page) {
		// 1. 전체 게시글 수 리턴 받기
		int listCount = rService.selectListCount(mNo);
		System.out.println("lCount : " + listCount);

		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;

		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 3, 3);

		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Review> list = rService.selectList(pi, mNo);

//		System.out.println("list : " + list);
//		System.out.println("pi : " + pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("review/reviewListView");
		} else {
			throw new ReviewException("리뷰 목록 조회에 실패하였습니다.");
		}

		return mv;
	}

	@RequestMapping("selectReview.do")
	@ResponseBody
	public String selectReview(int oNo) {

		Review review = rService.selectReview(oNo);
//		System.out.println("review:" + review);

		if (review != null) { // 리뷰 작성 내역 존재
			return "matched";
		} else { // 리뷰 작성 내역 부재
			return "not matched";
		}

	}

	@RequestMapping("rinsertView.do")
	public ModelAndView reviewInsertView(ModelAndView mv, int oNo) {

		V_Order order = oService.selectOrder(oNo);
//		System.out.println("order:"+order);

		if (order != null) {
			mv.addObject("o", order).setViewName("review/reviewInsertForm_user");
		}

		return mv;
	}

	@RequestMapping("rinsert.do")
	public String reviewInsert(Review r, HttpServletRequest request, Attachment at, int oNo, int mNo,
			@RequestParam(value = "uploadFile", required = false) MultipartFile[] upFile) {
		
		r.setoNo(oNo);	// 리뷰 fk이자 주문pk set, attachment에서 refId로 사용할 것

		int result = 0;
		
		ArrayList<Attachment> files = new ArrayList<>();
		
		for(MultipartFile f:upFile) {
			if(!f.isEmpty()) {
				String renameFileName = saveFile(f, request);
				
				String savePath = savePath(f, renameFileName, request);
				
				// 파일 저장이 잘 되었다면 DB로 보낼 Attachment에 파일명 관련 컬럼을 채워줌
				if (renameFileName != null) {
					at.setOriginalFileName(f.getOriginalFilename());
					at.setChangeFileName(renameFileName);
					at.setFilePath(savePath);
					files.add(at);
				}
			}
        }
//		System.out.println("files size:" + files.size());
		
		if(files.size() > 0) {
			result = rService.insertReviewNImg(r, files);
		} else {
			result = rService.insertReview(r);
		}
		
		if (result > 0) {
			return "redirect:olist.do?mNo="+mNo;
		} else {
			throw new ReviewException("리뷰 등록에 실패하였습니다.");
		}
	}

	// 파일 저장을 위한 별도의 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장 될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\ruploadFiles";

		File folder = new File(savePath);

		if (!folder.exists()) // 사진을 저장하고자 하는 경로가 존재하지 않는다면
			folder.mkdirs(); // 포함 된 경로를 모두 생성함

		// 파일 Rename -> 현재 시간 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename(); // -> 원래 이름으로부터 확장자 추출
		int ranNum = (int)(Math.random() * 100000);	// 5자리 랜덤 숫자 생성
		String renameFileName = sdf.format(new Date()) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
//		System.out.println("renameFileName:"+renameFileName);
		
		return renameFileName;
	}

	// 파일 경로 구하기
	public String savePath(MultipartFile file, String renameFileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String path = root + "\\ruploadFiles";
		File folder = new File(path);

		String savePath = folder + "\\" + renameFileName;

//		System.out.println("savePath:"+savePath);

		return savePath;
	}

	@RequestMapping("rdetail.do")
	public ModelAndView ReviewDetail(ModelAndView mv, int oNo, @RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {

		int currentPage = page != null ? page : 1;

		Review review = rService.selectReview(oNo);
		ArrayList<Attachment> alist = rService.selectImg(oNo);

		if (review != null) {
			mv.addObject("e", review).addObject("currentPage", currentPage).addObject("at", alist)
					.setViewName("review/reviewDetailView");
		} else {
			throw new ReviewException("리뷰 상세조회에 실패하였습니다.");
		}

		return mv;
	}
}
