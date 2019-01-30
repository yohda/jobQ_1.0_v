package egovframework.example.admin.sidebar.member.error;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import egovframework.example.admin.sidebar.member.error.exception.MemberExcelOutputException;
import egovframework.example.admin.sidebar.member.error.exception.MemberRegisterException;
import egovframework.example.admin.sidebar.member.error.exception.MemberSearchNotFoundException;

// Jobq Admin Member에서 발생하는 모든 Exception을 이 클래스에서 다룬다.
@Component
@ControllerAdvice(basePackages = "egovframework.example.admin.sidebar.member.web")
public class MemberExceptionController {
	
	@ExceptionHandler
	public String handleMemberRegisterException(MemberRegisterException exception){
		return "";
	}
	
	@ExceptionHandler(MemberExcelOutputException.class)
	public String handleMemberExcelOutputException(MemberExcelOutputException exception){
		return "";
	}
	
	@ExceptionHandler(MemberSearchNotFoundException.class)
	public String handleMemberSearchNotFoundException(MemberSearchNotFoundException exception){
		return "";
	}
}
