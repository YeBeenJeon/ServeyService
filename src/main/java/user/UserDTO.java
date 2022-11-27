package user;

public class UserDTO {
	
	private String userEmail;
	private String userPassword;
	private String userEmailRandomString;
	private boolean userEmailChecked;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public String getUserEmailRandomString() {
		return userEmailRandomString;
	}
	public void setUserEmailRandomString(String userEmailRandomString) {
		this.userEmailRandomString = userEmailRandomString;
	}
	public UserDTO() {
	}
	
	public UserDTO(String userEmail, String userPassword, String userEmailRandomString, boolean userEmailChecked) {
//		super();
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userEmailChecked = userEmailChecked;
		this.userEmailRandomString = userEmailRandomString;
	}
	
}
