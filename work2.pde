
void setup() {
  size(800, 800);
  background(255);
}

void draw() {
  background(255);
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  if (keyPressed) {
    display();
  }
}

void display() {

  for (int i = 0; i < 20; i++) {
    fill(0, random(20, 60));
    noStroke();
    float dd = random(50, 500);
    rect(random(width), random(height), dd, dd);
  }
}



void keyPressed() {
  if ( key == 'r' ) {
    display();
  }
}
