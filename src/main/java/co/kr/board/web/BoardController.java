package co.kr.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

    @RequestMapping(value = "/boardList.do")
    public ModelAndView boardList(){
        ModelAndView mav = new ModelAndView();
        String resultUrl = "boardList";
        mav.setViewName(resultUrl);
        return mav;
    }
}
