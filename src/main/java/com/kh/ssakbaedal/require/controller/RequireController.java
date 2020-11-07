package com.kh.ssakbaedal.require.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ssakbaedal.common.attachment.Attachment;
import com.kh.ssakbaedal.common.page.PageInfo;
import com.kh.ssakbaedal.common.page.Pagination;
import com.kh.ssakbaedal.common.reply.Reply;
import com.kh.ssakbaedal.notice.model.exception.NoticeException;
import com.kh.ssakbaedal.notice.model.vo.Notice;
import com.kh.ssakbaedal.require.model.exception.RequireException;
import com.kh.ssakbaedal.require.model.service.RequireService;
import com.kh.ssakbaedal.require.model.vo.Require;

@Controller
public class RequireController {
	@Autowired
	private RequireService reService;
	
	// 일반회원 문의사항 리스트뷰 출력
	@RequestMapping("uRequireList.do")
	public ModelAndView userRequireList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page,
			int mNo) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = reService.reListCount(mNo);
						
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
						
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Require> relist = reService.selectReList(pi, mNo);
		
		if(relist != null) {
			mv.addObject("relist", relist)
			  .addObject("pi", pi)
			  .setViewName("require/userRequireList");
		} else {
			throw new RequireException("문의사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 관리자 문의사항 리스트뷰 출력
	@RequestMapping("areqList.do")
	public ModelAndView adminRequireList(ModelAndView mv,
			@RequestParam(value="page", required=false) Integer page) {
		
		// 전체 게시글 수 리턴 받기
		int listCount = reService.aerqListCount();
						
		// 현재 페이지 계산
		int currentPage = page != null ? page : 1;
						
		// 페이징 정보 만들기(3번째 인자 - pageLimit, 4번째 인자 - boardLimit)
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10, 10);
		
		// 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Require> relist = reService.aSelectReList(pi);
		
		if(relist != null) {
			mv.addObject("relist", relist)
			  .addObject("pi", pi)
			  .setViewName("require/adminRequireList");
		} else {
			throw new RequireException("문의사항 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 일반회원 문의사항 디테일 뷰 출력
	@RequestMapping("uReqDetail.do")
	public ModelAndView userRequireDetail(ModelAndView mv, int reNo, int mNo,
			@RequestParam("page") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		Require require = reService.uReqSelect(reNo);
		Attachment at = reService.uReqSelectFile(reNo);
		//System.out.println("require : " + require);
		Reply reply = reService.aReplyselect(reNo);
		
		if(require != null) {
			mv.addObject("require", require)
			  .addObject("currentPage", currentPage)
			  .addObject("reply", reply)
			  .addObject("at", at)
			  .addObject("mNo", mNo)
			  .setViewName("require/userRequireDetail");
		} else {
			throw new RequireException("문의사항 상세보기에 실패했습니다.");
		}
	
		return mv;
	}
	
	// 관리자 문의사항 게시글 디테일 뷰 출력
	@RequestMapping("aReqDetail.do")
	public ModelAndView adminRequireDetail(ModelAndView mv, int reNo,
			@RequestParam("page") Integer page) {
		
		int currentPage = page != null ? page : 1;
		
		Require require = reService.aReqSelete(reNo);
		Attachment at = reService.aReqSelectFile(reNo);
		Reply reply = reService.aReplyselect(reNo);
		
		if(require != null) {
			mv.addObject("require", require)
			  .addObject("at", at)
			  .addObject("reply", reply)
			  .addObject("currentPage", currentPage)
			  .setViewName("require/adminRequireDetail");
		} else {
			throw new RequireException("문의사항 상세보기에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 일반회원 문의사항 게시글 작성 뷰 이동
	@RequestMapping("reqinsertView.do")
	public String userRequireInView() {
		return "require/userRequireInsert";
	}
	
	// 일반회원 문의사항 게시글 작성
	@RequestMapping("reqInsert.do")
	public String userRequireInsert(Require re, HttpServletRequest request, int mNo,
			Attachment at, @RequestParam(value="uploadFile", required=false) MultipartFile file ) {
		
		re.setmNo(mNo);
		
		int result = 0;
		
		// 파일이 업로드 되었다면 (업로드 된 파일명이 ""가 아니라면)
		if(!file.getOriginalFilename().equals("")) {
			// 파일명 리네임 후 지정 경로에 파일을 저장하는 별도 메소드를 통해 저장
			String renameFileName = saveFile(file, request);
			
			String savePath = savePath(file, renameFileName, request);
			
			// 파일 저장이 잘 되었다면 DB로 보낼 Attachment에 파일명 관련 컬럼을 채워줌
			if(renameFileName != null) {
				at.setOriginalFileName(file.getOriginalFilename());
				at.setChangeFileName(renameFileName);
				at.setFilePath(savePath);
			}
			result = reService.urequireInsertFile(re, at);
		} else {
			result = reService.urequireInsert(re);
		}
		
		if(result > 0) {
			return "redirect:uRequireList.do?mNo="+mNo;
		} else {
			throw new RequireException("문의사항 게시글 작성에 실패했습니다.");
		}
	}
	
	// 관리자 문의사항 게시글 답변 뷰 이동
	@RequestMapping("aReaAnswerView.do")
	public ModelAndView adminRequireAnswer(ModelAndView mv, int reNo,
			@RequestParam("page") Integer page) {
		
		mv.addObject("reNo", reNo)
		  .addObject("page", page)
		  .setViewName("require/adminRequireAnswer");
		
		return mv;
	}
	
	// 관리자 문의사항 게시글 답변
	@RequestMapping("aReaAnswerInsert.do")
	public String aReaAnswerInsert(Require re, Reply r,
			@RequestParam("page") Integer page, int reNo) {
		
		r.setReId(reNo);
		
		int result = 0;
		
		result = reService.aReaAnswerInsert(r, re);
		
		if(result > 0) {
			return "redirect:areqList.do?page="+page;
		}else {
			throw new RequireException("문의사항 게시글 답변 작성에 실패했습니다.");
		}
		
	}
	
	// 일반회원 문의사항 게시글 수정 뷰 출력
	@RequestMapping("ureqUpView.do")
	public ModelAndView ureqUpView(ModelAndView mv, int reNo, int mNo,
			@RequestParam("page") Integer page) {
		
		Require require = reService.uReqSelect(reNo);
		Attachment at = reService.uReqSelectFile(reNo);
		
		if(require != null) {
			mv.addObject("require", require)
			  .addObject("at", at)
			  .addObject("currentPage", page)
			  .addObject("mNo", mNo)
			  .setViewName("require/userRequireUpdate");
		} else {
			throw new RequireException("문의사항 게시글 수정페이지를 불러오는데 실패했습니다.");
		}
		
		return mv;
	}
	
	// 일반회원 문의사항 게시글 수정
	@RequestMapping("ureqUpdate.do")
	public ModelAndView ureqUpdate(ModelAndView mv, Require re, Attachment at,
			int mNo, @RequestParam("page") Integer page,
			@RequestParam(value="reloadFile", required=false) MultipartFile file,
			HttpServletRequest request) {
		
		int result = 0;
		
		if(file != null && !file.isEmpty()) {
			if(at.getChangeFileName() != null) {
				deleteFile(at.getChangeFileName(), request);
			}
			
			String renameFileName = saveFile(file, request);
			
			String savePath = savePath(file, renameFileName, request);
			
			if(renameFileName != null) {
				at.setOriginalFileName(file.getOriginalFilename());
				at.setChangeFileName(renameFileName);
				at.setFilePath(savePath);
			}
			
			result = reService.ureqUpdateFile(re, at);
			
		} else {
			result = reService.ureqUpdate(re);
		}
		
		if(result > 0) {
			mv.addObject("page", page)
			  .addObject("mNo", mNo)
			  .setViewName("redirect:uRequireList.do");
		} else {
			throw new RequireException("문의사항 게시글 수정에 실패했습니다.");
		}
		
		
		return mv;
	}
	
	// 관리자 문의사항 게시글 답변 수정 뷰 이동
	@RequestMapping("areqUpView.do")
	public ModelAndView areqUpView(ModelAndView mv, int rNo, int reNo,
			@RequestParam("page") Integer page) {
		
		Reply reply = reService.areqUpView(rNo);
		
		if(reply != null) {
			mv.addObject("reply", reply)
			  .addObject("page", page)
			  .addObject("reNo", reNo)
			  .setViewName("require/adminRequireUpdate");
		} else {
			throw new RequireException("문의사항 게시글 답변 수정 페이지 이동에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 관리자 문의사항 게시글 답변 수정
	@RequestMapping("aReaAnswerUpdate.do")
	public ModelAndView aReaAnswerUpdate(ModelAndView mv, Reply r, int reNo,
			@RequestParam("page") Integer page) {
		
		int result = 0;
		
		result = reService.aReaAnswerUpdate(r);
		
		if(result > 0) {
			mv.addObject("reNo", reNo)
			  .addObject("page", page)
			  .setViewName("redirect:aReqDetail.do");
		} else {
			throw new RequireException("문의사항 게시글 답변 수정에 실패했습니다.");
		}
		
		return mv;
	}
	
	// 일반회원 문의사항 게시글 삭제
	@RequestMapping("ureqDelete.do")
	public String uRequireDelete(int reNo, int mNo,
			Attachment at, HttpServletRequest request) {
		
		Require re = reService.uReqSelect(reNo);
		
		if(at.getOriginalFileName() != null) {
			deleteFile(at.getChangeFileName(), request);
		}
		
		int result = reService.uReqDelete(reNo);
		
		if(result > 0) {
			return "redirect:uRequireList.do?mNo="+mNo;
		} else {
			throw new RequireException("문의사항 게시글 삭제에 실패했습니다.");
		}
		
	}
	
	// 관리자 문의사항 게시글 답변 삭제
	@RequestMapping("areqDelete.do")
	public String areqDelete(int reNo, @RequestParam("page") Integer page) {
		
		Reply reply = reService.aReplyselect(reNo);
		Require require = reService.aReqSelete(reNo);
		
		int result = reService.areqDelete(reNo);
		
		if(result > 0) {
			return "redirect:areqList.do?page="+page;
		} else {
			throw new RequireException("문의사항 게시글 답변 삭제에 실패했습니다.");
		}
		
	}
	
	
	// 문의사항 파일 저장을 위한 별도의 메소드
		public String saveFile(MultipartFile file, HttpServletRequest request) {
			//파일이 저장 될 경로 설정
			// 해당 resources는 webapp 하위의 resources
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\reuploadFiles";
			
			File folder = new File(savePath);// savePath 폴더를 불러와서
			if(!folder.exists())	// 사진을 저장하고자 하는 경로가 존재하지 않는다면
				folder.mkdirs();	// 포함 된 경로를 모두 생성함
			
			// 파일 Rename -> 현재 시간 년월일시분초.확장자
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename(); // -> 원래 이름으로부터 확장자 추출
			String renameFileName = sdf.format(new Date())
					+ originFileName.substring(originFileName.lastIndexOf("."));
			
			String renamePath = folder + "\\" + renameFileName;
			
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return renameFileName;
		}
		
		// 파일 경로 구하기
		public String savePath(MultipartFile file, String renameFileName, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			String path = root + "\\reuploadFiles";
			File folder = new File(path);
			
			String savePath = folder + "\\" + renameFileName;
			
			return savePath;
		}
		
		// 파일 삭제용 메소드
		public void deleteFile(String filePath, HttpServletRequest request) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			System.out.println("root : " + root);
			
			// 삭제할 파일을 메모리로 불러옴
			File deleteFile = new File(root + filePath);
			
			// 해당 경로에 해당 파일명을 가진 파일이 존재한다면
			if(deleteFile.exists()) {
				// 파일 삭제
				deleteFile.delete();
			}

		}
	
	
	

}
