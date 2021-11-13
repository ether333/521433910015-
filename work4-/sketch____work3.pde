String message = "Welcome to SJTU";
float r = 100;

void setup() {
  size(800, 800);
  textAlign(CENTER);
}

void draw() {
  frameRate(2);
  background(255);
  translate(width/2, height/2);
  noFill();
  stroke(0);
  ellipse(0, 0, r*2, r*2);

  float tHeight = 0;
  for (int i = 0; i < message.length(); i++) {
    float tH = random(48, 64);
    textSize(tH);
    char c = message.charAt(i);
    float tW = textWidth(c);

    tHeight += tW/2;
    float theta = PI + tHeight/r;

    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta + PI/2);
    fill(random(100,255),0,0);
    text(c, 0, 0);
    popMatrix();

    tHeight += tW/2;
  }
}
