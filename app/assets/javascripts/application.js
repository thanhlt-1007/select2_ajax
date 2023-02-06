//= require jquery
//= require select2

$( document ).on("ready", function() {
  $("#js-select-category-id").select2();
  $("#js-select-category-id").on("select2:select", function() {
    $("#js-select-article-id").val(null).trigger("change");
  });

  $("#js-select-article-id").select2({
    ajax: {
      url: '/home/search',
      data: function (params) {
        var category_id = $("#js-select-category-id").val();
        var search = params.term;
        var page = params.page || 1;

        var query = {
          search: search,
          page: page,
          category_id: category_id
        }

        return query;
      }
    }
  });
});
