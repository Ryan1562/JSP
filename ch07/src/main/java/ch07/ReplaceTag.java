package ch07;
import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
public class ReplaceTag extends SimpleTagSupport {
	private String oldWord;
	private String newWord;
	public void setOldWord(String oldWord) {	this.oldWord = oldWord;	}
	public void setNewWord(String newWord) {	this.newWord = newWord;	}
	public void doTag() throws JspException, IOException {
		JspContext jc = getJspContext();
		JspWriter out = jc.getOut();
		JspFragment body = getJspBody();
		// String 데이터가 고정되어 잇어 전체를 변경, StringWriter는 단어중 일부만 변겨이 가능
		StringWriter writer = new StringWriter();
		body.invoke(writer);
		String str = writer.toString();  // StringWriter 데이터를 String으로 변경
		String newStr = str.replaceAll(oldWord, newWord);
		out.println(newStr);
	}
}