package com.dy.utils;

import java.io.FileOutputStream;
import java.io.IOException;

import sun.misc.BASE64Decoder;

public class Base64File {
	
	/** 
	   * 将base64字符解码保存文件 
	   * 
	   * @param base64Code 
	   * @param targetPath 
	   * @throws Exception 
	   */
	  
	  public static void decoderBase64File(String base64Code, String targetPath) { 
	    byte[] buffer; 
	    FileOutputStream out = null; 
	    try { 
	      buffer = new BASE64Decoder().decodeBuffer(base64Code); 
	      out = new FileOutputStream(targetPath); 
	      out.write(buffer); 
	    } catch (IOException e) { 
	      e.printStackTrace(); 
	    } finally { 
	      try { 
	        if (out != null) { 
	          out.close(); 
	        } 
	      } catch (IOException e) { 
	        e.printStackTrace(); 
	      } 
	    } 
	  } 


}
