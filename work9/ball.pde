String message = "GAME OVER";
class Ball {
  float bX, bY, bD;
  color c = 255;
  //douzaohanshu
  boolean shakeHand;
  float speedX, speedY;
  Ball(float bX_, float bY_, float bD_) {
    bX = bX_;
    bY = bY_;
    bD = bD_;
    speedX = random(-5, 5);
    speedY = random(-5, 5);
  }

  void move() {
    bX += speedX;
    bY += speedY;
  }

  void edge() {
    if (bX >= width + bD/2) {
      bX = -bD/2;
    }
    if (bX <= -bD/2) {
      bX = width + bD/2;
    }
    if (bY >= height + bD/2) {
      bY = -bD/2;
    }
    if (bY <= -bD/2) {
      bY = height + bD/2;
    }
  }
  void display() {
    if (shakeHand) {
      stroke(255, 255, 0);
    } else {
      stroke(c);
    }
    fill(0);
    noStroke();
    ellipse(bX, bY, bD, bD);
  }


  void shakeHand() {
    for (Ball b : tinyBalls) {//: shuyu
      if (b != this) {//budengyu
        float rR = b.bD/2 + dd/2;
        float d  = sqrt(( b.bX - mouseX)*( b.bX - mouseX)
          +( b.bY - mouseY) *( b.bY - mouseY));
        if (d < rR) {
          shakeHand =true;
          bc = 0;
          textSize(100);
          fill(255, 0, 0);
          text("GAME OVER", 0, height/2);
        }
      }
    }
  }
}
