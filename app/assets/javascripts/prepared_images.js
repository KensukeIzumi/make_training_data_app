
$(function(){
  var hasSelected = function(data){

    var x1 = data.x;
    var y1 = data.y;

    var x2 = data.x2;
    var y2 = data.y2;

    $(':text[name="start_x"]').val(x1);
    $(':text[name="start_y"]').val(y1);
    $(':text[name="end_x"]').val(x2);
    $(':text[name="end_y"]').val(y2);

    console.log('選択領域は(' + x1 + ',' + y1 + ')から(' + x2 + ',' + y2 + ') までです。')};

    var hasChanged = function(){
    };

    var hasReleased = function(){
    };

    $('.target').Jcrop({
      onSelect: hasSelected,
      onChange: hasChanged,
      onRelease: hasReleased
    });
});


$(function(){
  draw_image();
  draw_rect();
});

function draw_image(){

  var canvas = document.getElementById('canvas');
  var ctx = canvas.getContext('2d');

  var img = new Image();
  img.src = document.getElementById("prepared_image").value;

  img.onload = function(){
    ctx.drawImage(img,0,0);
  }

}

function draw_rect(){
  $('.rect_resource').each(function(){

    var coordinates = $("input",this)
    var start_x = coordinates[0].value;
  var start_y = coordinates[1].value;
  var end_x = coordinates[2].value;
  var end_y = coordinates[3].value;
  var name = coordinates[4].value;

  console.log($(this))
    console.log($("input",this)[0].value)
    console.log(start_x)
    console.log(document)


    var img = new Image();
  img.src = document.getElementById("prepared_image").value;

  var canvas = document.getElementById('canvas');
  var ctx = canvas.getContext('2d');

  img.onload = function(){
    ctx.beginPath();
    ctx.strokeStyle = 'rgb(192,80,77)';
    ctx.lineWidth = 5;
    ctx.strokeRect(start_x,start_y,end_x - start_x,end_y - start_y);
    ctx.font='bold 20px';
    ctx.fillText(name,start_x,start_y);
  }
  });
}


$("#report").click(function(){
  alert("ご協力ありがとうございます。");
});

