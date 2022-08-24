package ch06;
public class Person { // DTO(Data Transfer Object), VO(Value Object)
	private String name;
	private int age;
	private String gender;
	
	public String getName() {	return name;	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {		return age;	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {	return gender;	}
	public void setGender(String gender) {
		this.gender = gender;
	}	
}