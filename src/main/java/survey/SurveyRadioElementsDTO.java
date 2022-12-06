package survey;

public class SurveyRadioElementsDTO {

	String elementNum;
	String value;

	public String getElementNum() {
		return elementNum;
	}

	public void setElementNum(String elementNum) {
		this.elementNum = elementNum;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public SurveyRadioElementsDTO(String elementNum, String value) {
		super();
		this.elementNum = elementNum;
		this.value = value;
	}

	@Override
	public String toString() {
		return "SurveyRadioElementsDTO [elementNum=" + elementNum + ", value=" + value + "]";
	}

}
