//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture

Cubes Cubes;

// camera & movement
float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;
float move, speed;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture

  size(640, 640, P3D);
  randomSeed(33);
  background (127);

  Cubes = new Cubes();
  speed = 5;

  // camera 
  eyeX = width/2.0;
  eyeY =  height/2.0;
  eyeZ = 640; // height/2.0; // tan(PI*30.0 / 180.0);
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
}


void draw() {
  background (128);

  //pointLight(51, 102, 126, 320, 0, 1000);
  //camera(mouseX, mouseY, eyeZ, mouseX, mouseY, centerZ, upX, upY, upZ);

  camera(eyeX, eyeY, eyeZ, eyeX, eyeY, centerZ, upX, upY, upZ); // STATIC CAMERA AT 640

  pushMatrix();
  translate(0, 0, move);                         
  Cubes.generator();
  Cubes.collision();
  popMatrix();

  move = move + speed; //speed at which the cubes which HAVE BEEN GENERATED move towards viewer 




  /* ISSUE TO BE SOLVED
   generated kubes are STILL being stored in table while out of view
   this it unnecesarry
   NO, ISSUE IS ITERATION OVER TABL?!
   thus: grab z position of kube inside generator, grab  Zposition kube of 'camera rail', i.e. move
  */
  
  

//  println(Cubes.Z(),move); // these are now same values, so they're in sync


    




  //MovingNow.saveFrame(); // video capture
}