package survey;

public class SurveyInfoDTO {

	public String title;
	public String surveyCode;
	public String lastModifyTime;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSurveyCode() {
		return surveyCode;
	}

	public void setSurveyCode(String surveyCode) {
		this.surveyCode = surveyCode;
	}

	public String getLastModifyTime() {
		return lastModifyTime;
	}

	public void setLastModifyTime(String lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	public SurveyInfoDTO(String title, String surveyCode, String lastModifyTime) {
		super();
		this.title = title;
		this.surveyCode = surveyCode;
		this.lastModifyTime = lastModifyTime;
	}

	@Override
	public String toString() {
		return "SurveyInfoDTO [title=" + title + ", surveyCode=" + surveyCode + ", lastModifyTime=" + lastModifyTime
				+ "]";
	}

}
