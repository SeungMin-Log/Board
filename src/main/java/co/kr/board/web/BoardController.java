package co.kr.board.web;

import co.kr.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Resource(name = "boardService")
    private BoardService service;

    @RequestMapping(value = "/boardList.do")
    public ModelAndView boardList(){
        ModelAndView mav = new ModelAndView();
        String resultUrl = "boardList";
        mav.setViewName(resultUrl);
        return mav;
    }

    @RequestMapping(value = "/getList.do")
    @ResponseBody
    public Map<String, Object> getList(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();

        /* 데이터 갯수 */
        int totalCount = service.getListCount(commandMap);
        /* 총 페이지 갯수 */
        int totalPage = (int) Math.ceil((double) totalCount/10);
        /* 현재페이지 번호 */
        int currentPage = Integer.parseInt((String) commandMap.get("currentPage").toString());
        /* EndPage */
        int endPage = (int)(Math.ceil(currentPage*0.1))*10;
        /* StartPage */
        int startPage = endPage-9;

        /* EndPage(ex20)가 TotalPage(ex11)보다 크면 endPage는 totalPage로 변경 */
        if (endPage > totalPage){
            endPage = totalPage;
        }

        /* OFFSET 로직 */
        commandMap.put("offset", (currentPage-1) * 10);

        /* 처음으로 버튼 활성화 여부 */
        boolean fstBtn = true;
        if (currentPage == 1){
            fstBtn = false;
        }
        /* 이전버튼 활성화 여부 */
        boolean preBtn = true;
        if (currentPage <= 1){
            preBtn = false;
        }
        /* 다음버튼 활성화 여부 */
        boolean nextBtn = true;
        if (currentPage == totalPage){
            nextBtn = false;
        }
        /* 끝으로 버튼 활성화 여부 */
        boolean endBtn = true;
        if (currentPage == totalPage){
            endBtn = false;
        }

        /* 데이터 리스트 */
        List<HashMap<String, Object>> resultList = service.getList(commandMap);

        result.put("result", resultList);
        result.put("preBtn", preBtn);
        result.put("nextBtn", nextBtn);
        result.put("fstBtn", fstBtn);
        result.put("endBtn", endBtn);
        result.put("endPage", endPage);
        result.put("startPage", startPage);
        result.put("totalPage", totalPage);
        result.put("currentPage", currentPage);
        return result;
    }
}
