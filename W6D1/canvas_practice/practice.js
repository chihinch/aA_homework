document.addEventListener("DOMContentLoaded", function(){
  const canvasElement = document.getElementById("mycanvas");
  canvasElement.width = 500;
  canvasElement.height = 500;
  const ctx = canvasElement.getContext('2d');

  // Draw a rectangle
  ctx.fillStyle = "grey";
  ctx.fillRect(0, 0, 200, 150);

  // Draw a circle
  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = "red";
  ctx.stroke();
  ctx.fillStyle = "red";
  ctx.fill();
  
  // Draw my favourite shape
  ctx.beginPath();
  ctx.moveTo(250, 250);
  ctx.bezierCurveTo(230, 384, 299, 312, 50, 50);
  ctx.bezierCurveTo(124, 165, 95, 82, 23, 68);
  ctx.closePath();
  ctx.strokeStyle = "black"
  ctx.stroke();
  ctx.fillStyle = "orange";
  ctx.fill();
});




