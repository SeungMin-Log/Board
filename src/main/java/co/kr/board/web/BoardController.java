package co.kr.board.web;

import co.kr.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

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
    public ModelAndView getList(){
        ModelAndView mav = new ModelAndView();
        List<HashMap<String, Object>> resultList = service.getList();
        mav.addObject("result", resultList);
        return mav;
    }
}
