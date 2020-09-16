---
permalink: /
title: "SmartTransit.Ai"
excerpt: "About SmartTransit.ai"
author_profile: true
layout: single
redirect_from: 
  - /about/
  - /about.html
---
<!-- beginning of carousel 
<div id="carouselData" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    {% for carousel in site.data.carousels %}
    {% if carousel.active  %}
    <div class="carousel-item active align-items-center flex-column p-0 m-0">
      {% else %}
      <div class="carousel-item align-items-center  flex-column p-0 m-0">
        {% endif %}
        {% if carousel.video  %}
        <video id="videoBanner" preload="true" height="100%" class="d-block w-100" autoplay loop muted>
          <source src="{{ carousel.video }}" type="video/mp4" />
        </video>
        {% else %} 
        <img height="80%" class="d-block w-100" src="{{ carousel.image }}" alt="Slide">
        {% endif %}
        <div class="carousel-caption align-items-center p-2 m-2">
          <h5>{{ carousel.captionhead }}</h5>
          <p>{{ carousel.text }}</p>
           <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
        </div>
      </div>
      {% endfor %}
    </div>
    <a class="carousel-control-prev" href="#carouselData" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselData" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>    
</div>
 End of carousel -->

<!--Card-->
<div class="containerh-100 d-flex justify-content-center ">
<div class="row">
<!--Card image-->
<div class="col-lg-12 col-sm-12 mx-auto">
<div id="carouselData" class="carousel slide carousel-fade" data-ride="carousel"  data-interval=8000>
  <div class="carousel-inner">
    {% for carousel in site.data.carousels %}
    {% if carousel.active  %}
    <div class="carousel-item active align-items-center">
      {% else %} 
      <div class="carousel-item align-items-center">
        {% endif %}
        {% if carousel.video  %}
        <video id="videoBanner" class="d-block w-100 p-0 m-0" autoplay loop muted>
          <source src="{{ carousel.video }}" type="video/mp4" />
        </video>
        {% else %} 
        <img class="d-block w-100 p-0 m-0" src="{{ carousel.image }}" alt="Slide">
        {% endif %}
        </div>
      {% endfor %}
    </div>
    <a class="carousel-control-prev" href="#carouselData" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselData" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>    
</div>
</div>
<!--Card content-->
<div class="col-lg-12 col-sm-12 mx-auto text-center">
<!--Title-->
<!-- <h5 class="card-title">Optimizing Transit Operations</h5> -->
<!--Text-->
<p class="card-text text-justify">We work with Chattanooga Regional Transit Authority and Nashville WeGo to enable efficient transit operations by using artifical intelligence and real-time data analysis at scale. This includes reinforcement learning,  monte-carlo tree search and operations research based optimization for system-wide integrated scheduling and dispatch of transit operations. As part of this work we are also developing models to estimate loading factors and real-time energy consumption of mixed vehicle transit fleets and use those models to predict and optimize operations for lowering overall energy impact while ensuring the system wide capacity remains unaffected.</p>
<!-- <a href="#about" class="btn btn-dark js-scroll-trigger" href="#about"></a> -->
</div>
</div>
</div>
<!--/.Card-->

  <!-- About -->
  <section class="content-section bg-light" id="about">
  <div class="content-section-heading text-center">  
      <h2 class="mdc-typography--headline2  text-center m-0 p-0">About us</h2>
      </div>
    <div class="container-fluid  p-0 m-0">
      <div class="row p-0 m-0">
        <div class="col-lg-3 p-0 ml-3 scopeimg">
          <img class="d-block m-0 p-0"  src="img/smartcities.png">
          <!-- <iframe src="https://www.google.com/maps/d/embed?mid=1ZnAR4JdHNF5K3rW9cICXqBGuvwmchIy9&hl=en" width="100%"></iframe> -->
        </div>
          <div class="col-lg-8 p-0 m-0  mx-auto">
           {% for node in site.info %}
            <p class="lead mb-5 text-justify">{{ node.content| markdownify }}</p>
           {% endfor %}               
        </div>
      </div>
    </div>
     <!-- <div class="text-center">    
          <a class="btn btn-dark  js-scroll-trigger" href="#research">Research Areas</a></div> -->
  </section>

<!-- Research Areas -->
{% assign sortedresearchareas = site.researchareas | sort: 'sequence' %}
<section class="content-section" id="research">
  <div class="content-section-heading text-center">  
    <h2 class="mdc-typography--headline2 p-2 text-center m-0 p-0">Research Areas</h2>
  </div>
  <div class="row">
        {% for area in sortedresearchareas %}
          <div class="col-sm-4 d-flex align-items-stretch">
          <div class="card bg-secondary text-white border-1 p-2 m-2">
          <h5 class="card-header text-center">{{ area.name }}</h5>
          <div class="card-body">            
            <p class="card-text text-justify">{{ area.content | markdownify }}</p>
            {% if area.learnmore == blank  and  area.learnmore == nil %}
              <div class="text-center"><a class="btn btn-dark js-scroll-trigger" href="#research">Learn More</a></div>
            {% else %}
             <div class="text-center"><a class="btn btn-dark js-scroll-trigger" href="{{ area.learnmore }}">Learn More</a></div>
            {% endif %}
            </div>
            <div class="card-footer text-white  text-center">Funding Source: {{ area.funding }}</div>
            </div>
        </div>
        {% endfor %}
  </div>
</section>

<!-- Portfolio -->
{% assign sortedactivities = site.activities | sort: 'sequence' %}
  <section class="content-section bg-light" id="portfolio">
    <div class="container-fluid">
      <div class="content-section-heading text-center">       
         <h2 class="mdc-typography--headline2 p-2 text-center m-0 p-0">Project Activities</h2>
      </div>
      <div class="row no-gutters justify-content-center">
          {% for act in sortedactivities %}
          <div class="col-lg-5 p-3   m-3 ">
         {% if act.link != blank  or  act.link != nil %}
    <div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="{{ act.link }}"></iframe>
   {% if act.learnmore != blank  or  act.learnmore != nil %}
  <div class="text-center"><a class="btn btn-dark js-scroll-trigger" href="{{ act.learnmore }}">Learn More</a></div>
  {% endif %}
</div>
       {% endif %}
          <div class="caption text-center">
              <div class="caption-content">
                <div class="h2">{{ act.caption }}</div>
                <p class="mb-0">{{ act.text }}</p>
              </div>
            </div>
        </div>
        {% endfor %}
      </div>
    </div>
  </section>



  <!-- Map -->
  <div id="contact" class="map">
  <iframe src="https://www.google.com/maps/d/embed?mid=1ZnAR4JdHNF5K3rW9cICXqBGuvwmchIy9&hl=en" width="100%"></iframe>
   </div>


      
