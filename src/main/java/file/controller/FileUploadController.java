package file.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import file.bean.FileDTO;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	
	
	@GetMapping("/uploadForm")
	public String uploadForm() {
		System.out.println("upload form");
		return "/file/uploadForm";
	}
	
	
	@PostMapping("/fileUpload")
	//getOriginalFilename()시 크롬과 IE의 결과값이 약간 다르다..
	public void fileUpload(MultipartFile[] uploadFile, Model model)  {
		
		URL r = this.getClass().getResource("");

		String path = r.getPath();
		
		System.out.println(path+"아아아아아");
		
		for (MultipartFile multipartFile : uploadFile) {
			System.out.println("-----------------------");
			System.out.println("upload file name : " + multipartFile.getOriginalFilename());
			System.out.println("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//IE fileName
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("only file name : " + uploadFileName);
			
			//File saveFile = new File(uploadFolder, uploadFileName);
			
//			try {
//				multipartFile.transferTo(saveFile);
//			} catch (IllegalStateException | IOException e) {
//				e.printStackTrace();
//			}
		}
		
	}
	
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		System.out.println("uploadAjax");
	}
	
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public List<FileDTO> fileUploadAjax(MultipartFile[] uploadFile, Model model)  {
		URL r = this.getClass().getResource("");

		String path = r.getPath();
		
		System.out.println(path+"아아아아아");
		List<FileDTO> list = new ArrayList<>();
		
		String uploadFolder = "C:\\thec";
		
		String uploadFolderPath = getFolder();
		//make folder
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		
		
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			
			FileDTO fileDTO = new FileDTO();
			
			System.out.println("-----------------------");
			System.out.println("upload file name : " + multipartFile.getOriginalFilename());
			System.out.println("upload file size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			fileDTO.setFileName(uploadFileName);
			
			//IE fileName
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			System.out.println("only file name : " + uploadFileName);
			
			//파일명 중복시, 파일을 덮어쓰기 때문에 파일명 중복을 막기위한 처리
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			System.out.println("uuid file name : " + uploadFileName);
			System.out.println("uploadPath : " + uploadPath);
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			fileDTO.setUuid(uuid.toString());
			fileDTO.setUploadPath(uploadFolderPath);
			
			System.out.println("fileDTO: " + fileDTO);
			try {
				multipartFile.transferTo(saveFile);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			//add to list
			list.add(fileDTO);
			
		} //end for
		
		return list;
	}
	
	
	//이미지 경로 요청하여 이미지 보기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		System.out.println("fileName : " + fileName);
		
		File file = new File("c:\\thec\\" + fileName);
		//File file = new File(fileName);
		
		System.out.println("file : " + file);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	@GetMapping(value =  "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	//MIME 타입을 다운로드 할 수 있는 APPLICATION_OCTET_STREAM_VALUE 타입으로 설정
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
		System.out.println("download file : " + fileName);
		Resource resource = new FileSystemResource("c:\\thec\\" + fileName);
		System.out.println("resource : " + resource);
		System.out.println("resource.getFilename() : " + resource.getFilename());
		System.out.println("userAgent : " + userAgent);
		if (resource.exists() == false) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			String downloadName = null;
			
			//브라우저가 인터넷 익스플로러의 경우
			if (userAgent.contains("Trident")) {
				System.out.println("Internet Explorer");
				downloadName = URLEncoder.encode(resourceName, "UTF-8").replaceAll("\\" + ",", " ");
				System.out.println("Internet Explorer name : " + downloadName);
				
			//브라우저가 마이크로소프트 Edge의 경우
			} else if (userAgent.contains("Edg")) {
				System.out.println("Microsoft Edge");
				downloadName = URLEncoder.encode(resourceName, "UTF-8");
				System.out.println("Microsoft Edge name : " + downloadName);
			
			//브라우저가 Chrome의 경우
			} else {
				System.out.println("Chrome");
				downloadName = new String(resourceName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			//다운로드시 저장되는 이름을 Content-Disposition을 통하여 지정함
			headers.add("Content-Disposition", "attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName) {
		System.out.println("delete File : " + fileName);
		File file;
		
		try {
			System.out.println("decoding : " + URLDecoder.decode(fileName, "UTF-8"));
			file = new File("c:\\thec\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
}
