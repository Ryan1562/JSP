package ch05;
import java.util.HashMap;
import java.util.Map;
public class Thermometer {
	Map<String, Double> th = new HashMap<>();
	public void setTh(String loc, double value) { // 지역에 섭씨 온도 저장
		th.put(loc, value);
	}
	public double getTh(String loc) { // 지역 온도 읽기
		return th.get(loc);
	}
	public double getFarenheit(String loc) { // 섭씨 온도를 화씨로 변경하여 읽기
		return th.get(loc) * 1.8 + 32;
	}
}