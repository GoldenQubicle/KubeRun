//import com.hamoid.*;
//VideoExport MovingNow;

Cubes Cubes;

// camera stuff
float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;

float move;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4");

  size(640, 640, P3D);
  randomSeed(33);
  background (127);

  eyeX = width/2.0;
  eyeY =  height/2.0;
  eyeZ = (height/2.0) / tan(PI*30.0 / 180.0);
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;

  Cubes = new Cubes();
}


void draw() {
  background (128);

  //pointLight(51, 102, 126, 320, 0, 1000);
  //camera(mouseX, mouseY, eyeZ, mouseX, mouseY, centerZ, upX, upY, upZ);
  
  camera(eyeX, eyeY, eyeZ, eyeX, eyeY, centerZ, upX, upY, upZ);
  
  pushMatrix();
  translate(0, 0, move);                         
  Cubes.generator();
  popMatrix();
  
  move = move + 10;
  eyeZ = (eyeZ + 5);

  //MovingNow.saveFrame();
}