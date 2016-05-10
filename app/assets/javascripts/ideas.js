'use strict';

$('document').ready(function(){
  $('#add-idea').on("click", createIdea);
});

function createIdea(){
  var ideaParams = {idea: {title: $('#idea-title').val(),
                           body: $('#idea-body').val()}}
  $.ajax({
    url: "/ideas",
    method: "POST",
    dataType: "json",
    data: ideaParams,
    success: function(post){
      $("#ideas").renderIdea(idea);
    }
  });
}

function renderIdea(idea){
  $("#ideas")
    .append("<div class=idea data-idea-id="
    + idea.id
    + "><p>"
    + idea.title
    + "</p><p>"
    + idea.title
    + "</p></div>");
}
