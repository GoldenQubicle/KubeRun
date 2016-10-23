/* 
 CURRENT CONCERNS
 - score system!
 
 AESTHETICS & TWEAKS
 - level 3 design
 - only call on GUI at start, call on gamesetup when start is actually pressed (i.e. do not setup stuff it its not needed) 
 - remake finish target to be opeque OR somehow disable generator before finish target, so that no new cuves spwawn just in front thereoff
 - at least start button in middle!
 */

Controls controls;
Lighthing light;
Score score;
State state;
Levels design;

Target range1, range2, range3;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  light = new Lighthing();
  score = new Score();
  state = new State();
  design = new Levels();
  struct = 1;
}

void draw() {
  background (0);  

  switch(struct) {
  case 0:
    cursor();
    break;
  case 1: 
    state.gameloop();
    break;
  case 3 :
    println("screen dimensions have been changed");
    break;
  }
  // prevent from playing fullscreen due to inherent collision bugs et al
  if (width > 640) {
    struct = 3;
  }
}

void mouseClicked() {
}

void keyPressed() {

  controls.reset();
  //controls.menu();
}