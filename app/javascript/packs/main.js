var graph_options = {
  color: "#c69aff",
  gear_size: "65%",
  icon_relation: [2,5],
  size: '140%',
}
//Docentes y Funcionarios
window.selectTab = function(tab) {
  $('.percentage-tabs').toggleClass('active');
  $('.tab-btn').toggleClass('active');
}
document.addEventListener('turbolinks:load', () => {
    console.log("READY MAIN");
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
    if ( $( "#container-servicios" ).length ){
      $(window).scroll(function() {
        var y = $(this).scrollTop();
        if (y > $('.service-select').offset().top) {
          $('#container-servicios').addClass('active');
        } else {
          $('#container-servicios').removeClass('active');
        }
      });
    }
    createMap();
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
        /*events: {
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
        }*/
      },
      series: [percentage],
      colors: [custom_options.color],
      fill: {
        colors: ['#005598']
      },
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
          },
          /*track: {
            background: '#C69AFF',
          }*/
        }
      }
    }
    var chart = new ApexCharts(document.getElementById(elemId), options);
    chart.render();
  });
}

function createMap(){
  //const iconDiv = iconSVG + '<img src="'+shadowUrl+'"></img>' ;
  var iconDefault = L.icon({
    className: "salas-marker",
    iconUrl: '/images/pin.png',
    shadowUrl: '/images/marker-shadow.png',
    iconSize: [28, 38],
    iconAnchor: [14, 38],
    popupAnchor: [1, -34],
    tooltipAnchor: [16, -28],
    shadowSize: [41, 10],
    shadowAnchor: [14, 6]
  });
  L.Marker.prototype.options.icon = iconDefault;
  $.getJSON("salas_de_lactancia_merged.geojson", function (salas) {
    this.animating = true;
    this.map = new L.Map("map", {minZoom:4}).setView([-11.336196, -63.605775], 4);
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
    }).addTo(this.map);
    L.geoJSON(salas).addTo(this.map);
    var mapBounds = [];
    salas.features.forEach((feature) => {
      mapBounds.push(feature.geometry.coordinates.slice(0,2).reverse())
    })
    this.map.flyToBounds(mapBounds);
  } );
}
