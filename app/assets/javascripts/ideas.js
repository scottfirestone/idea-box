'use strict';

$('document').ready(function(){
  $('#add-idea').on("click", createIdea);
});

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
