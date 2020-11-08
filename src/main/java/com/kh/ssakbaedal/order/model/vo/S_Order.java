package com.kh.ssakbaedal.order.model.vo;

import java.util.ArrayList;
import java.util.Date;

public class S_Order {
   
   private int mNo; //주문한회원번호
   private String mPhone; //주문한회원번호
   
   private int deliveryCharge; //배달비
   
   private int oNo; //주문번호
   private Date oTime; //주문날짜
   private String request; //주문요청사항
   private String oPrice; //총결제금액
   private String oAddress; //주문주소
   private String oStatus; //주문상태  1->결제완료 2->주문접수 3->기사픽업
   private int arrivalTime; //배달예상시간
   private int smNo; //매장번호
   private String oPhone; //고객 전화번호
   
   
   public S_Order() {}

   public S_Order(int mNo, String mPhone, int deliveryCharge, int oNo, Date oTime, String request, String oPrice,
         String oAddress, String oStatus, int arrivalTime, int smNo, String oPhone) {
      super();
      this.mNo = mNo;
      this.mPhone = mPhone;
      this.deliveryCharge = deliveryCharge;
      this.oNo = oNo;
      this.oTime = oTime;
      this.request = request;
      this.oPrice = oPrice;
      this.oAddress = oAddress;
      this.oStatus = oStatus;
      this.arrivalTime = arrivalTime;
      this.smNo = smNo;
      this.oPhone = oPhone;
   }

   public int getmNo() {
      return mNo;
   }

   public void setmNo(int mNo) {
      this.mNo = mNo;
   }

   public String getmPhone() {
      return mPhone;
   }

   public void setmPhone(String mPhone) {
      this.mPhone = mPhone;
   }

   public int getDeliveryCharge() {
      return deliveryCharge;
   }

   public void setDeliveryCharge(int deliveryCharge) {
      this.deliveryCharge = deliveryCharge;
   }

   public int getoNo() {
      return oNo;
   }

   public void setoNo(int oNo) {
      this.oNo = oNo;
   }

   public Date getoTime() {
      return oTime;
   }

   public void setoTime(Date oTime) {
      this.oTime = oTime;
   }

   public String getRequest() {
      return request;
   }

   public void setRequest(String request) {
      this.request = request;
   }

   public String getoPrice() {
      return oPrice;
   }

   public void setoPrice(String oPrice) {
      this.oPrice = oPrice;
   }

   public String getoAddress() {
      return oAddress;
   }

   public void setoAddress(String oAddress) {
      this.oAddress = oAddress;
   }

   public String getoStatus() {
      return oStatus;
   }

   public void setoStatus(String oStatus) {
      this.oStatus = oStatus;
   }

   public int getArrivalTime() {
      return arrivalTime;
   }

   public void setArrivalTime(int arrivalTime) {
      this.arrivalTime = arrivalTime;
   }

   public int getSmNo() {
      return smNo;
   }

   public void setSmNo(int smNo) {
      this.smNo = smNo;
   }

   public String getoPhone() {
      return oPhone;
   }

   public void setoPhone(String oPhone) {
      this.oPhone = oPhone;
   }
   

   @Override
   public String toString() {
      return "S_Order [mNo=" + mNo + ", mPhone=" + mPhone + ", deliveryCharge=" + deliveryCharge + ", oNo=" + oNo
            + ", oTime=" + oTime + ", request=" + request + ", oPrice=" + oPrice + ", oAddress=" + oAddress
            + ", oStatus=" + oStatus + ", arrivalTime=" + arrivalTime + ", smNo=" + smNo + ", oPhone=" + oPhone
            + "]";
   }

}