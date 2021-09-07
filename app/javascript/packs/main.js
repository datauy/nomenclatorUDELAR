var graph_options = {
  color: "#ee7474",
  gear_size: "65%",
  icon_relation: [2,5],
  size: '100%',
}
//Docentes y Funcionarios
window.selectTab = function(tab) {
  console.log("TAB: ", tab);
  $('.percentage-tabs').toggleClass('active');
  $('.tab-btn').toggleClass('active');
}
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
  //SERVICIOS
  $('#servicios').change((val) => {
    $.ajax({
      type: "get",
      url: '/',
      data: { "sid": $('#servicios').val() },
    });
  });
  $(window).scroll(function() {
    var y = $(this).scrollTop();
    if (y > $('.service-select').offset().top) {
      $('#servicios').addClass('active');
    } else {
      $('#servicios').removeClass('active');
    }
  });
});

// SEARCH
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
//Gráficas de Totales
window.totalsCharts = function(graphs, custom_options = graph_options) {
  $.each(graphs, function(elemId, percentage) {
    var options = {
      chart: {
        type: 'radialBar',
        width: custom_options.size,
        events: {
          mounted: (chartContext, config) => {
            try {
              var ico = chartContext.el.parentNode.previousElementSibling;
              ico.style.height = Math.round(chartContext.el.offsetHeight/custom_options.icon_relation[0])+"px";
              ico.style.top = Math.round(chartContext.el.offsetHeight/custom_options.icon_relation[1])+"px";
            } catch (e) {
              // Chart is not displayed, so error raised
              console.log('Error calculating height', e);
            }
          },
          updated: (chartContext, config) => {
            try {
              var ico = chartContext.el.parentNode.previousElementSibling;
              ico.style.height = Math.round(chartContext.el.offsetHeight/custom_options.icon_relation[0])+"px";
              ico.style.top = Math.round(chartContext.el.offsetHeight/custom_options.icon_relation[1])+"px";
            } catch (e) {
              // Chart is not displayed, so error raised
              console.log('Error calculating height', e);
            }
          }
        }
      },
      series: [percentage],
      colors: [custom_options.color],
      plotOptions: {
        radialBar: {
          hollow: {
            size: custom_options.gear_size
          },
          dataLabels: {
            name: {
              show: false
            },
            value: {
              show: false
            },
          }
        }
      }
    }
    var chart = new ApexCharts(document.getElementById(elemId), options);
    chart.render();
  });
}
