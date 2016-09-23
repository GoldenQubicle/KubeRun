//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture

import processing.opengl.*;
import damkjer.ocd.*;

//Camera cam;


float Speed, fov, drawdistance, Zplane;

ArrayList<Cubes> Kubes;

boolean hit = false;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture
  //cam = new Camera(this,width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  size(640, 640, OPENGL); // using opengl for web
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
  //cam.feed();

  //generate cubes & add to ArrayList 
  if (hit == false){
      Cubes myKube = new Cubes(); 
      Kubes.add(myKube);}

  // iterate backwards over Arraylist & delete cubes once out of sight
  for (int i = Kubes.size()-1; i >= 0; i--) {   
    Cubes myCube = Kubes.get(i);
    pushMatrix();
    translate(mouseX-width/2, mouseY-height/2, 0);  //mouse movement
    myCube.display();
    myCube.move();
    myCube.collision();
    if (myCube.OutOfSight()) {
      Kubes.remove(i);
      }  
    popMatrix();
    println(Kubes.size());
    //println(mouseX,mouseY);
    //println(mouseX,mouseY, myCube.cubeXl,myCube.cubeXr,myCube.cubeYu, myCube.cubeYd);
  }

  //println(mouseX,mouseY);
}
//void mouseDragged() {
//    cam.look(radians(mouseX - pmouseX) / 2.0, radians(mouseY - pmouseY) / 2.0);
//}

// for testing
void keyPressed() {
  if (key == 'k') {
    Cubes myKube = new Cubes(); 
    Kubes.add(myKube);
    hit = false;
    Speed = 5;
  }
  if (key == 'r') {
    hit = false;
  }
}