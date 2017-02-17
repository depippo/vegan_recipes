function nutrientPageReady() {
  $(".js-next_nutrient").on("click", function(event) {
    nextNutrient(event);
  })
  $(".js-previous_nutrient").on("click", function(event) {
    previousNutrient(event);
  }) 
}

function nextNutrient(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next_nutrient").attr("data-id")) + 1;
    $.get("/nutrients/" + nextId + ".json").success(function(json) {
      $(".nutrientName").text(json["name"]);
      if (json["ingredients"]) {
        $(".nutrient_ingredients").empty();
        json["ingredients"].forEach(function(element){
          $(".nutrient_ingredients").append('<li class="list"><a href="/ingredients/' + element.id + '">' + element.name + '</a></li>');
        })
        // re-set the id to current on the link
        $(".js-next_nutrient").attr("data-id", json["id"]);
      }
    });
};

function previousNutrient(event) {
    event.preventDefault();
    var nextId = parseInt($(".js-next_nutrient").attr("data-id")) - 1;
    $.get("/nutrients/" + nextId + ".json").success(function(json) {
      $(".nutrientName").text(json["name"]);
      if (json["ingredients"]) {
        $(".nutrient_ingredients").empty();
        json["ingredients"].forEach(function(element){
          $(".nutrient_ingredients").append('<li class="list"><a href="/ingredients/' + element.id + '">' + element.name + '</a></li>');
        })
        // re-set the id to current on the link
        $(".js-next_nutrient").attr("data-id", json["id"]);
      }
    });
};

$(document).on('turbolinks:load', function() {
  nutrientPageReady();
});
