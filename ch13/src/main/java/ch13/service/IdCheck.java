package ch13.service;

public class IdCheck {
	public int idchk(String id, String password) {
		int result = 0;
		if (id.equals("java") && password.equals("1234"))
			result = 1;
		return result;
	}
}