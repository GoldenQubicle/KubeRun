//video capture
//import com.hamoid.*; 
//VideoExport MovingNow; 

import processing.opengl.*;

state state;
GUI GUI;


void setup() {
  size(640, 640, OPENGL); // using opengl for web
  state = new state();
  GUI = new GUI();
  //video capture
  //MovingNow = new VideoExport(this, "checkonetwo.mp4");
  
}

void draw() {
  background (127);
  GUI.display();
  
  //state.autorun();
  state.core();
  state.finish();
  
  // state failure

  
}

void mouseClicked() {
  // needs to trigger countdown when clicked on start ui button 

  noCursor();
}

void keyPressed() {
  // spawn single cube for debug
  if (key == 'k'){
   Cubes myKube = new Cubes(); 
    state.Kubes.add(myKube);
    state.hit = false;
    state.Speed= 10;
  }  
  //reset on spacebar
  state.reset();
}