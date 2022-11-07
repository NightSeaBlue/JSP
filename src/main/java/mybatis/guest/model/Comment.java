package mybatis.guest.model;

import java.io.Serializable;

/*
 *	직렬화
 *		- class 뒤에 implements Serializable
 *		- 통신 상에 전송하는 객체의 경우 직렬화를 해야 함 
 */

public class Comment implements Serializable{
	private int commentNo;
	private String userId;
	private String commentContent; // commentContent
	private String regDate;
	
	//Setter,Getter
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
}
