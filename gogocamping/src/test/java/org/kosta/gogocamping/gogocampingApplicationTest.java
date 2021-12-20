package org.kosta.gogocamping;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.gogocamping.model.domain.CategoryVO;
import org.kosta.gogocamping.model.mapper.CategoryMapper;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootStudy6RestApplicationTests {
	@Resource
	private CustomerMapper customerMapper;

	@Resource
	private CategoryMapper categoryMapper;
	
	@Test
	void contextLoads() {
		System.out.println(customerMapper);
	}
	
	@Test
	void getCategoryDetail() {
		String category="텐트/타프";
		List<CategoryVO> list=categoryMapper.getDetailCategory(category);
		for(CategoryVO cvo:list) {
			System.out.println(cvo);
		}
	}
	
}
