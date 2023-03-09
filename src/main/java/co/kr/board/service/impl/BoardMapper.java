package co.kr.board.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper("boardMapper")
public interface BoardMapper {
    List<HashMap<String, Object>> getList();
}
