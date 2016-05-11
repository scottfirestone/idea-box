'use strict';

$('document').ready(function(){
  fetchIdeas();
  $('#add-idea').on("click", createIdea);
  $('body').on("click", "input.delete-idea", deleteIdea);
  $('body').on("blur", ".idea", editIdea);
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
    .prepend("<div class=idea data-idea-id="
    + idea.id
    + "><div class=title><p contenteditable=true>"
    + idea.title
    + "</div></p><div class=body><p contenteditable=true>"
    + idea.body
    + "</div></p><p>"
    + idea.quality
    + "</p>"
    + "<input class='btn btn-default pull-right delete-idea' "
    + "type=button name=Delete value=Delete></div>");
}

function createIdea(){
  var ideaParams = {
    idea: {
      title: $('#idea-title').val(),
      body: $('#idea-body').val()
    }
  }

  $.ajax({
    url: "/api/v1/ideas",
    method: "POST",
    dataType: "json",
    data: ideaParams,
    success: renderIdea
  });
}

function deleteIdea(idea){
  var idea_id = $(this).parents(".idea").data("idea-id");

  $.ajax({
    url: "/api/v1/ideas/" + idea_id + ".json",
    method: "DELETE",
    success: function(){
      $(".idea[data-idea-id=" + idea_id + "]").remove();
    }
  })
}

function editIdea(){
  var idea_id = $(this).data("idea-id");
  var idea = $("div[data-idea-id*="+ idea_id + "]")
  var ideaParams = {
    idea: {
      title: $(idea).children('.title').children('p').text(),
      body: $(idea).children('.body').children('p').text()
    }
  };

  $.ajax({
    url: "/api/v1/ideas/" + idea_id,
    method: "PUT",
    dataType: "json",
    data: ideaParams
  })
}
