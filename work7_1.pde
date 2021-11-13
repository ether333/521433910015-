float theta;   

void setup() {
  size(640, 360);
  background(0);
}

void draw() {
  //background(0);
  fill(0,100);
  rect(0,0,width,height);
  stroke(255);
  float a = (mouseY / (float) height) * 60f;
  theta = radians(a);
  translate(width/2,height);
  translate(0,80);
  branch(120);

}

void branch(float h) {
  h *= 0.75;
  
  
  if (h > 2) {
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
    

    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
