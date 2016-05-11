'use strict';

$('document').ready(function(){
  fetchIdeas();
  $('#add-idea').on("click", createIdea);
});

function fetchIdeas(){
  $.getJSON("/api/v1/ideas.json", function(ideas){
    $("#ideas").html();
    $(ideas).each(function(index, idea){
      $("#ideas")
      renderIdea(idea);
    });
  });
}

function renderIdea(idea){
  $("#ideas")
    .append("<div class=idea data-idea-id="
    + idea.id
    + "><p>Title: "
    + idea.title
    + "</p><p>Body: "
    + idea.body
    + "</p><p>Quality: "
    + idea.quality
    + "</p></div>");
}

function createIdea(){
  var ideaParams = {idea: {title: $('#idea-title').val(),
                           body: $('#idea-body').val()}}
  $.ajax({
    url: "/api/v1/ideas",
    method: "POST",
    dataType: "json",
    data: ideaParams,
    success: function(idea){
      renderIdea(idea);
    }
  });
}
