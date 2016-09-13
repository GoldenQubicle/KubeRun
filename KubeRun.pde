//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture

// camera 
float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture

  size(640, 640, P3D);
  randomSeed(33);
  background (127);

  // camera 
  eyeX = width/2.0;
  eyeY =  height/2.0;
  eyeZ =  height/2.0; // tan(PI*30.0 / 180.0);
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
}

void draw() {
  background (128);
  camera(eyeX, eyeY, eyeZ, eyeX, eyeY, centerZ, upX, upY, upZ); // STATIC CAMERA AT 640
  
  translate(320,320,0);
  box(10,10,10);
  //MovingNow.saveFrame(); // video capture
  eyeZ = eyeZ + 5;
}