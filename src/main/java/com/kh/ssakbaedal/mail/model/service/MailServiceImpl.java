package com.kh.ssakbaedal.mail.model.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.kh.ssakbaedal.mail.model.vo.Mail;

@Service("mailService")
public class MailServiceImpl implements MailService {

   @Autowired
   JavaMailSender mailSender;
 
   @Override
   public void sendEmail(Mail mail) {

       final MimeMessagePreparator preparator = new MimeMessagePreparator() {
           @Override
           public void prepare(MimeMessage mimeMessage) throws Exception {
               final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
               
               helper.setFrom(new InternetAddress(mail.getMailFrom(),"(주)싹배달","euc-kr"));
               helper.setTo(mail.getMailTo()); //sender
               helper.setSubject(mail.getMailSubject()); // mail title
               helper.setText(mail.getMailContent(), true); // mail content
           }
       };

       mailSender.send(preparator);
   }
}

