package com.dy.service.test;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import java.util.Properties;

/**
 * 邮件工具类
 */
public class EmailUtil {
   /**
    * 发送邮件
    * @param to 给谁发
    * @param text 发送内容
    */
   /*public static void send_mail(String to,String text) throws MessagingException {
       //创建连接对象 连接到邮件服务器
       Properties properties = new Properties();         //设置发送邮件的基本参数
       //发送邮件服务器
       properties.put("mail.smtp.host", "smtp.qq.com");
       //发送端口
       properties.put("mail.smtp.port", "25");
       properties.put("mail.smtp.auth", "true");
       //设置发送邮件的账号和密码
       Session session = Session.getInstance(properties, new Authenticator() {
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {
               //两个参数分别是发送邮件的账户和密码ousfhlbjmmezbbjf
               return new PasswordAuthentication("1391674791@qq.com","krvprsluwchyhiac");
           }         });

       //创建邮件对象
       Message message = new MimeMessage(session);
       //设置发件人
       message.setFrom(new InternetAddress("1391674791@qq.com"));
       //设置收件人
      message.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
       //设置主题
       message.setSubject("您在yummy注册账号,请验证您的信息");
       //设置邮件正文  第二个参数是邮件发送的类型
       message.setContent(text,"text/html;charset=UTF-8");
       //发送一封邮件
       Transport.send(message);
   }
   
   
   public static void main(String[] args) throws MessagingException {
	   send_mail("1391674791@qq.com","哈哈");
}*/
	
	/*static ApplicationContext actx = new ClassPathXmlApplicationContext(
			"applicationContext.xml");
	static MailSender sender = (MailSender) actx.getBean("mailSender");
	static SimpleMailMessage mailMessage = (SimpleMailMessage) actx.getBean("mailMessage");
	public static void main(String args[]) throws MessagingException {		
		mailMessage.setSubject("你好");
		mailMessage.setText("这个是一个通过Spring框架来发送邮件的小程序");
		mailMessage.setTo("1391674791@qq.com");
		sender.send(mailMessage);
	}
   */
   
}