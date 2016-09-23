//custom cam for tesing
//import damkjer.ocd.*;
//Camera cam;

//video capture
//import com.hamoid.*; 
//VideoExport MovingNow; 

import processing.opengl.*;

float Speed, fov, drawdistance, Zplane;
ArrayList <Cubes> Kubes;
boolean hit = false;

void setup() {
  //video capture
  //MovingNow = new VideoExport(this, "checkonetwo.mp4"); 
  //custom camera
  //cam = new Camera(this,width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  size(640, 640, OPENGL); // using opengl for web
  randomSeed(33);
  
  Speed = 10; // obviously wanna make this dynamic later
  
  Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
  fov = PI/3.0;
  drawdistance = 2000;
  perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  
  Kubes = new ArrayList();
}

void draw() {
  //cam.feed();
  background (127);  

  //generate cubes & add to ArrayList 
  if (hit == false) {
    Cubes myKube = new Cubes(); 
    Kubes.add(myKube);
  }

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
    //println(Kubes.size(), myCube.pos.z, Zplane);
    //println(mouseX,mouseY);
  }
}

// for testing to check if cubes are in fact deleted once out of sight - they are :)
//void mouseDragged() {
//  if(mouseButton == LEFT){
//    cam.look(radians(mouseX - pmouseX) / 2.0, radians(mouseY - pmouseY) / 2.0);
//  }
//}

// for testing, spawns a single cube
void keyPressed() {
  //if (key == 'k') {
  //  Cubes myKube = new Cubes(); 
  //  Kubes.add(myKube);
  //  hit = false;
  //  Speed = 5;
  //}
  // reset
  if (key == 'r') {
    hit = false;
    Speed = 10;
  }
}