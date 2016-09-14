//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture


float Speed, fov, drawdistance;

ArrayList<Cubes> Kubes;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture

  size(640, 640, P3D);
  randomSeed(33);
  background (127);

  Speed = 2.5; 

  fov = PI/3.0;
  drawdistance = 2000;
  perspective(fov, float(width)/float(height), 1, drawdistance);

  Kubes = new ArrayList();
}


void draw() {
  background (127);

  //generate cubes & add to ArrayList !! STILL NEED TO REMOVE CUBES ONCE OUT OF SIGHT!!
  //Cubes myKube = new Cubes(); 
  //Kubes.add(myKube);

  pushMatrix();
  translate(mouseX-width/2, mouseY-height/2, 0);  //mouse movement
  for (Cubes myKubes : Kubes) {
    myKubes.display();
    myKubes.move();
    //println(myKubes.cubeZ);
  }
  popMatrix();
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