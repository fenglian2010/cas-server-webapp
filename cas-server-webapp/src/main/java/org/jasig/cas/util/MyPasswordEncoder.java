package org.jasig.cas.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

import org.jasig.cas.authentication.handler.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class MyPasswordEncoder implements PasswordEncoder{
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    @NotNull
    private final String encodingAlgorithm;

    private String characterEncoding;
    
    public MyPasswordEncoder(final String encodingAlgorithm) {
        this.encodingAlgorithm = encodingAlgorithm;
    }
	public String encode(String password) {
		 HttpServletRequest request=((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
	    String urlparam= request.getParameter("channel");
	    if(urlparam.indexOf("?")<0){
	    	return toMD5By16(password);
	    }else{
	    	 String channel=(urlparam.split("\\?"))[1];
	 	    if(channel.equals("up")){//传入的值http://localhost:8080/artupsso/caslogin?up
	 	    	return PasswordUtil.makeMD5(password, 32);
	 	    }else{
	 	    	return ""; //需要修改填值
	 	    }
	 	    
	    }
	   
		
	}
	private String toMD5By16(String password){
		 if (password == null) {
	            return null;
	        }

	        try {
	            MessageDigest messageDigest = MessageDigest
	                .getInstance(this.encodingAlgorithm);

	            if (StringUtils.hasText(this.characterEncoding)) {
	                messageDigest.update(password.getBytes(this.characterEncoding));
	            } else {
	                messageDigest.update(password.getBytes());
	            }


	            final byte[] digest = messageDigest.digest();

	            return getFormattedText(digest);
	        } catch (final NoSuchAlgorithmException e) {
	            throw new SecurityException(e);
	        } catch (final UnsupportedEncodingException e) {
	            throw new RuntimeException(e);
	        }
	}
	
    private String getFormattedText(byte[] bytes) {
        final StringBuilder buf = new StringBuilder(bytes.length * 2);

        for (int j = 0; j < bytes.length; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }
    
    public final void setCharacterEncoding(final String characterEncoding) {
        this.characterEncoding = characterEncoding;
    }

}
