'use strict';

$('document').ready(function(){
  fetchIdeas();
  $('#add-idea').on("click", createIdea);
  $('body').on("click", "input.delete-idea", deleteIdea);
  $('body').on("blur", ".idea", editIdea);
  $('body').on("click", "span.upvote", upvoteIdea);
  $('body').on("click", "span.downvote", downvoteIdea);
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
    + "</div></p><p class=quality>"
    + idea.quality
    + "</p><a href=#>"
    + "<span class='upvote glyphicon glyphicon-thumbs-up'></span>"
    + "</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href=#>"
    + "<span class='downvote glyphicon glyphicon-thumbs-down'></span>"
    + "<input class='btn btn-default pull-right delete-idea'"
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

function upvoteIdea(){
  var idea_id = $(this).parents(".idea").data("idea-id");
  var quality = $(this).parents(".idea").children('p.quality').text();
  var element = $(this)
  $.ajax({
    url: "/api/v1/ideas/" + idea_id + "/upvote",
    method: "PUT",
    dataType: "text",
    data: idea_id,
    success: changeQuality(element, quality, "upvote")
  });
}

function downvoteIdea(){
  var idea_id = $(this).parents(".idea").data("idea-id");
  var quality = $(this).parents(".idea").children('p.quality').text();
  var element = $(this)
  $.ajax({
    url: "/api/v1/ideas/" + idea_id + "/downvote",
    method: "PUT",
    dataType: "text",
    data: idea_id,
    success: changeQuality(element, quality, "downvote")
  });
}


function changeQuality(element, quality, vote){
  var qualities = ["Swill", "Possible", "Genius"];
  var index = qualities.indexOf(quality);

  if (vote === "upvote") {
    if (index < qualities.length - 1){
      var newQuality = qualities[index + 1]
      element.parents(".idea").find('p.quality')
        .replaceWith("<p class=quality>" + newQuality + "</p>");
    }
  } else if (vote === "downvote") {
    if (index > 0){
      var newQuality = qualities[index - 1]
      element.parents(".idea").find('p.quality')
        .replaceWith("<p class=quality>" + newQuality + "</p>");
    }
  }
}
