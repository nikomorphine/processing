import peasy.*;

Planet sun;
Planet mercury;
Planet venus;
Planet earth;
Planet mars;

PeasyCam cam;

PImage sunTexture;
PImage[] textures = new PImage[4];

void setup() {
  fullScreen(P3D);
  sunTexture = loadImage("sunmap.jpg");
  textures[0] = loadImage("mercurymap.jpg");
  textures[1] = loadImage("venusmap.jpg");
  textures[2] = loadImage("earthmap.jpg");
  textures[3] = loadImage("marsmap.jpg");
  cam = new PeasyCam(this, 500);
  sun = new Planet(50, 0, 0, sunTexture);
  mercury = new Planet(10, 100, -0.1, textures[0]);
  venus = new Planet(19, 150, 0.05, textures[1]);
  earth = new Planet(25, 250, 0.02, textures[2]);
  mars = new Planet(20, 350, 0.01, textures[3]);
}

void draw() {
  background(0);
  rotateY(frameCount*0.03);
  float dir = 200;
  int angle = 0;
  spotLight(255, 255, 255, dir, 0, 0, -1, 0, 0, angle, 0);
  spotLight(255, 255, 255, -dir, 0, 0, 1, 0, 0, angle, 0);
  spotLight(255, 255, 255, 0, dir, 0, -1, 0, 0, angle, 0);
  spotLight(255, 255, 255, 0, -dir, 0, 0, 1, 0, angle, 0);
  spotLight(255, 255, 255, 0, 0, dir, 0, -1, 0, angle, 0);
  spotLight(255, 255, 255, 0, 0, -dir, 0, 0, 1, angle, 0);
  
  sun.show();
  sun.orbit();
  
  mercury.show();
  mercury.orbit();
  
  venus.show();
  venus.orbit();
  
  earth.show();
  earth.orbit();
  
  mars.show();
  mars.orbit();
}
