package com.kh.sogon.mypage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.kh.sogon.member.model.vo.Member;

public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 비밀번호 확인 DAO
	 * @param memberNo
	 * @return result
	 */
	public String checkPwd(Member loginMember) {
		return sqlSession.selectOne("myapageMapper.selectPwd", loginMember);
	}


	/** 회원 정보 수정 DAO
	 * @param loginMember
	 * @param newPwd1
	 * @return result
	 */
	public int updateInfo(Member loginMember, String newPwd1) {
		return sqlSession.selectOne("myapageMapper.updateInfo", loginMember);
	}
	
	
}
