/* 
TODO KR
 - add two modes? continual vs. level

 - add score menu, access underneath the start button
 - score menu has 'level', 'score', '#runs"  
 - finalise score & level design, i.e.
     - have at least local saves, however, preferably a global score sytem by means of DB

 - level3 design
   

TODO RL
  - make gameplay gif
  - rework GitHub pages - custombackground?
  - small devlog? 
 
 */

Controls controls;
Lighthing light;
Score score;
State state;
Levels design;
GUI gui;
Target range1, range2, range3;
boolean Screensize = true;
int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  light = new Lighthing();
  score = new Score();
  state = new State();
  design = new Levels();
  gui = new GUI();
  struct = 1;
}

void draw() {
  background (0);  
  if (Screensize == true) {
    switch(struct) {
    case 0:
      cursor();
      gui.TitleMenu();
      //gui.Title();
      gui.menu();
      break;
    case 1: 
      state.gameloop();
      break;
    case 2:
    cursor();
      gui.ScoreMenu();
      break;
    }
  }

  // prevent from playing fullscreen due to inherent collision bugs et al
  if (width > 640 || width < 640 && height > 640 || height < 640) {
    Screensize = false;
  } else {
    Screensize = true;
  }
  if (Screensize == false) {
    cursor();
    textFont(gui.font2, 44);
    fill(255);
    rectMode(CENTER);
    String yeah = "Yeah it'd be awesome to play in full screen. However due to my programming skills or rather the lack thereoff it introduces a number of glitches & bugs. Sorry 'bout that =) ";
    text(yeah, width/2, height/2, width/2, height/2);
  }
}


void keyPressed() {
  controls.reset();
  controls.menu();
}