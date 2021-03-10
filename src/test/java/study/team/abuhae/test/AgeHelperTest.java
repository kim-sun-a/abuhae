package study.team.abuhae.test;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.AgeHelper;

//Lombok의 Log4j객체
@Slf4j
//JUnit에 의한 테스트 클래스 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름 순서대로 실행
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class AgeHelperTest {

	@Test
	public void testA() {
		AgeHelper agehelper = new AgeHelper();
		String age = agehelper.kidsStr("201001");
		System.out.println(age);
		
	}
	
	

	
}
