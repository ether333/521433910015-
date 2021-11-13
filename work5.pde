class Agent {
  PVector location;
  float diameter = 10;
  boolean agentTouch;
  PVector speed;
  PVector center;
  int agentIndex;
  int agentOrder = 0;
  ArrayList<PVector> pair;

  Agent(PVector loc, int i) {
    location = loc;
    agentIndex = i;

    pair = new ArrayList<PVector>();
    center = new PVector(width/2, height/2);
  }

  void update(PVector s) {
    touch();
    move(s);
    show();
  }

  void move(PVector speed_) {

    if (agentTouch) {
      speed = new PVector(0, 0);
    } else {
      speed = speed_;
      speed.add(PVector.sub(center, location).normalize().mult(2));
    }
    location.add(speed);
  }

  void show() {
    if (agentTouch) {
      float dac = PVector.dist(this.location, center);
      float cc = map(dac, 0, width/2, 0, totalNum);
      stroke(cc, 100, 100);
      noFill();
    } else {
      noFill();
      noStroke();
    }

    ellipse(location.x/2, location.y*2, diameter, diameter);
    ellipse(location.x/2+400, location.y*2, diameter, diameter);
    ellipse(location.x, location.y*2, diameter, diameter);
    ellipse(location.x/2-100, location.y*2, diameter, diameter);
  }


  void touch() {
    agents.get(0).agentTouch = true;

    for (Agent a : agents) {
      if (this != a && a.agentTouch && !this.agentTouch) {
        float dd = PVector.dist(this.location, a.location);
        if (dd <= (this.diameter+a.diameter)/2) {
          this.agentTouch = true;

          pair.add(new PVector(this.agentIndex, a.agentIndex));
          order ++;
          agentOrder = order + 1;
        } else {
          this.agentTouch = false;
        }
      }
    }
  }

  void drawConnection() {
    if (pair != null) {
      for (PVector p : pair) {
        stroke(255);
        float sw =  map(agentOrder, 0, agents.size(), 10, 1);
        strokeWeight(sw);
        line(agents.get((int)p.x).location.x, agents.get((int)p.x).location.y,
          agents.get((int)p.y).location.x, agents.get((int)p.y).location.y);
      }
    }
  }
}
