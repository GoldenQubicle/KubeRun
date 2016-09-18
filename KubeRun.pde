//import com.hamoid.*; // video capture
//VideoExport MovingNow; // video capture

import processing.opengl.*;

float Speed, fov, drawdistance, Zplane;

ArrayList<Cubes> Kubes;

boolean hit = false;

void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4"); // video capture

  size(640, 640, OPENGL);
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
      myCube.collision();
      if (myCube.OutOfSight()) {
        Kubes.remove(i);
      }  
      popMatrix();
      //println(hit);
      println(Kubes.size());
    }
  }


// for testing
void keyPressed() {
  if (key == 'k') {

    Cubes myKube = new Cubes(); 
    Kubes.add(myKube);
    hit = false;
  }
}