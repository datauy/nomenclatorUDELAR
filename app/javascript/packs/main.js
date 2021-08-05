$(document).ready(() => {
  //Set search type by checked
  $('.select-box span').text($('.search_type:checked').val());
  //Run search
  search();
  //SEARCH
  //Dropdown
  $('.type-select').click(() => {
    $('.type-options').toggleClass('hidden');
    $('.type-select i').toggleClass('up');
  });
  //Type select
  $('.search_type').change((radio) => {
    search();
    $('.type-select').click();
    $('.select-box span').text(radio.target.value);
  });
  //Search
  $('#query').keyup(function(e) {
    if ( triggerSearch(e, $(this).val()) ) {
      search();
    }
  });
  //ROOMS
  $('#servicios').change((val) => {
    $.ajax({
      type: "get",
      url: '/',
      data: { "sid": $('#servicios').val() },
      //cache: false,
    });
  });
});
function search() {
  $.ajax({
    type: "get",
    url: '/',
    data: $('#search').serializeArray(),
    //cache: false,
  });
}
function triggerSearch(e, value) {
  if ( value.length > 3 || value.length == 0 ) {
    var specialKeys = new Array();
    specialKeys.push(8); //Backspace
    specialKeys.push(46); //Delete
    var keyCode = e.keyCode == 0 ? e.charCode : e.keyCode;
    var ret = (
      (keyCode >= 48 && keyCode <= 57) ||
      (keyCode >= 65 && keyCode <= 90) ||
      (keyCode >= 97 && keyCode <= 122) ||
      ( (keyCode == 8 || keyCode == 46) && e.charCode != e.keyCode ) //Back y delete
    );
    return ret;
  }
  return false
}
function selectTab(tab) {
  console.log("TAB: ", tab);
}
