$(document).on('turbolinks:load', function() {
  postComment();
});

function Comment(attributes){
  this.name = attributes.name;
  this.content = attributes.content;
  this.id = attributes.id;
}

Comment.prototype.renderLi = function(){
  var full_comment = "<p class='comment'>" + this.name + " says:<br>" + this.content + "</br> </p>";
  $(".comments_container").append(full_comment)
}

function postComment(){
  $("form#new_comment").on("submit", function(e){
    e.preventDefault();
    var $form = $(this);
    var action = $form.attr("action")
    var params = $form.serialize()

    $.ajax({
      url: action,
      data: params,
       dataType: "json",
      method: "POST"
    })
    .success(function(json){
      e.preventDefault();
      var comment = new Comment(json);
      var commentLi = comment.renderLi()
      $("#comment_name").val('')
      $("#comment_content").val('')
    })
    .error(function(response){
      console.log("Broken", response)
    })
  })
}