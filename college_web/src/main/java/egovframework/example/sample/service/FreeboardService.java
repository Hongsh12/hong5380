package egovframework.example.sample.service;

import java.util.List;
public interface FreeboardService {
	
	void insertFreeBoard(FreeboardVO vo) throws Exception;
	
	void updateFreeboard(FreeboardVO vo) throws Exception;
	
	FreeboardVO selectFreeboard(FreeboardVO vo) throws Exception;
	
	List<?> selectFreeboardList(SampleDefaultVO searchVO) throws Exception;
	
	List<?> MainPage(SampleDefaultVO searchVO) throws Exception;

	int selectFreeboardListTotCnt(SampleDefaultVO searchVO);
	
}
