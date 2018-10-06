import peasy.*;

ArrayList<Firework> fireworks;

PVector gravity = new PVector(0, 0.2);

PeasyCam cam;

void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
  //cam = new PeasyCam(this, 1500);

  fireworks = new ArrayList<Firework>();
  colorMode(HSB);
  background(0);
}

void draw() {


  if (random(1) < 0.2) {
    fireworks.add(new Firework());
  }
  
  float m = map(mouseX, 0, width, -0.005, 0.005);
  

  background(0);
  translate(width/2, height, -1000);
  rotateY(frameCount*m);

  // Floor
  noStroke();
  fill(51);
  beginShape();
  vertex(-1000, height/2, -1000);
  vertex(1000, height/2, -1000);
  vertex(1000, height/2, 1000);
  vertex(-1000, height/2, 1000);
  endShape(CLOSE);


  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done()) {
      fireworks.remove(i);
    }
  }
}
