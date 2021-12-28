package org.kosta.gogocamping;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.gogocamping.model.domain.QnAVO;
import org.kosta.gogocamping.model.mapper.QnAMapper;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class QnAUnitTest {
	@Resource
	QnAMapper qnaMapper;
	
	@Test
	void getQnAListByProductId() {
		Map<String, Object> map = new HashMap<>();
		map.put("productId", 1);
		map.put("option", "product");
		
		System.out.println(qnaMapper.getQnAListByProductId(map));
	}
	
	void insertQnA() {
		//QnAVO qnaVO = new QnAVO();
		
	}
}
