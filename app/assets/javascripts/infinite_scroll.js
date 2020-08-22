$(document).on("turbolinks:load", function() {
    if ($("nav.pagination a[rel=next]").length){
      $(".posts-index").infiniteScroll({
        path: "nav.pagination a[rel=next]",
        append: ".posts-index ul",
        elementScroll: true,
        history: true,
        prefill: false,
        status: ".page-load-status",
        hideNav: ".pagination"
      })