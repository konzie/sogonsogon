package com.kh.sogon.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 로그인DAO
	 * @param member
	 * @return
	 */
	public Member login(Member member) {
		return sqlSession.selectOne("memberMapper.loginMember",member);
	}

	/** 아이디 중복검사 DAO
	 * @param memberId
	 * @return result
	 */
	public int idDupCheck(String memberId) {
		return sqlSession.selectOne("memberMapper.idDupCheck", memberId);
	}
	
	/** 회원가입 (연락처 중복검사 DAO)
	 * @param memberPhone
	 * @return result
	 */
	public int phoneDupCheck(int memberPhone) {
		return sqlSession.selectOne("memberMapper.phoneDupCheck", memberPhone);
	}

	/** 회원가입 DAO
	 * @param signUpMember
	 * @return result
	 */
	public void signUp(Member signUpMember)throws Exception {
		sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	
	/** 회원가입 (이메일 인증 코드 확인)
	 * @param authkey
	 * @return
	 * @throws Exception
	 */
	public Member chkAuth(String authKey) throws Exception {
		return sqlSession.selectOne("memberMapper.chkAuthkey", authKey);
	}
	
	/** 회원가입 (인증 후 계정 활성화)
	 * @param member
	 * @throws Exception
	 */
	public void successAuthkey(Member member) throws Exception {
		sqlSession.update("memberMapper.keyConfirm", member);
	}
	
	
	
	/** 아이디찾기 DAO 
	 * @param findIdMember
	 * @return
	 */
	public String findId(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.findId", map);
	}

	/** 비밀번호찾기 DAO (임시비밀번호로 변경)
	 * @param paramMap
	 * @return
	 */
	public int findPwd(Map<String, Object> paramMap) {
		return sqlSession.update("memberMapper.findPwd", paramMap);

	}


	
	
	
	
}
