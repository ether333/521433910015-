Ball[] tinyBalls;
int totalNumOfBalls = 30;
int dd = 50;
int bc = 255;
int t;
void setup() {
  size(800, 800);
  background(0);
  //float bX_,float bY_,float bD_
  initiateData();

}

void initiateData() {
  tinyBalls = new Ball[totalNumOfBalls];
  for (int i = 0; i  < tinyBalls.length; i ++) {
    float dd = random(10, 60);
    tinyBalls[i] = new Ball(random(width), random(height), dd);
  }
}


void draw() {
  t++;
  background(bc);
  //fill(255);
  //noStroke();
  //rect(0,0,width,height);
  for (int i = 0; i  < tinyBalls.length; i ++) {
    tinyBalls[i].display();
   tinyBalls[i].shakeHand();
    tinyBalls[i].edge();
    tinyBalls[i].move();
    fill(255, 0, 0);
    noStroke();
    ellipse(mouseX, mouseY, dd, dd);
    fill(0);
    textSize(50);
    text("score :" + t,0,50);
  }
}
