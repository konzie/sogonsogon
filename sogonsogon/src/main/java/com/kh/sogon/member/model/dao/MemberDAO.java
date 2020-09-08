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

	/** 회원가입 DAO
	 * @param signUpMember
	 * @return result
	 */
	public int signUp(Member signUpMember)throws Exception {
		return sqlSession.insert("memberMapper.signUp", signUpMember);
	}

	/** 아이디찾기 DAO 
	 * @param findIdMember
	 * @return
	 */
	public String findId(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.findId", map);
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
