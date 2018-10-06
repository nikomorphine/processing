float inc = 0.1;
float scl = 10;
int cols, rows;


float zoff = 0;

Particle[] particles = new Particle[5000];

PVector[] flowField;

void setup() {
  fullScreen(P2D);
  colorMode(HSB, 255);
  cols = floor(width / scl);
  rows = floor(height / scl);
  
  flowField = new PVector[cols * rows];
  
  for (int i = 0; i < 5000; i++) {
    particles[i] = new Particle();
  }
  
  background(51);
}

void draw() {
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x ++) {
      int index = x + y * cols;
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 4;
      PVector v = new PVector(cos(angle), sin(angle));
      v.setMag(1);
      flowField[index] = v;
      xoff += inc;
      stroke (0);
    }
    yoff += inc;
    zoff += 0.0003;
  }
  
  for (int i = 0; i < particles.length; i++) {
    particles[i].edges();
    particles[i].follow(flowField);
    particles[i].update();
    
    particles[i].show();
  }
}
