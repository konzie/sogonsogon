package com.kh.sogon.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sogon.member.model.vo.Member;
import com.kh.sogon.board.model.vo.Board;
import com.kh.sogon.help.model.vo.Help;
import com.kh.sogon.board.model.vo.PageInfo;
import com.kh.sogon.board.model.vo.Reply;

@Repository
public class MypageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 비밀번호 확인 DAO
	 * @param memberNo
	 * @return result
	 */
	public String checkPwd(int memberNo) {
		return sqlSession.selectOne("myapageMapper.checkPwd", memberNo);
	}


	/** 회원 정보 수정 DAO
	 * @param loginMember
	 * @param newPwd1
	 * @return result
	 */
	public int updateInfo(Member upMember) {
		return sqlSession.update("myapageMapper.updateInfo", upMember);
	}

	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int deleteInfo(int memberNo) {
		return sqlSession.update("mypageMapper.deleteInfo", memberNo);
	}

	/** 전체 공지사항 수 조회 DAO
	 * @return noticeList
	 */
	public int getListNCount() {
		return sqlSession.selectOne("mypageMapper.getListNCount");
	}

	/** 페이징바에 따라 공지사항 조회 DAO
	 * @param pInfo
	 * @return
	 */
	public List<Board> selectNList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectNList", null, rowBounds);
	}
	
	/** 전체 멤버 수 조회 DAO
	 * @return listCount
	 */
	public int getListMCount() {
		return sqlSession.selectOne("mypageMapper.getListMCount");
	}

	/** 페이징바에 따라 멤버 조회 DAO
	 * @param pInfo
	 * @return memberList
	 */
	public List<Member> selectMList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectMList", null, rowBounds);
	}


	public int getListQCount() {
		return sqlSession.selectOne("mypageMapper.getListQCount");
	}


	public List<Help> selectQList(PageInfo pInfo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectQList", null, rowBounds);
	}


	public int getListBCount(int memberNo) {

		return sqlSession.selectOne("mypageMapper.getListBCount", memberNo);
	}


	public List<Board> selectBList(PageInfo pInfo, int memberNo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectBList", memberNo, rowBounds);
	}

	public int getListRCount(int memberNo) {
		return sqlSession.selectOne("mypageMapper.getListRCount", memberNo);
	}

	public List<Reply> selectRList(PageInfo pInfo, int memberNo) {
		
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectRList", memberNo, rowBounds);
	}

	public int reportCount() {
		return sqlSession.selectOne("mypageMapper.reportCount");
	}


	public int qnaCount() {
		return sqlSession.selectOne("mypageMapper.qnaCount");
	}


	public int roomCount() {
		return sqlSession.selectOne("mypageMapper.roomCount");
	}


	public int memberCount() {
		return sqlSession.selectOne("mypageMapper.memberCount");
	}

	public int getListDCount() {
		return sqlSession.selectOne("mypageMapper.getListDCount");
	}

	public List<Board> selectReport() {
		return sqlSession.selectList("mypageMapper.selectReport");
	}
	
	public List<Board> selectDList(PageInfo pInfo) {
				
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("mypageMapper.selectDList", rowBounds);
	}


	
}
