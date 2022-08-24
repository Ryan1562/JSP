package ch07;
import java.io.IOException;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
public class NewStarLine extends SimpleTagSupport {
	private int size;
	private String color;	
	public void setSize(int size) {	this.size = size;	}
	public void setColor(String color) {	this.color = color;	}
	public void doTag() throws JspException, IOException {
		JspContext jc = getJspContext();
		JspWriter out = jc.getOut();
		out.println("<font color='"+color+"'>");
		for (int i = 0; i < size; i++) {
			out.print("*");
		}
		out.println("</font><br>");
	}
}