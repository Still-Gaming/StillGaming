package com.kh.jsp.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File str) {
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_hhmmss");
		
		int ran = (int)(Math.random() * 10000);
		
		String name = str.getName();
		String body = "";
		String ext = "";
		
		int dot = name.lastIndexOf(".");
		
		if(dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);
		} else {
			body = name;
		}
		
		String fileName = sdf.format(new Date(currentTime)) + "_" + ran + ext;
		
		File newFile = new File(str.getParentFile(), fileName);
		
		return newFile;
	}

}
