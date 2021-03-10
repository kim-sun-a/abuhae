package study.team.abuhae.test;

import java.util.Arrays;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.AgeHelper;
import study.team.abuhae.model.Mom_info;
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
public class MemberInsertTest {

	
	public int random(int n1, int n2) {
		int a = (int)((Math.random() * (n2 - n1 + 1)) + n1);
		return a; 
      }
	Mom_info input = new Mom_info();
	Mom_info input2 = new Mom_info();
		@Test
		public void testA() {
			// 스케줄 
			String[] days = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
			String[] frequency = {"regular", "shortTerm", "noplan"};

			// 스케줄 랜덤입력 
			// 가능한 요일
			String dayOk[] = new String[3];
			dayOk[0] = "\"" + days[random(0,2)] + "\"";
			dayOk[1] = "\"" + days[random(3,4)] + "\"";
			dayOk[2] = "\"" + days[random(5,6)] + "\"";
			
			input.setSchedule("{\"day\":" + Arrays.toString(dayOk) +", \"frequency\": \"" + frequency[random(0,frequency.length-1)] 
					+ "\", \"startdate\": \"" + String.format("%02d/%02d/%02d", 2021, 03, random(1,31)) + "\"}");
			
			System.out.println("스케줄 입력 확인" +input.getSchedule());
		}
		
		@Test
		public void testB() {
			// 원하는 활동
			String[] acts = {"innerplay", "guide", "read", "outside", "korean", "english", "study", "sport", "simple_cleaning", "eat", "do_dish", "long_move_in", "short_move_in"};
			

			// 스케줄 랜덤입력 
			// 가능한 요일
			// 원하는 활동
			String wantact1 = new String(acts[0]);
			String wantact2 = new String(acts[1]);
			String wantact3 = new String(acts[3]);
			
			input.setWant_act1(wantact1);
			input.setWant_act2(wantact2);
			input.setWant_act3(wantact3);

			System.out.println("원하는 활동1 입력 확인" + input.getWant_act1());
			System.out.println("원하는 활동2 입력 확인" + input.getWant_act2());
			System.out.println("원하는 활동3 입력 확인" + input.getWant_act3());
			
			input2.setWant_act1("innerplay");
			input2.setWant_act2("guide");
			input2.setWant_act3("outside");
			
			System.out.println("원하는 활동1 입력 확인" + input2.getWant_act1());
			System.out.println("원하는 활동2 입력 확인" + input2.getWant_act2());
			System.out.println("원하는 활동3 입력 확인" + input2.getWant_act3());
			
			System.out.println(input.getWant_act1() == input2.getWant_act1());
			
			System.out.println(input.getWant_act1().equals(input2.getWant_act1()));

		}
		
		@Test
		public void testC() {
			String[] accepts = {"Y", "N"};
			
			for(int i = 0; i<100; i++) {
				String a = accepts[random(0,1)];
				System.out.println(a);
			}
		}
}
