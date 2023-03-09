package co.kr.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {
    public List<HashMap<String, Object>> getList(Map<String, Object> commandMap);

    public int getListCount(Map<String, Object> commandMap);
}
