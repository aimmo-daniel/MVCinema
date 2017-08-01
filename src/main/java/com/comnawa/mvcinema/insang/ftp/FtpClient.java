package com.comnawa.mvcinema.insang.ftp;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPReply;
 
public class FtpClient {
 
    private String svrIp= "192.168.0.5";
    private String path;
    
    public FtpClient(String path) {
      this.path= path;
    }
    
    /**
     * 파일 업로드
     * @param org 원본파일
     * @param targetFile 저장할 파일위치/파일명
     * @throws IOException 
     * @throws SocketException 
     */
    public boolean upload(File org, String targetFile)
            throws SocketException, IOException, Exception {
        
        FileInputStream fis = null;
        org.apache.commons.net.ftp.FTPClient clnt = new org.apache.commons.net.ftp.FTPClient();
        clnt.setControlEncoding("utf-8");
        
        try {
            clnt.connect(svrIp, 21);
            //clnt.setBufferSize(1024*1024);
            int reply = clnt.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                throw new Exception("ftp connection refused");
            }
            clnt.setSoTimeout(1000 * 10);
            clnt.login("anonymous", "");
            clnt.setFileType(FTP.BINARY_FILE_TYPE);
            
            
            clnt.enterLocalActiveMode();
            
            //clnt.enterLocalPassiveMode();
            //clnt.changeWorkingDirectory(defaultPath);
            //clnt.makeDirectory("");
            fis = new FileInputStream(org);
            return clnt.storeFile(targetFile, fis);
        } finally {
            if (clnt.isConnected()) {
                clnt.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }
}
