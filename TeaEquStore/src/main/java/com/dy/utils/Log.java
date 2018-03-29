package com.dy.utils;

import org.apache.log4j.Logger;

public class Log {

	private static Logger Log = Logger.getLogger(Log.class.getName());

	public static void startTextCase(String sTextCaseName) {
		Log.info("-----------------------------------------------------------------------------------------");
		Log.info("***********************************" + sTextCaseName + "*************************************");
	}

	public static void endTestCase(String sTextCaseName) {

		System.out.println("****************测试用例结束******************************");
		System.out.println("----------------------------------------------------------");

		System.out.println();

	}

	public static void info(String message) {
		Log.info(message);
	}

	// 定义个warn方法 打印 warn级别的信息 ；
	public static void warn(String message) {
		Log.warn(message);

	}

	// 定义个 error 方法 打印自定义的错误信息 ；
	public static void error(String message) {
		Log.error(message);

	}

	// fatal(重大的 致命的) 定义一个fatal 方法 ，打印重大级别的信息 ；
	public static void fatal(String message) {
		Log.fatal(message);

	}

	// 定义一个debug方法打印自定义的 debug信息 ！
	public static void debug(String message) {

		Log.debug(message);

	}
}
