// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function search() {
	var box = document.getElementById('searchbox');
	window.location = '/search?query=' + box.value;
}

//This function takes in 
function recommend() {
	window.location = '/recommend';
}

var req;
var current_page;
function load_page(page) {
	req = new XMLHttpRequest();
	var url = '/?format=json&page=' + page;
	req.open("GET", url);
	req.onreadystatechange = handleResponse;
	req.send(null);
	current_page = page;
	var forward = document.getElementById('forward_button');
	var back = document.getElementById('back_button');
	toggleButton(forward, numPages());
	toggleButton(back, 1);
	changeButtonPageNumber(forward, current_page + 1);
	changeButtonPageNumber(back, current_page - 1);
}

function changeButtonPageNumber(button, page) {
	button.setAttribute('href', 'javascript:load_page(' + page + ');');
}

function toggleButton(button, desiredPage) {
	if(current_page == desiredPage)
		button.style.display = 'none';
	else
		button.style.display = '';
}

function handleResponse() {
	if(req.readyState != 4) return;
	if(req.status != 200  ) return;
	var json = req.responseText;
	var pets = JSON.parse(json)["pets"];
	buildTable(pets);
}

function numPages() {
	document.getElementById('num_pages');
	return parseInt(document.getElementById('num_pages').innerHTML);
}

function buildTable(pets) {
	var table = document.getElementById("pet_table_body");
	while(table.hasChildNodes()) {
		table.removeChild(table.lastChild);
	}
	for(var j=0;j<pets.length;j++) {
		pet = pets[j];
		var row = document.createElement('tr');
		var name = document.createElement('td');
		name.innerHTML = pet["name"];
		row.appendChild(name);
		var gender = document.createElement('td');
		gender.innerHTML = pet["gender"];
		row.appendChild(gender);
		var personality = document.createElement('td');
		personality.innerHTML = pet['personality'];
		row.appendChild(personality);
		var animal = document.createElement('td');
		animal.innerHTML = pet['animal'];
		row.appendChild(animal);
		var user = document.createElement('td');
		user.innerHTML = pet['user'];
		row.appendChild(user);
		for(var i=0;i<pet['links'].length;i++) {
			var link = pet['links'][i];
			var a = document.createElement('a');
			a.setAttribute('href', link['url']);
			if(link['method'])
				a.setAttribute('data-method', link['method']);
			a.innerHTML = link['text'];
			var container = document.createElement('td');
			container.appendChild(a);
			row.appendChild(container);
		}
		table.appendChild(row);
	}
}
