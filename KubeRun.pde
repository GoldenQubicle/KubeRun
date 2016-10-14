/* 
 BIG RIG JOB
 setup walls & lighting
 
 DESIGN STUFF
 formalise color schemes
 design UI in PS - keep start & continue button in middle!
 
 GAMEPLAY TWEAKS
 random seed when a level is started, however, NOT on reset
 increasing speed per level, and higher overall speed between levels
 all levels one after another, and more targets
 level 1 = 2 targets
 level 2 = 3 targets
 level 3 = 4 targets
 special message if runs==3 && level==3, hyperrun!
 */


//video capture
//import com.hamoid.*; 
//VideoExport LightingRig; 


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
  
//video capture
//LightingRig = new VideoExport(this, "LightingRig.mp4");
}

void draw() {
  background (0);  

  switch(struct) {

  case 0:
    cursor();
    //gui.buttons();
    break;

  case 1: 
    env.walls();
    state.gameloop();
    break;
  }
  //LightingRig.saveFrame();
}

void mouseClicked() {
}

void keyPressed() {

  controls.reset();
  //controls.menu();
}