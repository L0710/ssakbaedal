package com.kh.ssakbaedal.mail.model;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
   
	  @Bean
	    public JavaMailSender getMailSender() {
	        
	        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	        
	        mailSender.setHost("smtp.naver.com");
	        mailSender.setPort(587);
	        mailSender.setUsername("abc7846www");
	        mailSender.setPassword("qlqjsdms2020");
	       
	        Properties prop = new Properties();
	        
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.transport.protocol", "smtp");
	        prop.put("mail.debug", "true");

	 
	        mailSender.setJavaMailProperties(prop);
	        
	        return mailSender;
	    }
}


