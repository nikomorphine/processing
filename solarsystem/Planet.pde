class Planet {
  float radius;
  float angle;
  float distance;
  float orbitspeed;
  PVector v;
  
  PShape globe;

  Planet(float r, float d, float o, PImage img) {
    v = PVector.random3D();
    radius = r;
    distance = d;
    v.mult(distance);
    angle = random(TWO_PI);
    orbitspeed = o;
    
    noStroke();
    noFill();
    globe = createShape(SPHERE, radius);
    globe.setTexture(img);
  }
  
  void orbit() {
    angle = angle + orbitspeed;
  }
  
  void show() {
    pushMatrix();
    noStroke();
    
    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    
    rotate(angle, p.x, p.y, p.z);
    
    translate(v.x, v.y, v.z);
    shape(globe);
    popMatrix();
  }
  
}
