package com.comnawa.mvcinema.sungwon.model.member.dto;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String email;
	private String name;
	private int age;
	private String gender;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String userid, String passwd, String email, String name, int age, String gender) {
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
		this.name = name;
		this.age = age;
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", email=" + email + ", name=" + name + ", age="
				+ age + ", gender=" + gender + "]";
	}

}
