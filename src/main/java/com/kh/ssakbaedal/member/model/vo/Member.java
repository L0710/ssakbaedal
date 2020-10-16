package com.kh.ssakbaedal.member.model.vo;
 
import java.sql.Date;
 
public class Member {
	/*MNO	NUMBER
	MID	VARCHAR2(30 BYTE)
	MPWD	VARCHAR2(100 BYTE)
	MNAME	VARCHAR2(15 BYTE)
	MEMAIL	VARCHAR2(100 BYTE)
	MPHONE	VARCHAR2(13 BYTE)
	BIRTH	VARCHAR2(20 BYTE)
	GENDER	VARCHAR2(1 BYTE)
	M_ENROLL_DATE	DATE
	M_MODIFY_DATE	DATE
	M_STATUS	VARCHAR2(1 BYTE)
	M_GRADE	VARCHAR2(20 BYTE)
	M_TYPE	VARCHAR2(1 BYTE)
	POINT	NUMBER
	PRICE_SUM	NUMBER*/
	
	private int mNo;
	private String mId;
	private String mPwd;
	private String mName;
	private String mEmail;
	private String mPhone;
	private String birth;
	private String gender;
	private Date mEnrollDate;
	private Date mModifyDate;
	private String mStatus;
	private String mGrade;
	private String mType;
	private int point;
	private int priceSum;
	
	public Member() {}

	public Member(int mNo, String mId, String mPwd, String mName, String mEmail, String mPhone, String birth,
			String gender, Date mEnrollDate, Date mModifyDate, String mStatus, String mGrade, String mType, int point,
			int priceSum) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.birth = birth;
		this.gender = gender;
		this.mEnrollDate = mEnrollDate;
		this.mModifyDate = mModifyDate;
		this.mStatus = mStatus;
		this.mGrade = mGrade;
		this.mType = mType;
		this.point = point;
		this.priceSum = priceSum;
	}

	
	public Member(String mId, String mName, String mEmail) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.mEmail = mEmail;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getmEnrollDate() {
		return mEnrollDate;
	}

	public void setmEnrollDate(Date mEnrollDate) {
		this.mEnrollDate = mEnrollDate;
	}

	public Date getmModifyDate() {
		return mModifyDate;
	}

	public void setmModifyDate(Date mModifyDate) {
		this.mModifyDate = mModifyDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getmGrade() {
		return mGrade;
	}

	public void setmGrade(String mGrade) {
		this.mGrade = mGrade;
	}

	public String getmType() {
		return mType;
	}

	public void setmType(String mType) {
		this.mType = mType;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getPriceSum() {
		return priceSum;
	}

	public void setPriceSum(int priceSum) {
		this.priceSum = priceSum;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", mEmail=" + mEmail
				+ ", mPhone=" + mPhone + ", birth=" + birth + ", gender=" + gender + ", mEnrollDate=" + mEnrollDate
				+ ", mModifyDate=" + mModifyDate + ", mStatus=" + mStatus + ", mGrade=" + mGrade + ", mType=" + mType
				+ ", point=" + point + ", priceSum=" + priceSum + "]";
	}

	
	
	
}
