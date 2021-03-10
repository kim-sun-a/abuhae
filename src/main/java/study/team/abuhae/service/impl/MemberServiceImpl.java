package study.team.abuhae.service.impl;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.team.abuhae.helper.MailHelper;
import study.team.abuhae.model.Leave_member;
import study.team.abuhae.model.Member;
import study.team.abuhae.model.Mom_info;
import study.team.abuhae.model.Sitter_info;
import study.team.abuhae.service.MemberService;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	// mybatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlsession;
	//mailhelper 주입
	@Autowired
	MailHelper mailhelper;

	/*
	 * 회원 기본 정보 조회 (MemberTable)
	 * 
	 * @param Member 조회할 멤버의 일련번호를 담고있는 beans
	 * 
	 * @return 조회한 내용
	 */
	@Override
	public Mom_info getMemberLogin(Mom_info input) throws Exception {
		Mom_info result = null;

		try {
			result = sqlsession.selectOne("MemberMapper.selectIDItem", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("아이디나 비밀번호를 다시 확인해 주세요.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패하였습니다.");
		}
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
	}

	/*
	 * 맘회원정보 조회 - mom_info
	 * 
	 * @param Member 조회할 멤버의 일련번호를 담고있는 beans
	 * 
	 * @return 조회한 내용
	 */
	@Override
	public List<Mom_info> getMomList(Mom_info input) throws Exception {
		List<Mom_info> result = null;

		try {
			result = sqlsession.selectList("MemberMapper.selectListMom", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/*
	 * 맘 회원수 조회
	 * 
	 * @apram 검색할 내용
	 * 
	 * @return int
	 */
	@Override
	public int getMomCount(Mom_info input) throws Exception {
		int result = 0;

		try {
			result = sqlsession.selectOne("MemberMapper.selectCountMom");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/*
	 * 시터회원정보 조회 - sitter_info
	 * 
	 * @param Member 조회할 멤버의 일련번호를 담고있는 beans
	 * 
	 * @return 조회한 내용
	 */
	@Override
	public List<Sitter_info> getSitterList(Sitter_info input) throws Exception {
		List<Sitter_info> result = null;

		try {
			result = sqlsession.selectList("MemberMapper.selectListSitter", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/*
	 * 시터 회원수 조회
	 * 
	 * @apram 검색할 내용
	 * 
	 * @return int
	 */
	@Override
	public int getSitterCount(Sitter_info input) throws Exception {
		int result = 0;

		try {
			result = sqlsession.selectOne("MemberMapper.selectCountSitter");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/*
	 * 회원 정보 수정
	 * 
	 * @param Member 수정할 정보를 담고있는 beans
	 * 
	 * @return int
	 */
	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;
		return result;
	}

	/*
	 * 회원 탈퇴 -> leave 테이블로 이동
	 * 
	 * @param Member 탈퇴하는 회원의 정보를 담고있는 beans
	 * 
	 * @return int
	 */
	@Override
	public int leaveMember(Member input) throws Exception {
		int result = 0;

		return result;
	}

	@Override
	public int addMom(Mom_info input) throws Exception {
		int result1 = 0;
		int result2 = 0;

		try {
			result1 = sqlsession.insert("MemberMapper.insertMember", input);
			result2 = sqlsession.insert("MemberMapper.insertMom", input);
			if (result1 == 0 && result2 == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result1;
	}
	
	@Override
	public int addSitter(Sitter_info input) throws Exception {
		int result1 = 0;
		int result2 = 0;

		try {
			result1 = sqlsession.insert("MemberMapper.insertMember", input);
			result2 = sqlsession.insert("MemberMapper.insertSitter", input);
			if (result1 == 0 && result2 == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result1;
	}

	@Override
	public int idCheck(Member input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("MemberMapper.getIdCheck", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int emailCheck(Member input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("MemberMapper.getEmailCheck", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int phoneCheck(Member input) throws Exception {
		int result = 0;
		try {
			result = sqlsession.selectOne("MemberMapper.getPhoneCheck", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Mom_info findId(Member input) throws Exception {
		Mom_info result = new Mom_info();

		try {
			result = sqlsession.selectOne("MemberMapper.findID", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("가입되지 않은 회원 정보입니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("가입 정보를 정확히 기입해 주세요.");
		}

		return result;
	}

	@Override
	public void sendEmail(Mom_info input, String div) throws Exception {
		
		String subject = ""; //제목
		String msg = ""; //내용

		if (div.equals("findpw")) {
			subject = "아부해 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += input.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += input.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = input.getEmail();
		
		mailhelper.sendMail(mail, subject, msg);

	}

	@Override
	public void findPw(HttpServletResponse response, Mom_info input) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Mom_info ck = sqlsession.selectOne("MemberMapper.selectId", input);
		//PrintWriter out = response.getWriter();
		
		ck.setId(input.getId());
		
		// 임시 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		ck.setPassword(pw);
		// 비밀번호 변경
		sqlsession.update("MemberMapper.updatePw", ck);
		sendEmail(ck, "findpw");

		//out.print("이메일로 임시 비밀번호를 발송하였습니다.");
		//out.close();

	}

	@Override
	public Mom_info getMomMember(Mom_info input) throws Exception {
		Mom_info result = null;

		try {
			result = sqlsession.selectOne("MemberMapper.selectMomItem", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
	}

	@Override
	public Sitter_info getSitterMember(Sitter_info input) throws Exception {
		Sitter_info result = null;

		try {
			result = sqlsession.selectOne("MemberMapper.selectSitterItem", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
	}

	@Override
	public Member getMemberItem(Leave_member input) throws Exception {
		Member result = null;

		try {
			result = sqlsession.selectOne("MemberMapper.selectIdItem", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
	}


	@Override
	public int delete3Month() {
		int result = 0;

		try {
			result = sqlsession.delete("MemberMapper.member3MonthDelete");
			if (result == 0) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		}
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
		
	}

	@Override
	public int updateEnddate() {
		int result = 0;

		try {
			result = sqlsession.update("MemberMapper.updateEnddate");
			if (result == 0) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
		}
		
		//반환된 데이터가 있으면 데이터 조회가 있다는 뜻
		return result;
	}

	

}
