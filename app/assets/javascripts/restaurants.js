$(document).on('ready', function() {

  function display_search_results() {
    // readyState === 4 means that the asynchronous request completed successfully
    if (this.readyState === 4) {
      console.log(this);
      $('#restaurants').html() = this.responseText;
    }
  }

  $('#search-form').submit(function(event) {
    event.preventDefault();
    var searchValue = $('#search').val();

    $.getScript('/restaurants?search=' + searchValue);
  });

})
