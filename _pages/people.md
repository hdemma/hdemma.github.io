---
permalink: /people
title: "Team"
excerpt: "High-dimensional Data-driven Energy optimization for Multi-Modal transit Agencies (HD-EMMA)"
layout: single
redirect_from:
- /team
- /team.html
---

# Team Members

 

<section class="content-section team-boxed">
  <div class="row d-flex align-items-stretch">
{% assign i = 1 %}
  {% assign sortedmembers = site.teammembers | sort: 'sequence' %}
  {% for member in sortedmembers %}
  {% assign j = i|modulo: 2 %}
       <div class="col-xl-2 col-md-4 col-sm-6 d-flex align-items-stretch">
       <div class="card border-0 m-0 p-0">     
            <img alt="Card image cap" class="card-img-top avatar rounded-circle" src="{{ member.image }}" />
        <div class="card-body text-center p-0 m-0">
        <h5 class="card-title">Card title</h5>
             <a href="{{ member.link }}" class="stretched-link"></a>
        </div>
          <h5 class="card-footer bg-white text-center align-items-bottom mb-0 d-flex align-items-stretch">{{ member.name }} {{ member.university }} ({{ member.role }}</h5>     
    </div>
    </div>
{% assign i = i|plus:1 %}
{% endfor %}
</div>
 </section>