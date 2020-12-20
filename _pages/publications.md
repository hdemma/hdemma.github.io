---
permalink: /publications/
title: "Publications"
excerpt: "Publications"
layout: single
---



   <section class="main">
    <a href="allpubs.html" class="my-button" style="color:white !important; text-decoration: none !important;"><span class="fas fa-print"></span>Printer Friendly</a>
    {% assign year_string = "2021" %}
   
  <h2 onclick="myFunction({{ year_string }})"> <i id="{{ year_string }}click" class="fas fa-toggle-on" style="font-size: 70%;"></i> &nbsp;{{ year_string }}</h2> 
      <div id="{{ year_string }}">
    {% bibliography --query @*[year={{ year_string }}] %}
    <hr>
     </div>
    
    {% assign year_string = "2020" %}
   
  <h2 onclick="myFunction({{ year_string }})"> <i id="{{ year_string }}click" class="fas fa-toggle-on" style="font-size: 70%;"></i> &nbsp;{{ year_string }}</h2> 
      <div id="{{ year_string }}">
    {% bibliography --query @*[year={{ year_string }}] %}
    <hr>
     </div>

     {% assign year_string = "2019" %}

 
 
   <h2 onclick="myFunction({{ year_string }})"> <i id="{{ year_string }}click" class="fas fa-toggle-on" style="font-size: 70%;"></i> &nbsp;{{ year_string }}</h2> 
         <div id="{{ year_string }}">
       {% bibliography --query @*[year={{ year_string }}] %}
       <hr>
        </div>
 

  
 
  </section>



<script type="text/javascript">
function filter(tag, type) {
  var item = document.getElementById("selected-tags");
  switch (type) {
    case "[[clear-all]]":
    item.setAttribute('year', '');
    item.setAttribute('pub', '');
    item.setAttribute('proj', '');
    break;
    case "year":
    item.setAttribute('year', tag);
    break;
    case "pub":
    item.setAttribute('pub', tag);
    break;
    case "proj":
    item.setAttribute('proj', tag);
    break;
  }
  // console.log(item);
  item.setAttribute('class', '');
  if (item.getAttribute("year"))
  item.classList.add(item.getAttribute("year"));
  if (item.getAttribute("pub"))
  item.classList.add(item.getAttribute("pub"));
  if (item.getAttribute("proj"))
  item.classList.add(item.getAttribute("proj"));

  setActiveTag(tag);
  showContainer(tag);
}

function myFunction(tag) {
  var x = document.getElementById(tag);
  var y= document.getElementById(tag+'click');
  if (x.style.display === "none") {
    x.style.display = "block";
     y.classList.remove('fa-toggle-off');
     y.classList.add('fa-toggle-on');
  } else {
    x.style.display = "none";
    y.classList.remove('fa-toggle-on');
    y.classList.add('fa-toggle-off');    
  }
}

function setActiveTag(tag) {
  // loop through all items and remove active class
  var items = document.getElementsByClassName('blog-tag-item');
  for (var i = 0; i < items.length; i++) {
    items[i].setAttribute('class', 'blog-tag-item');
  }

  // set the selected tag's item to active
  var item2 = document.getElementById("selected-tags");
  for (var i=0; i<item2.classList.length; i++) {
    var tag2 = item2.classList[i]
    var item = document.getElementById(tag2 + '-item');
    if (item) {
      item.setAttribute('class', 'blog-tag-item active');
    }
  }
}

function checkContainsAllTags(itemID) {
  var item = document.getElementById("selected-tags");
  var flagContains = true;
  for (var i=0; i<item.classList.length; i++) {
    if (!itemID.includes(item.classList[i])) {
      flagContains = false;
    }
  }
  return flagContains;
}

function showContainer(tag) {
  var lists = document.getElementsByClassName('blog-list-container');
  for (var i = 0; i < lists.length; i++) {
    if (!checkContainsAllTags(lists[i].id)) {
      lists[i].classList.add("hidden");
      // lists[i].setAttribute('class', 'blog-list-container hidden');
    } else {
      lists[i].classList.remove("hidden");
      // lists[i].setAttribute('class', 'blog-list-container');
    }
  }
  if (!tag) {
    for (var i = 0; i < lists.length; i++) {
      lists[i].classList.remove("hidden");
    }
  }
}

var params = {};
if (location.search) {
  var parts = location.search.substring(1).split('&');

  for (var i = 0; i < parts.length; i++) {
    var nv = parts[i].split('=');
    if (!nv[0]) continue;
    params[nv[0]] = nv[1] || true;
  }
}
var proj = params.proj;
if (proj) {
  proj = proj.toUpperCase();
  filter(proj, 'proj');
}
</script>