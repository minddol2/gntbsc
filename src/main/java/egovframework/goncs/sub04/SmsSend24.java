package egovframework.goncs.sub04;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.util.ArrayList;
import java.util.Random;
import java.security.*;

import javax.net.ssl.HttpsURLConnection;

import org.apache.commons.codec.binary.Base64;

public class SmsSend24 {

	public static String nullcheck(String str,  String Defaultvalue ) throws Exception  {
         String ReturnDefault = "" ;
         if (str == null)
         {
             ReturnDefault =  Defaultvalue ;
         }
         else if (str == "" )
        {
             ReturnDefault =  Defaultvalue ;
         }
         else
         {
                     ReturnDefault = str ;
         }
          return ReturnDefault ;
    }
   
	public static void Cafe24SmsSend(String tomobile, String contentx) {
		
		String charsetType = "UTF-8";
		String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
        String Result = "";
                
        String user_id = Base64.encodeBase64String("gntb05".getBytes()); // SMS아이디
        String secure = Base64.encodeBase64String("be0accdfeb3ea74d3e36a6b9f4193d02".getBytes());//인증키
        String msg = Base64.encodeBase64String(contentx.getBytes());
        String rphone = Base64.encodeBase64String(tomobile.getBytes());
        String sphone1 = Base64.encodeBase64String("055".getBytes());
        String sphone2 = Base64.encodeBase64String("277".getBytes());
        String sphone3 = Base64.encodeBase64String("8416".getBytes());
        String rdate = Base64.encodeBase64String("".getBytes());
        String rtime = Base64.encodeBase64String("".getBytes());
        String mode = Base64.encodeBase64String("1".getBytes());
        String subject = "";
        String testflag = Base64.encodeBase64String("".getBytes());
        String destination = "";
        String repeatFlag = "";
        String repeatNum = "";
        String repeatTime = "";
        String returnurl = "";
        String nointeractive = Base64.encodeBase64String("1".getBytes());
        String smsType = "";

        String[] host_info = sms_url.split("/");
        String host = host_info[2];
        String path = "/" + host_info[3];
        int port = 80;
        
     // 데이터 맵핑 변수 정의
        String arrKey[]
            = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
                        ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
        String valKey[]= new String[arrKey.length] ;
        valKey[0] = user_id;
        valKey[1] = secure;
        valKey[2] = msg;
        valKey[3] = rphone;
        valKey[4] = sphone1;
        valKey[5] = sphone2;
        valKey[6] = sphone3;
        valKey[7] = rdate;
        valKey[8] = rtime;
        valKey[9] = mode;
        valKey[10] = testflag;
        valKey[11] = destination;
        valKey[12] = repeatFlag;
        valKey[13] = repeatNum;
        valKey[14] = repeatTime;
        valKey[15] = smsType;
        valKey[16] = subject;

        String boundary = "";
        Random rnd = new Random();
        String rndKey = Integer.toString(rnd.nextInt(32000));
        MessageDigest md;
        try {
        	md = MessageDigest.getInstance("MD5");
            byte[] bytData = rndKey.getBytes();
            md.update(bytData);
            byte[] digest = md.digest();
            for(int i =0;i<digest.length;i++) {
                boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
            }
        } catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
		}
        
        boundary = "---------------------"+boundary.substring(0,11);

        // 본문 생성
        String data = "";
        String index = "";
        String value = "";
        for (int i=0;i<arrKey.length; i++)
        {
            index =  arrKey[i];
            value = valKey[i];
            data +="--"+boundary+"\r\n";
            data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
            data += "\r\n"+value+"\r\n";
            data +="--"+boundary+"\r\n";
        }

        //out.println(data);
        try {
        
        	InetAddress addr = InetAddress.getByName(host);
            Socket socket = new Socket(host, port);
            
            // 헤더 전송
            BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
            wr.write("POST "+path+" HTTP/1.0\r\n");
            wr.write("Content-Length: "+data.length()+"\r\n");
            wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
            wr.write("\r\n");

            // 데이터 전송
            wr.write(data);
            wr.flush();

            // 결과값 얻기
            BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
            String line;
            String alert = "";
            ArrayList tmpArr = new ArrayList();
            while ((line = rd.readLine()) != null) {
                tmpArr.add(line);
            }
            wr.close();
            rd.close();
            
            String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
            String[] rMsg = tmpMsg.split(",");
            Result= rMsg[0]; //발송결과
            System.out.println("Result : " + Result);
            
        } catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("error");
		}
        
	}
	
	public static void AuthSms() {
		try {
	           String apiUrl =  "https://sslsms.cafe24.com/smsSenderPhone.php";
	            String userAgent = "Mozilla/5.0";
	            String postParams = "userId=gntb05&passwd=be0accdfeb3ea74d3e36a6b9f4193d02";
	            URL obj = new URL(apiUrl);
	            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("User-Agent", userAgent);

	            // For POST only - START
	            con.setDoOutput(true);
	            OutputStream os = con.getOutputStream();
	            os.write(postParams.getBytes());
	            os.flush();
	            os.close();
	            // For POST only - END

	            int responseCode = con.getResponseCode();
	            System.out.println("POST Response Code :: " + responseCode);

	            if (responseCode == HttpURLConnection.HTTP_OK) { //success
	                BufferedReader in = new BufferedReader(new InputStreamReader(
	                        con.getInputStream()));
	                String inputLine;
	                StringBuffer buf = new StringBuffer();

	                while ((inputLine = in.readLine()) != null) {
	                    buf.append(inputLine);
	                }
	                in.close();
	                System.out.print(buf.toString());
	            } else {
	            	System.out.println("POST request not worked");
	            }
	    } catch(IOException ex){

	    }
	}
	
}
