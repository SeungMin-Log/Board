package co.kr.board.service.impl;

import co.kr.board.service.BoardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

    @Resource(name = "boardMapper")
    private BoardMapper mapper;

    @Override
    public List<HashMap<String, Object>> getList() {
        return mapper.getList();
    }
}
