void setup() {
  size(800,800);
  noStroke();
}

void draw() {
  float x = mouseX;
  float y = mouseY;
  float ix = width - mouseX;
  float iy = height - mouseY;
  background(200);
  fill(255, 150);
  rect(x, height/2, y, y/2);
  fill(0, 159);
  rect(ix, height/2, iy, iy);
  fill(0,200);
  rect(x,height,y,y*2);
  fill(255,80);
  rect(ix,0,iy*2,iy);
  fill(0,230);
  rect(x,ix,y,iy);
  fill(255,50);
  rect(x-300,iy,ix,x);
  fill(0,30);
  rect(x,y,ix,iy);
  stroke(0);
  strokeWeight(x/100);
  line(x*2,0,x*2,height);
  line(0,y,width,y);
  
}
