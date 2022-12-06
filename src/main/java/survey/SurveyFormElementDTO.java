package survey;

import java.util.ArrayList;

public class SurveyFormElementDTO {
	String location;
	String formType;
	String questionValue;
	ArrayList<SurveyRadioElementsDTO> elements = new ArrayList<SurveyRadioElementsDTO>();

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFormType() {
		return formType;
	}

	public void setFormType(String formType) {
		this.formType = formType;
	}

	public String getQuestionValue() {
		return questionValue;
	}

	public void setQuestionValue(String questionValue) {
		this.questionValue = questionValue;
	}

	public ArrayList<SurveyRadioElementsDTO> getElements() {
		return elements;
	}

	public void setElements(ArrayList<SurveyRadioElementsDTO> elements) {
		this.elements = elements;
	}

	public SurveyFormElementDTO(String location, String formType, String questionValue,
			ArrayList<SurveyRadioElementsDTO> elements) {
		super();
		this.location = location;
		this.formType = formType;
		this.questionValue = questionValue;
		this.elements = elements;
	}

	@Override
	public String toString() {
		return "SurveyFormElementDTO [location=" + location + ", formType=" + formType + ", questionValue="
				+ questionValue + ", elements=" + elements + "]";
	}

}
