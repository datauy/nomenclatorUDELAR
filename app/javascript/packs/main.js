$(document).ready(() => {
  console.log('MAIN RUNNING');
  $('.more-data').click((person) => {
    $(person.target).parent().next().toggleClass('hidden');
  });
});
