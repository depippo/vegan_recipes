function pageReady() {
  $(".js-shownutrients").one("click", function(event) {
    var id = $(this).data("id");
    showNutrients(event, id);
  })
  $(".js-next_ingredient").on("click", function(event) {
    nextIngredient(event);
  })
  $(".js-previous_ingredient").on("click", function(event) {
    previousIngredient(event);
  }) 
}

function showNutrients(event, id) {
  var ul = event.target.parentNode;
  var button = event.target;
  $.get("/ingredients/" + id + ".json").success(function(json) {
    if (json.nutrients.length > 0) {
      $(button).hide();
      json.nutrients.forEach(function(nutrient){
        $(ul).append('<li class="json_ingredients">' + nutrient.name + '</li>');
    })}
  });
}

function nextIngredient(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next_ingredient").attr("data-id")) + 1;
    $.get("/ingredients/" + nextId + "/data").success(function(data) {
      $(".ingredientName").text(data["name"]);
      if (data["recipes"]) {
        $(".recipe_replace").empty();
        data["recipes"].forEach(function(element){
          $(".recipe_replace").append('<li class="list_ingredients ingredient_recipes"><a href="/recipes/' + element.id + '">' + element.name + '</a></li>');
        })
        $(".nutrient_replace").empty();
        data["nutrients"].forEach(function(element){
          $(".nutrient_replace").append('<li class="list_ingredients ingredient_nutrients"><a href="/nutrients/' + element.id + '">' + element.name + '</a></li>');
        })
        // re-set the id to current on the link
        $(".js-next_ingredient").attr("data-id", data["id"]);
      }
    });
};

function previousIngredient(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next_ingredient").attr("data-id")) - 1;
    $.get("/ingredients/" + nextId + "/data").success(function(data) {
      $(".ingredientName").text(data["name"]);
      if (data["recipes"]) {
        $(".recipe_replace").empty();
        data["recipes"].forEach(function(element){
          $(".recipe_replace").append('<li class="list_ingredients ingredient_recipes"><a href="/recipes/' + element.id + '">' + element.name + '</a></li>');
        })
      if (data["nutrients"]) {
        $(".nutrient_replace").empty();
        data["nutrients"].forEach(function(element){
          $(".nutrient_replace").append('<li class="list_ingredients ingredient_nutrients"><a href="/nutrients/' + element.id + '">' + element.name + '</a></li>');
        })
      }
        // re-set the id to current on the link
        $(".js-next_ingredient").attr("data-id", data["id"]);
      }
    });
};

$(document).on('turbolinks:load', function() {
  pageReady();
});
