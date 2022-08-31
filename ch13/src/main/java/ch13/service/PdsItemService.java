package ch13.service;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ch13.dao.PdsItem;
import ch13.dao.PdsItemDao;
public class PdsItemService {
	public int insert(HttpServletRequest request) {
		int result = 0;
//		jsp에서 실제 주소 application.getrealPath("/upload"); // 실제 저장위치 meta-data
//		String real = request.getRealPath("/upload"); // 구 버전
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10;  // 10M
		try {
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			String fileName = mr.getFilesystemName("file"); // 저장된 파일명
			String description = mr.getParameter("description");
			File file = new File(real+"/"+fileName);
			int fileSize = (int)file.length();
//	파일명이 한글이 경우, 맥을 사용하면 한글이 깨짐 UUID의 random()사용하거나 날자/시간으로 파일명 변경	
//			file.renameTo(new File("폴더/파일명")); // 윈도 특정 폴더 저장
//			Table에 저장하기 위해서는 DTO생성하여 데이터를 담고 Dao를 통하여 입력
			PdsItem pi = new PdsItem();
			pi.setFileName(fileName);
			pi.setFileSize(fileSize);
			pi.setDescription(description);
			PdsItemDao pid = PdsItemDao.getInstance();
			result = pid.insert(pi);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public List<PdsItem> list() {
		PdsItemDao pid = PdsItemDao.getInstance();
		List<PdsItem> list = pid.list(); 
		return list;
	}

}