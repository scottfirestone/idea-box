'use strict';

$('document').ready(function(){
  fetchIdeas();
  $('#add-idea').on("click", createIdea);
  $('body').on("click", "input.delete-idea", deleteIdea);
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
    + "</p>"
    + "<input class='btn btn-default pull-right delete-idea' "
    + "type=button name=Delete value=Delete></div>");
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

function deleteIdea(idea){
  var idea_id = $(this).parents(".idea").data("idea-id");

  $.ajax({
    url: "/api/v1/ideas/" + idea_id + ".json",
    method: "DELETE",
    success: function(){
      $(".idea[data-idea-id=" + post_id + "]").remove();
    }
  })
}
