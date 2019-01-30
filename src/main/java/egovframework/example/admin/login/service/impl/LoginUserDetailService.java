package egovframework.example.admin.login.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.example.admin.login.domain.Authority;
import egovframework.example.admin.login.domain.UserInfo;
import egovframework.example.admin.login.mapper.AdminLoginMapper;

@Service
public class LoginUserDetailService implements UserDetailsService{
	// 필터에서는 SpringContext범위가 아니기 때문에 자동 주입 빈에 범위 대상이 아닌 걸로 알고 있는데 SpringSecurity는 가능한듯하다...
	@Autowired
	private AdminLoginMapper adminLoginMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserInfo userInfo = getMemberInfo(username);
		
		if(userInfo == null)
			throw new UsernameNotFoundException(username);
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (Authority authority : userInfo.getAuthorities())
			authorities.add(new SimpleGrantedAuthority(authority.getAuthority()));
		
		return new User(username, userInfo.getPassword(), authorities);
	}
	
	private UserInfo getMemberInfo(final String username){
		return adminLoginMapper.authenticate(username);
	}

}
