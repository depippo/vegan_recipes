function attachListeners() {
  $(".js-more").one("click", function(event) {
    var id = $(this).data("id");
    userRecipes(event, id);
  })
  $(".js-next").on("click", function(event) {
    nextUser(event);
  })
  $(".js-previous").on("click", function(event) {
    previousUser(event);
  })
};

function userRecipes(event, id) {
  var ul = event.target.parentNode;
  var button = event.target;
  $.get("/users/" + id + ".json").success(function(json) {
    console.log(json);
    if (json.recipes.length > 0) {
      $(button).hide();
      json.recipes.forEach(function(recipe){
        console.log("USERFUNCTION");
        $(ul).append('<li>' + '<a href="/recipes/' + recipe.id + '">' + recipe.name + '</a>' + '</li>');          
    })}
  });
};

function nextUser(event) {
  console.log("NEXTFUNCTION");
    event.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/users/" + nextId + "/data").success(function(data) {
      console.log(data);
      $(".userName").text(data["email"]);
      if (data["recipes"]) {
        $(".userRecipes").empty();
        data["recipes"].forEach(function(element){
          $(".userRecipes").append('<li class="list"><a href="/recipes/' + element.id + '">' + element.name + '</a></li>');
        })
      if (data["favorites"]) {
        $(".userFavorites").empty();
        data["favorites"].forEach(function(element){
          $(".userFavorites").append('<li class="list"><a href="/recipes/' + element.id + '">' + element.name + '</a></li>');
        })
      }
        // re-set the id to current on the link
        $(".js-next").attr("data-id", data["id"]);
      }
    });
};

function previousUser(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next").attr("data-id")) - 1;
    $.get("/users/" + nextId + "/data").success(function(data) {
      $(".userName").text(data["email"]);
      if (data["recipes"]) {
        $(".userRecipes").empty();
        data["recipes"].forEach(function(element){
          console.log(element);
          $(".userRecipes").append('<li class="list"><a href="/recipes/' + element.id + '">' + element.name + '</a></li>');
        })
      if (data["favorites"]) {
        $(".userFavorites").empty();
        data["favorites"].forEach(function(element){
          $(".userFavorites").append('<li class="list"><a href="/recipes/' + element.id + '">' + element.name + '</a></li>');
        })
      }
        // re-set the id to current on the link
        $(".js-next").attr("data-id", data["id"]);
      }
    });
};

$(document).on('turbolinks:load', function() {
  attachListeners();
});

