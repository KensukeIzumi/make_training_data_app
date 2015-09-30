$(function(){
  draw();
});

function draw(){
  var categolized_x1 = document.getElementById("start_x").value;
  var categolized_y1 = document.getElementById("start_y").value;
  var categolized_x2 = document.getElementById("end_x").value;
  var categolized_y2 = document.getElementById("end_y").value;

  var img = new Image();
  img.src = document.getElementById("image_path").value;

  var canvas = document.getElementById('show_image');
  var ctx = canvas.getContext('2d');

  ctx.drawImage(img,0,0);

  ctx.beginPath();
  ctx.strokeStyle = 'rgb(192,80,77)';
  ctx.lineWidth = 5;
  ctx.strokeRect(categolized_x1,categolized_y1,categolized_x2 - categolized_x1,categolized_y2 - categolized_y1);
}

