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
        List<HashMap<String, Object>> resultList = service.getList();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("result", resultList);
        return result;
    }
}
