package egovframework.example.admin.login.domain;

import java.util.List;

// 자바에 정규표현식과 자바스크립트의 정규표현식이 다르다.
// 자바 이메일 정규표현식 : ^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$ 
// 자바스크립트 이메일 정규표현식 : /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/
// 자바스크립트 정규표현식을 자바에서 쓰면 오류를 낸다.
public class UserInfo {
	private String id;
	private String password;
	private List<Authority> authorities;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", password=" + password
				+ ", authorities=" + authorities + "]";
	}

}
