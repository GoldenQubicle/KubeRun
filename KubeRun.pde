//video capture
//import com.hamoid.*; 
//VideoExport MovingNow; 

import processing.opengl.*;

float Speed, fov, drawdistance, Zplane;
ArrayList <Cubes> Kubes;
boolean hit = false; // collision check
boolean start = false; // restart game
PVector randomXY, mouseXY; // needed for autorun

void setup() {
  //video capture
  //MovingNow = new VideoExport(this, "checkonetwo.mp4"); 
  size(640, 640, OPENGL); // using opengl for web
  randomXY = new PVector(random(0, 640), random(0, 640)); // needed for autorun
  
  Speed = 10; // obviously wanna make this dynamic later
  
  Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
  fov = PI/3.0;
  drawdistance = 2000;
  perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
 
  Kubes = new ArrayList();
}

void draw() {
  background (127);
  //autorun();

  //generate cubes & add to ArrayList 
  if ((hit == false) && (start == true)) {
    Cubes myKube = new Cubes(); 
    Cubes myKubextra = new Cubes(); 
    Kubes.add(myKube);
    Kubes.add(myKubextra);
  }

  // iterate backwards over Arraylist & delete cubes once out of sight
  for (int i = Kubes.size()-1; i >= 0; i--) {   
    Cubes myCube = Kubes.get(i);
    pushMatrix();
    translate(mouseX-width/2, mouseY-height/2, 0);   //mouse movement 
    //translate(randomXY.x-width/2, randomXY.y-height/2, 0);  //autorun
    myCube.display();
    myCube.move();
    myCube.collision();
    if (myCube.OutOfSight()) {
      Kubes.remove(i);
    }
    popMatrix();
  }
}

// auturun
// dont forget to switch collision as well!!
//PVector autorun() {
//  if ((hit == true) && (start == false)) {
//    hit = false;
//    start = true; 
//    Speed = 10;
//    Kubes = new ArrayList();
//    randomXY = new PVector(random(0, 640), random(0, 640));
//  }
//  return randomXY;
//}

void mouseClicked() {
  noCursor();
}

// reset on spacebar
void keyPressed() {
  if ((key == ' ') && (start == false)) {
    start = true; 
    hit = false;
    Speed = 10;
    Kubes = new ArrayList();
  }
}