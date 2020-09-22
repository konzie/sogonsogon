package com.kh.sogon.mypage.model.vo;

import java.sql.Timestamp;

public class HelpAnswer {
   private int answerNo;                  
    private String answerContent;         
    private int parentHelpNo;            
    private String writer;            
    private Timestamp answerCreateDate;    
    private Timestamp answerModifyDate;    
    private String answerStatus;     
    
    public HelpAnswer() {
      // TODO Auto-generated constructor stub
   }

   public HelpAnswer(int answerNo, String answerContent, int parentHelpNo, String writer, Timestamp answerCreateDate,
         Timestamp answerModifyDate, String answerStatus) {
      super();
      this.answerNo = answerNo;
      this.answerContent = answerContent;
      this.parentHelpNo = parentHelpNo;
      this.writer = writer;
      this.answerCreateDate = answerCreateDate;
      this.answerModifyDate = answerModifyDate;
      this.answerStatus = answerStatus;
   }

   public int getAnswerNo() {
      return answerNo;
   }

   public void setAnswerNo(int answerNo) {
      this.answerNo = answerNo;
   }

   public String getAnswerContent() {
      return answerContent;
   }

   public void setAnswerContent(String answerContent) {
      this.answerContent = answerContent;
   }

   public int getParentHelpNo() {
      return parentHelpNo;
   }

   public void setParentHelpNo(int parentHelpNo) {
      this.parentHelpNo = parentHelpNo;
   }

   public String getWriter() {
      return writer;
   }

   public void setWriter(String writer) {
      this.writer = writer;
   }

   public Timestamp getAnswerCreateDate() {
      return answerCreateDate;
   }

   public void setAnswerCreateDate(Timestamp answerCreateDate) {
      this.answerCreateDate = answerCreateDate;
   }

   public Timestamp getAnswerModifyDate() {
      return answerModifyDate;
   }

   public void setAnswerModifyDate(Timestamp answerModifyDate) {
      this.answerModifyDate = answerModifyDate;
   }

   public String getAnswerStatus() {
      return answerStatus;
   }

   public void setAnswerStatus(String answerStatus) {
      this.answerStatus = answerStatus;
   }

   @Override
   public String toString() {
      return "Answer [answerNo=" + answerNo + ", answerContent=" + answerContent + ", parentHelpNo=" + parentHelpNo
            + ", writer=" + writer + ", answerCreateDate=" + answerCreateDate + ", answerModifyDate="
            + answerModifyDate + ", answerStatus=" + answerStatus + "]";
   }
    
    

}