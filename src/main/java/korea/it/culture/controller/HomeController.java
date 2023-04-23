package korea.it.culture.controller;

import java.util.*;

import korea.it.culture.service.PlayInfoService;
import korea.it.culture.vo.PlayInfoVO;
import korea.it.culture.vo.PlayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


	private PlayInfoService infoService;

	@Autowired
	public HomeController(PlayInfoService infoService) {
		this.infoService = infoService;
		System.out.println("controller Autowired 실행완료");
	}


	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBoardList() throws Exception {
		System.out.println("con의 getBOardList 메서드 진입");
		List<PlayVO> list = infoService.getList();
		System.out.println("service의 getList받아옴");
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("dataList", list);
		System.out.println(resultMap.get("dataList"));
		return resultMap;
	}

	/**
	 * 초기페이지  Model 객체에 담아 jsp단에서 list로 사용
	 *
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getViewList(Model model) throws Exception {
		System.out.println("con의 getViewList 메서드 진입");
		List<PlayVO> list = infoService.getList();
		System.out.println("service의 getList받아옴");
		model.addAttribute("list", list);
		return "list";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String ViewInfo(Model model, @RequestParam("playId") String playId) throws Exception{
		System.out.println("con의 ViewInfo 실행");
		//조건 값을 저장할 parameter용 map
		Map<String, Object> paramMap = new HashMap<>();
		//조건값 삽입
		paramMap.put("playId", playId);
		//게시글 데이터 가져오기  (vo에 service안에있는 detail메서드에 파라미터 맵을 보내서 .)
		PlayInfoVO vo = infoService.getPlayInfo(paramMap);

		model.addAttribute("info", vo);
		return "playInfo";
	}
}
