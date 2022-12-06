// 전체 각 문제의 위치
var formLocation = 0;

// Radio form Element 별 element 개수를 저장하 자료구조
var radioElement = new Map();

function htmlToElement(html) {
	var template = document.createElement('template');
	html = html.trim();
	template.innerHTML = html;
	return template.content.firstChild;
}
function shortAnswerButtonClicking() {

	var location = currLocation().toString();

	var html = "<div class=\"form-container\" id=\"" + location + "-short\">"
		+ "<div class=\"form-floating\">"
		+ "<textarea class=\"form-control mb-4\""
		+ "aria-label=\"" + location + "-short\" id=\"" + location + "-short\" name=\"" + location + "-short-question\"> </textarea>"
		+ "<label for=\"" + location + "-short\">Question</label>"
		+ "</div>"
		+ "<input type=\"text\" class=\"form-control\" placeholder=\"Answer\" aria-label=\"Answer\">"
		+ "<div style=\"text-align: center\">"
		+ "<button type=\"button\" class=\"btn btn-light delete-btn\" id=\"" + location + "-short\" onclick=\"deleteElement(this.id)\">Delete</button>"
		+ "</div>"
		+ "</div>";

	let par = document.getElementById('form');
	let doc = htmlToElement(html);
	par.appendChild(doc);
}
function radioBoxButtonClicking() {

	html = document.getElementById('form').innerHTML;
	var location = currLocation().toString();

	radioElement.set(location, [1]);

	html = "<div class=\"form-container\" id=\"" + location + "-radio\">"
		+ "<div class=\"form-floating\">"
		+ "<textarea class=\"form-control mb-4\" placeholder=\"Question\" aria-label=\"Question\" id=\"" + location + "-radio-question\" name=\"" + location + "-radio-question\"> </textarea>"
		+ "<label for=\"" + location + "-radio-question\">Question</label>"
		+ "</div>"
		+ "<div class=\"form-check\" id=\"" + location + "-radio-container\">"
		+ "<div id=\"" + location + "-radio-element-1\">"
		+ "<input class=\"form-check-input\" type=\"checkbox\" id=\"" + location + "-radio-element-1\" />"
		+ "<label class=\"form-check-label\" for=\"" + location + "-radio-element-1\">"
		+ "<input type=\"text\"	class=\"form-control mb-1\" placeholder=\"Answer\"	name=\"" + location + "-radio-element-1\" />"
		+ "</label>"
		+ "<button type=\"button\" class=\"btn float-btn\" id=\"" + location + "-radio-element-1\" onclick=\"deleteElement(this.id)\">X</button>"
		+ "</div>"
		+ "</div>"
		+ "<input class=\"form-check-input\" type=\"checkbox\" id=\"plus\" disabled /> "
		+ "<label class=\"form-check-label\" for=\"plus\"	id=\"" + location + "-radio-container\" onclick=\"addRadioBoxElement(this.id)\">Plus</label>"
		+ "<div style=\"text-align: center\">"
		+ "<button type=\"button\" class=\"btn btn-light delete-btn\" id=\"" + location + "-radio\" onclick=\"deleteElement(this.id)\">Delete</button>"
		+ "</div>"
		+ "</div>";

	let par = document.getElementById('form');
	let doc = htmlToElement(html);
	par.appendChild(doc);
}
function deleteElement(id) {
	document.getElementById(id).remove();
}
function addRadioBoxElement(id) {

	let location = id.split("-")[0];
	let elements = radioElement.get(location);

	let next_element = elements[elements.length - 1] + 1;

	elements.push(next_element);

	let par = document.getElementById(id);
	let string = "<div id=\"" + location + "-radio-element-" + next_element + "\">"
		+ "<input class=\"form-check-input\" type=\"checkbox\" id=\"" + location + "-radio-element-" + next_element + "\" />"
		+ "<label class=\"form-check-label\" for=\"" + location + "-radio-element-" + next_element + "\">"
		+ "<input type=\"text\"	class=\"form-control mb-1\" placeholder=\"Answer\"	name=\"" + location + "-radio-element-" + next_element + "\" />"
		+ "</label>"
		+ "<button type=\"button\" class=\"btn float-btn\" id=\"" + location + "-radio-element-" + next_element + "\" onclick=\"deleteElement(this.id)\">X</button>"
		+ "</div>";
	let doc = htmlToElement(string);
	par.appendChild(doc);

}
function currLocation() {
	formLocation = formLocation + 1;
	return formLocation;
}
function clickShare() {
	const shModal = new bootstrap.Modal('#shareModal')
	shModal.show();
}

