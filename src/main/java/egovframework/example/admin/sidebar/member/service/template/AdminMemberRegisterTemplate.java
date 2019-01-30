package egovframework.example.admin.sidebar.member.service.template;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.security.crypto.password.PasswordEncoder;

import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;
import egovframework.example.admin.sidebar.member.mapper.AdminMemberMapper;

// 추상클래스에서는 @Autowired, @Resource를 사용할 하기가 상당히 난감하다.
// 지금 템플릿 메소드 패턴을 이용할 경우, 추상 클래스는 일반적으로 생성자가 호출이 안된다.
// 그렇기 때문에 adminMemberMapper, passwordEncoder에 @Autowired등의 애노테이션을 대입하더라도 객체를 주입하지 않는다. 
public abstract class AdminMemberRegisterTemplate<T> {
	private AdminMemberMapper adminMemberMapper;
	
	private PasswordEncoder passwordEncoder;
	
	public AdminMemberRegisterTemplate() {
		init(passwordEncoder, adminMemberMapper);
	}
	
	public final boolean registerMember(T member) throws Exception{
		((AdminMemberVO) member).setAge(calculateAge(((AdminMemberVO) member).getBirthDate()));	// 날짜를 나이로 환산
		((AdminMemberVO) member).setPassword(encrypt(((AdminMemberVO) member).getPassword()));	// 비밀번호 SHA-256으로 암호화
		
		if(insertMember(member, adminMemberMapper) < 1)
			return false;
		
		return true;
	}
	
	public final AdminMemberRegisterTemplate<T> init(PasswordEncoder passwordEncoder, AdminMemberMapper adminMemberMapper){
		this.passwordEncoder = passwordEncoder;
		this.adminMemberMapper = adminMemberMapper;
	
		return this;
	}
	
	private int calculateAge(Date birthDate){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		int birthYear = Integer.parseInt(format.format(birthDate).split("-")[0]);
		
		return currentYear - birthYear + 1;
	}
	
	private String encrypt(String rawPassword){
		return passwordEncoder.encode(rawPassword);
	}

	protected abstract int insertMember(T user, AdminMemberMapper adminMemberMapper) throws Exception;
}
