package co.kr.board.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper("boardMapper")
public interface BoardMapper {
    public List<HashMap<String, Object>> getList(Map<String, Object> commandMap);

    public int getListCount(Map<String, Object> commandMap);

    public Map<String, Object> getDetail(Map<String, Object> commandMap);

    public int boardWrite(Map<String, Object> commandMap) throws Exception;

    public int boardModify(Map<String, Object> commandMap) throws Exception;

    public int boardDelete(Map<String, Object> commandMap) throws Exception;
}
