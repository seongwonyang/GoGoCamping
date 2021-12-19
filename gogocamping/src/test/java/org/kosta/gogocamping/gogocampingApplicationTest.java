package org.kosta.gogocamping;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.gogocamping.model.mapper.CustomerMapper;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SpringBootStudy6RestApplicationTests {
	@Resource
	private CustomerMapper customerMapper;

	@Test
	void contextLoads() {
		System.out.println(customerMapper);
	}
	
}
