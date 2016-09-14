//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture


float Speed, cameraZ, fov, t;

ArrayList<Cubes> Kubes;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture

  size(640, 640, P3D);
  randomSeed(33);
  background (127);

  Speed = 5;

  fov = PI/3.0;
  cameraZ = 320;
  perspective(fov, float(width)/float(height), 1, cameraZ*10.0);

  Kubes = new ArrayList();
}


void draw() {
  background (127);
  //generate cubes & add to ArrayList
  Cubes myKube = new Cubes(); 
  Kubes.add(myKube);

  //mouse movement
  pushMatrix();
  translate(mouseX-width/2, mouseY-height/2, 0);
  
  for (Cubes myKubes : Kubes) {
    myKubes.display();
    myKubes.move();
  }
  
  popMatrix();

  println(Kubes.size());
}



void keyPressed() {
  if (key == 'k') {

    Cubes myKube = new Cubes(); 
    Kubes.add(myKube);
  }
}

//void Cube() {
//  pushMatrix();
//  translate(320, 320, cubeZ); 
//  box(10, 10, 10);
//  fill(20, 122, 122);
//  popMatrix();




/*  collision
 center screen, currentlty 320,320 , will be randomized 
 box width & height currently 2, 15
 ergo the cube hit area = 
 (320-2),(320+2), (320-15), (320+15)
 
 CubeX-CubeW, CubeX+CubeW, CubeY-CubeH, CubeY+CubeH   
 
 however!! the 320,320 currently ALSO represent the center screen
 issue is, this will replaced with mouseX,mouseY which will be put into another translate
 so eventual collision check needs to take that into account, too
 
 
 ARG obviously also need collistion detection ALL AROUND 
 because of course one can crash into cube from the side, from beneath and so on
 
 */