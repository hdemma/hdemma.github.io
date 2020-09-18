---
permalink: /post/
title: "Posts"
excerpt: ""
author_profile: true
layout: single
redirect_from:
- /posts/
- /post.html
---


{% for tag in site.tags %}
  <h3>{{ tag[0] }}</h3>
  <ul>
   {% assign sorted = tag[1] | sort: 'date' %}
    {% for post in sorted %}
      <li>{{ post.date | date: '%B %d, %Y' }} - <a href="{{ post.url }}">{{ post.title }}</a>, written by {{ post.author }}</li>
     {% endfor %}
  </ul>
{% endfor %}