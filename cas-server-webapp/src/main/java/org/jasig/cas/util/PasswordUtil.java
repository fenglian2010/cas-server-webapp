package org.jasig.cas.util;

import java.math.BigInteger;
import java.security.MessageDigest;

public class PasswordUtil {
	   public static String makeMD5(String password,int num) {
		MessageDigest md;
		   try {
		    // 生成一个MD5加密计算摘要
		    md = MessageDigest.getInstance("MD5");
		    // 计算md5函数
		    md.update(password.getBytes());
		    // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
		    // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
           
		     
		    String pwd = new BigInteger(1, md.digest()).toString(num);
		    System.out.println(md.digest());
		    return pwd;
		   } catch (Exception e) {
		    e.printStackTrace();
		    return password;
		   }
		}
	   
	   public static String fromMD52Str(String passwordMD) {
		   char[] a = passwordMD.toCharArray();  
	        for (int i = 0; i < a.length; i++){  
	            a[i] = (char) (a[i] ^ 't');  
	        }  
	        String s = new String(a);  
	        return s; 
			}
	   
	   public static void main(String[] args) {
		   String d="123456";
		   System.out.println(makeMD5(d,32));
		   String urlparam="http://dd?up";
		  String[] up= urlparam.split("\\?");
		  System.out.println(up[1]);
//		   System.out.println(fromMD52Str(makeMD5(d)));
//		   System.out.println(fromMD52Str(fromMD52Str(makeMD5(d))));
//		     String pString="artupqwe!@#";
//	     String d="653f1b4ec541075a17abe73c7c6e92ec";
//		     System.out.println("artupqwe!@#    :"+makeMD5(pString));
//		     System.out.println("123456   :"+makeMD5(d));
	}

}
