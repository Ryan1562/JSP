package ch07;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;
public class DynamicStar extends SimpleTagSupport implements DynamicAttributes {
	private Map<String, Object> attrs = new HashMap<>();
	public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
		attrs.put(localName, value);		
	}
	public void doTag() throws JspException, IOException {
		String color = (String)attrs.get("color");
		int size = Integer.parseInt((String)attrs.get("size"));
		JspContext jc = getJspContext();
		JspWriter out = jc.getOut();
		out.println("<font color='"+color+"'>");
		for(int i =0; i < size; i++) {
			out.println("*");
		}
		out.println("</font><br>");
	}
}