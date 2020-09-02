package com.kh.sogon.member.model.dao;

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

}
