int cols, rows;
int sclx = 40;
int scly = 20;
int w = 3000;
int h = 1500;

float flying;

float[][] terrain;

void setup() {
  size(800, 600, P3D);
  cols = w / sclx;
  rows = h / scly;
  terrain = new float[cols][rows];
}

void draw() {
  
  flying -= 0.1;
  
  float yoff = flying;;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -150, 150);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  colorMode(HSB);
  background(0, 0, 200);
  stroke(0, 0, 150, 150);
  translate(width / 2, height / 2);
  translate(0, 250);
  rotateX(10 * PI / 21);
  translate(-w / 2, -h / 2);
  for (int y = 0; y < rows - 1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      fill((x * y) % 10 + 100, 200, 200, 100);
      vertex(x * sclx, y * scly, terrain[x][y]);
      vertex(x * sclx, (y + 1) * scly, terrain[x][y + 1]);
      //rect(x * scl, y * scl, scl, scl);
    }
    endShape();
  }
}
