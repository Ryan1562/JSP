package ch07;

import java.io.IOException;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
public class NewMinimum extends SimpleTagSupport {
	private String var;
	private int num1;
	private int num2;	
	public void setNum1(int num1) {		this.num1 = num1;	}
	public void setNum2(int num2) {		this.num2 = num2;	}	
	public void setVar(String var) {	this.var = var;		}
	public void doTag() throws JspException, IOException {
		JspContext jc = getJspContext();
		if (num1 < num2) jc.setAttribute(var, num1);
		else  jc.setAttribute(var, num2);
	}
}