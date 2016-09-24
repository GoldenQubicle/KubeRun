//video capture
//import com.hamoid.*; 
//VideoExport MovingNow; 

import processing.opengl.*;

state state;
GUI GUI;
void setup() {
  size(640, 640, OPENGL); // using opengl for web
  state = new state();
  state.setup();
  GUI.setup();
  //video capture
  //MovingNow = new VideoExport(this, "checkonetwo.mp4");
}

void draw() {
  background (127);
  GUI.display();
  // GUI.gui
  //state.autorun();
  state.gameloop();
  // state failure
  // state lvl 1 / 2 / 3
  // state win
}

void mouseClicked() {
  // needs to trigger countdown when clicked on start ui button 

  noCursor();
}

// reset on spacebar
void keyPressed() {
  if ((key == ' ') && ( state.start == false)) {
    state.Speed = 10; 
    state.start = true; 
    state.hit = false;     
    state.Kubes = new ArrayList();
  }
}