/* 

BIG RIG JOB
setup walls & lighting

DESIGN STUFF
formalise color schemes
design UI in PS - keep start & continue button in middle!
  
TWEAKS
random seed when a level is started, however, NOT on reset
increasing speed per level, and higher overall speed between levels
setup UI control structure per level
special message if runs==3 && level==3, hyperrun!

STRATEGY
run setup such that static cubes spawn


 */

Controls controls;
ENV env;
Score score;
State state;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  env = new ENV();
  score = new Score();
  state = new State();
  struct = 1;
}

void draw() {
  background (127);  

  
  
  switch(struct) {

  case 0:
  cursor();
    //gui.buttons();
    break;

  case 1: 
 
    state.gameloop();
    break;

  }
}

void mouseClicked() {
}

void keyPressed() {
  
  controls.reset();
  //controls.menu();
}