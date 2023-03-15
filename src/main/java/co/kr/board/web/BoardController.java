package co.kr.board.web;

import co.kr.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {

    @Resource(name = "boardService")
    private BoardService service;

    /* 게시판 메인페이지 */
    @RequestMapping(value = "/boardList.do")
    public ModelAndView boardList(){
        ModelAndView mav = new ModelAndView();
        String resultUrl = "boardList";
        mav.setViewName(resultUrl);
        return mav;
    }

    /* 게시판 등록페이지 */
    @RequestMapping(value = "/boardWritePop.do")
    public ModelAndView boardWritePop(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
        ModelAndView mav = new ModelAndView();
        String resultURL = "boardWrite";
        mav.setViewName(resultURL);
        return mav;
    }

    /* 게시판 수정페이지 */
    @RequestMapping(value = "/boardModifyPop.do")
    public ModelAndView boardModifyPop(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
        ModelAndView mav = new ModelAndView();
        String resultURL = "boardModify";

        Map<String, Object> detailData = service.getDetail(commandMap);

        mav.addObject("detailData", detailData);
        mav.setViewName(resultURL);
        return mav;
    }

    /* 게시판 메인 리스트 가져오기 */
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

    /* 게시판 등록/수정/삭제 */
    @ResponseBody
    @RequestMapping(value = "/boardCud.do", method = RequestMethod.POST)
    public Map<String,Object> boardCud(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> commandMap) throws Exception {
        int resultCode = 0;
        String mode = commandMap.get("mode").toString();

        try {
            if (mode.equals("write")){
                resultCode = service.boardWrite(commandMap);
            } else if (mode.equals("modify")) {
                resultCode = service.boardModify(commandMap);
            } else if (mode.equals("delete")) {
                resultCode = service.boardDelete(commandMap);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } catch (Exception e) {
            System.out.println(e);
        }

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("resultCode", resultCode);
        return result;
    }

}
