float x=255;
float y=255;
float z=255;

void setup() {
  size(800, 800);
  background(#EA508C);
}

void draw() {

  //background(234,80,140);
  fill(234, 80, 140, 80);
  rect(0, 0, width, height);

  fill(x, y, z);
  noStroke();
  ellipse(mouseX, mouseY, 230, 200);
  ellipse(mouseX-50, mouseY-80, 70, 250);
  ellipse(mouseX+50, mouseY-80, 70, 250);

  fill(0);
  noStroke();
  ellipse(mouseX-40, mouseY-20, 15, 25);
  ellipse(mouseX+40, mouseY-20, 15, 25);

  stroke(0);
  line(mouseX-15, mouseY+25, mouseX+15, mouseY+50);
  strokeWeight(10);
  line(mouseX+15, mouseY+25, mouseX-15, mouseY+50);
  strokeWeight(10);
  x=random(255);
  y=random(255);
  z=random(255);
}
