package com.dy.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

/**
 * 日期转换
 */
public class DateChangeString {

	public static String daToStr(Date dateTime) {
		String datoStr;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		datoStr = format.format(dateTime);
		return datoStr;

	}

}