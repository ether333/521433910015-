float x = 50;
float y = 50;
float w = 100;
float h = 50;
float xx = 50;
float yy = 200;


void setup() {
  size(800, 800);
  background(255);
  stroke(0);
  noFill();
}

void draw() {

  if (mousePressed && mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {
    fill(100);
  } else {
    fill(0);
  }
  rect(x, y, w, h);


  fill(255);
  rect(xx, yy, w, h);

  show();
  clean();
}


void show() {
  if (mousePressed) {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) {


      fill(random(255));
      ellipse(random(width), random(height), 40, 40);
    }
  }
}

void clean() {
  if (mousePressed) {
    if (mouseX>xx && mouseX <xx+w && mouseY>yy && mouseY <yy+h) {
      fill(255);
      rect(0, 0, width, height);
    }
  }
}
