$(document).ready(function() {

  $('#hatchet').on('click', function(){
    $(this).effect('explode', {times:3}, 500);
    });

  $("#button_add_question").on('click', function(event) {
    event.preventDefault();
    var url = '/get_add_question_partial'
    $.get(url, function(response) {
        console.log(response);
      $('#add_question').append(response);
    });
  });

  $(document).on('click', '#stats',function(event){
    event.preventDefault();

    $('#hide').hide();
    // $("#show_the_stats").slideDown();
    $("#show_the_stats").html('<div id="placeholder" style="width:600px;height:300px"></div>').hide()
    $("#show_the_stats").slideDown();


    var url = $(this).parent().attr('href')
    console.log(url)

    $.get(url, function(response){
      console.log(response.data)

      var jsondata = response.data

      var data = new Array();

      for (var k in jsondata){
        var i=0
        var first_array = new Array();
        first_array[i] = k
        first_array[i+1] = jsondata[k]
        data.push(first_array)
      }

      $.plot('#placeholder', [ data ], {
          series: {
                  bars: {
                          show: true,
                          barWidth: 0.6,
                          align: "center"
                  }
          },
          xaxis: {
                  mode: "categories",
                  tickLength: 0
          }
    });


    }, "json")
  })
});


