package co.kr.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {
    public List<HashMap<String, Object>> getList(Map<String, Object> commandMap);

    public int getListCount(Map<String, Object> commandMap);

    public Map<String, Object> getDetail(Map<String, Object> commandMap);

    public int boardWrite(Map<String, Object> param) throws Exception;

    public int boardModify(Map<String, Object> param) throws Exception;

    public int boardDelete(Map<String, Object> param) throws Exception;
}
