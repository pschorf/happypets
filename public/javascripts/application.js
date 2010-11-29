// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function search() {
	var box = document.getElementById('searchbox');
	window.location = '/search?query=' + box.value;
}
