package org.kosta.gogocamping.model.domain;

import java.util.Random;

public class GenerateCertNumber{
    private int certNumLength = 6;
    
    public String excuteGenerate() {
        Random random = new Random(System.currentTimeMillis());
        
        int range = (int)Math.pow(10,certNumLength);
        int trim = (int)Math.pow(10, certNumLength-1);
        int result = random.nextInt(range)+trim;
         
        if(result>range){
            result = result - trim;
        }
        
        return String.valueOf(result);
    }

    public int getCertNumLength() {
        return certNumLength;
    }

    public void setCertNumLength(int certNumLength) {
        this.certNumLength = certNumLength;
    }
    
	/*
	 * public static void main(String[] args) { 
	 * 		GenerateCertNumber ge = new GenerateCertNumber(); 
	 * 		ge.setCertNumLength(6);
	 * 		System.out.println(ge.excuteGenerate()); 
	 * }
	 */
	/*
	 * public static void main(String[] args) { 
	 * 		Date date = new Date();
	 * 		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddS", Locale.KOREA);
	 * 		String today = sdf.format(date); 
	 * 		System.out.println(today); 
	 * }
	 */
}

