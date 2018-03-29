package com.dy.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2018-3-27
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091000480106";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCXxPMKrUkoI6/Qe6bgNuSYEPNU5jUTLsI9fSVMw+nYBEPlqnFgpdSDm7jCnhpb1vghCLCfTvc82qbK/sLPWGQnPA0MZopyKmg9Qz7fU9gX1Qm8zbTGyFalVjlyw70taYrgy2+hRDDKv8xL6KYrkyEPs1U6T6NAmcskxgqzp1vfaHjsP20I4XWEXzhl7TfHGuaUV99vyy1ypOLw5DHegTquszR6VMgNJZ7FUzPt8b9S7hYHqw5O83PuFv7vomLCLV+X4lPwvw1F8WTKbInWnyJJd1G+YFrnrUo63gUT8KVKMK77Fugn2jiXG9tUolGZlffm1lEFhZ9QZ7Qqsz0jcb7zAgMBAAECggEBAJA2g0NH+dX8YxnWBXHUd07P/IhV32UE72mCOylAmDm9g87+MJHHwbH1DJFRrnZKRKkPGtWmMWRP2GHXxsFDmpd1hmicHz3wcfCUr2+CujmbI4+WYArrXvnoftpAiMhYG7ETXlV8+GgP7E7NGOka+zVyELBB8Dx4ZwHgdVbU1oXnxzW8JZnCOP/QGdax5NpCmmo/6qSZzQR19bssZtQTpPHjmGDyjOU10cgWPRCSQlJ3eEDJtBgBFZR0ol6e472pB7unxPOHWOfC1Ey+j6wH6hakJXw+JiZ5wHb82SU+OHTF2E/tssbQzHiiaTFQ2JrCTtYQlWJgMR9yg5HivZ8RvUECgYEAxV48d5N37d+5KPN5iQtPAYTKXEh9wNNlKgrkVfGy+6m8abYdUDNKmlQtwKVRALtE71cd+HIKr0pU5BKtSj5XWTErst6UpzcnnrNuLjiBRb8cwHWc/ANm8DFpaWGoo/DGIEIk0M/IQixjhiVdOIMkeweAn+4IP/3zdvhT55SWtVECgYEAxNrx5sZnvAHYfm3OxeCKpw6jiN+sQ3aH6IOX0CZIJUM7soB9jx6WFRETRovC2DVWgvYIe1H9dKkcFITdV3mH8htv8clcaN+OMM9DgDwba0ze52nZUjHdGfp4WTkthB66cY+XH4GPCuyYV7wIs5V1AiMLBjcxyKkOFo2RCV437wMCgYAbDw1pM22Yzjhbde3urP867RK1Tjb3bcQL3IxrgASS3jV3pMEmErIisHHJXKDbYdFUovP38OKoH5+92RWq/RsKnmQoVL26oyQqbN0pNxP6FPaDKFzKbEj7mzqheQMe3s6683aKrkH9WIqYhJzgN5KTz3aB9qdo5o8ve2I9eLCk0QKBgFyXAppiDZ6fW52ztkLaJz0GJKMXWWXt1WTmqDwuFVb5dZWy29u6LitAecl/qSiahdNZN4oReV4qwFtiVt1y+x9ECnY2GLH3HGEWy5AANYFVia5c2evQKkeyyHJm82KmNVl+iT03aflgaRMzDQCytnNH2kKVKWRRJ6Ax+9rlJvfTAoGAQorisIR+XqEZl4VfM8zuLxj1tN3AznQUtFBBxDMp2fgNcNahb/jlWp7W6ghRCzchIH7yFijc+qyKVP2uyE5rvhsd0e0AmqwT/CCBeoJ1G8M1VFTjBsH+Y4XZe09uqR0shW9AH+JjCEGiNrDyi0GJQv7mD80obyGwoifjwjz7x+g=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmgSlFyG16+1iysFUOV6oYTZItoDoqWj78VRht6FS4gtsAVzJXwjArsEwmu9ZWfDrxIbnEtEJDCHaKmquDadZHA0F/hsCeNx/vkUxBymxNNTVLQ5t+UHyCOp4/+jZHXYDvqkds5F9Rn+0hVfndsVzpPOGeas0D8ShkfRJJZOkehBpUYc1rBOrJ5j8r6D7SKpf7TMBn+N9MX3KmhIf2qFVYBjrCcOebfyShI3n+Lj/5YAySWAZOosep0eeSOuto22CXEIwNciIpi2/SWN13XUNIXJwoD1dAqepeisS+v1sAzCX0A7OouhhD6HK4P0mRpbh8bv8DbHZj0IVpFepF59suwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /*efxvqy.8ahpmw*/
	public static String notify_url = "http://hyq3jn.natappfree.cc/TeaEquStore/showOrderList";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://hyq3jn.natappfree.cc/TeaEquStore/returnUrl";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "e:\\zhifubao\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

