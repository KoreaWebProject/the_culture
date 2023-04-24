package korea.it.culture;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.QnaDAO;
import dao.QnaReDAO;
import dao.UserInfoDAO;
import util.Common;
import util.MyCommon;
import util.Paging;
import vo.QnaReVO;
import vo.QnaVO;
import vo.UserInfoVO;

@Controller
public class QnaController {
	@Autowired // 자동주입 : 스프링으로부터 자동생성 가능한 객체를 new없이 알아서 생성해준다
	HttpServletRequest request; // 서블릿 컨택스트로 감 / ip구할 때 사용

	@Autowired
	ServletContext app; // 절대 경로 찾기 위해서 만들어 둠

	QnaDAO qna_dao;
	QnaReDAO qna_re_dao;
	UserInfoDAO userinfo_dao;

	@Autowired
	public QnaController(QnaDAO qna_dao, QnaReDAO qna_re_dao, UserInfoDAO userinfo_dao) {
		this.qna_dao = qna_dao;
		this.qna_re_dao = qna_re_dao;
		this.userinfo_dao = userinfo_dao;
		//System.out.println("here i am");
	}
	/*
	 * public void setQna_dao(QnaDAO qna_dao) { this.qna_dao = qna_dao; } public
	 * void setQna_re_dao(QnaReDAO qna_re_dao) { this.qna_re_dao = qna_re_dao; }
	 */

	// Qna 전체 등록 목록 조회
	@RequestMapping(value = { "/", "/qna_main.do" })
	public String QnaList(Model model) {
		/* System.out.println("확인2"); */

		int nowPage = 1; // 1로 첫페이지 번호를 가정
		String page = request.getParameter("page");// 기본자료형은 null값을 판단하지 못함
		if (page != null && !page.isEmpty()) {// 올바른 값을 받았다면
			nowPage = Integer.parseInt(page);
		}

		// 한페이지에 표시될 게시물의 시작과 끝 번호를 계산
		// 1page : 1 ~ 5 번 랭크의 게시글을 보여줘야함
		// 2page : 6 ~ 10 번 랭크의 게시글을 보여줘야함
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = nowPage * Common.Board.BLOCKLIST;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 검색관련 내용
		String search = request.getParameter("search");// 카테고리
		String search_text = request.getParameter("search_text");// 검색어

		// 검색어가 입력되어 있는 경우
		if (search != null && !search.equalsIgnoreCase("all")) {
			switch (search) {
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
			case "name":
				map.put("name", search_text);
				break;
			case "subject":
				map.put("subject", search_text);
				break;
			case "content":
				map.put("content", search_text);
				break;

			default:
				break;
			}// switch
		}

		List<QnaVO> list = qna_dao.selectList(map);
		//System.out.println(list);
		// 페이지 메뉴 생성
		int row_total = qna_dao.getRowTotal(map);

		String search_param = String.format("search=%s&search_text=%s", search, search_text);

		// 하단 페이지 메뉴 생성
		String pageMenu = Paging.getPaging("qna_main.do", 
				nowPage, // 현재페이지
				row_total, // 전체 게시글 수
				search_param, 
				Common.Board.BLOCKLIST, // 한 페이지에 보여줄 게시글 수
				Common.Board.BLOCKPAGE); // 페이지 메뉴의 수

		// pageMenu를 바인딩
		model.addAttribute("pageMenu", pageMenu);
		
		model.addAttribute("list", list);
		return MyCommon.Qna.VIEW_PATH + "qna_main.jsp";
	}

	// 새 글 추가 화면전환 용
	@RequestMapping("/qna_reg.do")
	public String insert_form() {
		return MyCommon.Qna.VIEW_PATH + "qna_reg.jsp";
	}

	// Qna 등록
	@RequestMapping("/qna_insert.do")
	public String qna_insert(QnaVO vo) {
		/* System.out.println("등록테스트"); */
		qna_dao.insertContent(vo);
		return "redirect:qna_main.do";
	}
	
	//문의글 자세히 보기
	@RequestMapping("/qna_view.do")
	public String qna_view(Model model) {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		//선택한 게시글의 내용들 가져오기
		QnaVO vo = qna_dao.selectOne(qna_id);
		//선택한 게시글에 달려있는 댓글(관리자의 글)을 가져오기
		List<QnaReVO> list = qna_re_dao.selectList(qna_id);
		//System.out.println(qna_re_dao);
		
		model.addAttribute("vo", vo);// 바인딩
		model.addAttribute("list", list);// 바인딩
		//세션에서 현재 사용자 id를 가져와서 바인딩 해줌
		
		return MyCommon.Qna.VIEW_PATH + "qna_detail.jsp";
	}
	
	
	// 문의답글 추가 화면전환 용
	@RequestMapping("/qna_reple_reg.do")
	public String reple_insert_form(Model model) {
		int qna_id = Integer.parseInt(request.getParameter("qna_id"));
		QnaReVO reVo = new QnaReVO();
		reVo.setQna_id(qna_id);
		
		/*
		 * String page = request.getParameter("page");// 페이지 String search =
		 * request.getParameter("search");// 카테고리 String search_text =
		 * request.getParameter("search_text");// 검색어
		 */		
		model.addAttribute("reVo",reVo);
		return MyCommon.Qna.VIEW_PATH + "qna_reple_reg.jsp";
	}
	
	// QnaReple 달기
	@RequestMapping("/qna_reple.do")
	public String qna_reple_insert(Model model, QnaReVO vo) {
		/* System.out.println("등록테스트"); */
		int qna_id=Integer.parseInt(request.getParameter("qna_id"));
		vo.setQna_id(qna_id);
		qna_re_dao.insert(vo);
		
		/*
		 * String page = request.getParameter("page");// 페이지 String search =
		 * request.getParameter("search");// 카테고리 String search_text =
		 * request.getParameter("search_text");// 검색어
		 */		
		
		return "redirect:qna_main.do";
	}
	
	//Qna 삭제를 위한 업데이트
	@RequestMapping("/qna_del.do")
	public String qna_del() {
		int qna_id=Integer.parseInt(request.getParameter("qna_id"));
		qna_dao.update(qna_id);
	
		return "redirect:qna_main.do";
	}

	//QnaReple 삭제를 위한 업데이트
	@RequestMapping("/qna_reple_del.do")
	public String qna_reple_del() {
		int qna_re_ref=Integer.parseInt(request.getParameter("qna_re_ref"));
		qna_re_dao.update(qna_re_ref);
		
		return "redirect:qna_main.do";
	}
	
	@RequestMapping("/qna_clear.do")
	public String qna_clear() {
		int qna_id=Integer.parseInt(request.getParameter("qna_id"));
		qna_dao.update_clear(qna_id);
		
		return "redirect:qna_main.do";
	}
	
	//테스트용 로그인 로그아웃
	@RequestMapping("/login_form.do")
	public String login_form() {
		//System.out.println("여기는옴");
		return MyCommon.Qna.VIEW_PATH + "login.jsp";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		UserInfoVO vo = userinfo_dao.selectOne(id);
		if (vo == null) {
			return "redirect:login_form.do";
		} else {

			session = request.getSession();
			session.setAttribute("login", vo);

			return "redirect:qna_main.do";
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session = request.getSession();
		session.invalidate();

		return "redirect:qna_main.do";
	}
}
