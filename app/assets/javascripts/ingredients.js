$(document).on('turbolinks:load', function() {
  showNutrients();
});

function showNutrients() {
  $(".js-shownutrients").one("click", function(event) {
    var ul = event.target.parentNode;
    var button = event.target;
    var id = $(this).data("id");
    $.get("/ingredients/" + id + ".json").success(function(json) {
      console.log(json.nutrients.length);
      if (json.nutrients.length > 0) {
        $(button).hide();
        json.nutrients.forEach(function(nutrient){
          $(ul).append('<li class="json_ingredients">' + nutrient.name + '</li>');
      })}
    });
  });
}