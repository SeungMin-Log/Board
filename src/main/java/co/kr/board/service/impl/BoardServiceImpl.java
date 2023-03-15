package co.kr.board.service.impl;

import co.kr.board.service.BoardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

    @Resource(name = "boardMapper")
    private BoardMapper mapper;

    @Override
    public List<HashMap<String, Object>> getList(Map<String, Object> commandMap) {
        return mapper.getList(commandMap);
    }

    @Override
    public int getListCount(Map<String, Object> commandMap) {
        return mapper.getListCount(commandMap);
    }

    @Override
    public Map<String, Object> getDetail(Map<String, Object> commandMap) {
        return mapper.getDetail(commandMap);
    }

    @Override
    public int boardWrite(Map<String, Object> commandMap) throws Exception {
        return mapper.boardWrite(commandMap);
    }

    @Override
    public int boardModify(Map<String, Object> commandMap) throws Exception {
        return mapper.boardModify(commandMap);
    }

    @Override
    public int boardDelete(Map<String, Object> commandMap) throws Exception {
        return mapper.boardDelete(commandMap);
    }
}
