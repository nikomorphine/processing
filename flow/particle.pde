class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  int maxspeed = 4;
  int h = 0;
  
  PVector prevPos;

  Particle() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    prevPos = pos.copy();
  }
  
  void update() {
    vel.add(acc);
    pos.add(vel);
    vel.limit(maxspeed);
    acc.mult(0);
  }
  
  void follow(PVector [] vectors) {
    int x = floor(pos.x / scl);
    int y = floor(pos.y / scl);
    if (x >= cols) {
      x = cols - 1;
    }
    if (x <= 0) {
      x = 0;
    }
    if (y >= rows) {
      y = rows - 1;
    }
    if (y <= 0) {
      y = 0;
    }
    int i = x + y * cols;
    println(pos.x, pos.y);
    PVector force = vectors[i];
    applyForce(force);
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }

  void show() {
    stroke(h, 255, 255, 25);
    h += 1;
    if (h > 255) {
      h = 0;
    }
    line(pos.x, pos.y, prevPos.x, prevPos.y);
    updatePrev();
  }
  
  void updatePrev() {
    prevPos.x = pos.x;
    prevPos.y = pos.y;
  }
  
  void edges() {
    if (pos.x > width) {
      pos.x = 0;
      updatePrev();
    }
    if (pos.x < 0) {
      pos.x = width;
      updatePrev();
    }
    if (pos.y > height) {
      pos.y = 0;
      updatePrev();
    }
    if (pos.y < 0) {
      pos.y = height;
      updatePrev();
    }
  }
  
  

}
