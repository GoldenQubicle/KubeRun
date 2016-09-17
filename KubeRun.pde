//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture


float Speed, fov, drawdistance, Zplane;

ArrayList<Cubes> Kubes;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture

  size(640, 640, P3D);
  randomSeed(33);
  background (127);

  Speed = 5; // obviously wanna make this dynamic later

  Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
  fov = PI/3.0;
  drawdistance = 2000;
  perspective(fov, float(width)/float(height), 1, drawdistance); // need custom perpective to set zNear at 1

  Kubes = new ArrayList();
}


void draw() {
  background (127);
  
  //generate cubes & add to ArrayList 
  Cubes myKube = new Cubes(); 
  Kubes.add(myKube);
  
  // iterate backwards over Arraylist & delete cubes once out of sight
  for (int i = Kubes.size()-1; i >= 0; i--) {   
    Cubes myCube = Kubes.get(i);
    pushMatrix();
    translate(mouseX-width/2, mouseY-height/2, 0);  //mouse movement
    myCube.display();
    myCube.move();
    if (myCube.OutOfSight()) {
      Kubes.remove(i);
      //println(Kubes.size());
    }  
    popMatrix();
  }
}


// for testing
void keyPressed() {
  if (key == 'k') {

    Cubes myKube = new Cubes(); 
    Kubes.add(myKube);
  }
}


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