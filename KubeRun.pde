/* 
 BIG RIG JOB
 setup walls & lighting // partially done
 
 DESIGN STUFF
 formalise color schemes
 design UI in PS - keep start & continue button in middle!
 
 GAMEPLAY TWEAKS
 random seed when a level is started, however, NOT on reset - proves really quite difficult for now 
 
 increasing speed per level, and higher overall speed between levels
 
 all levels one after another, and more targets - maybe slight change after target?
 level 1 = 2 targets
 level 2 = 3 targets // 
 level 3 = 4 targets // spawn the small kubes at midpoint
 special message if runs==3 && level==3, hyperrun!
 
 CURRENT CONCERNS
 BIGGIE level setup / design
 ATM the cubes contructer sets size & position, yet the display function sets colors
 SO this is already a duplicate structure, i.e. if level == 1, do something
 AND the same structure is repeated once more inside the state class AND the target trigger
 IN OTHER WORDS
 I want ONE place where I can set all parameters for a level, i.e. cubes, walls, lights, triggers, etc
 
 
 spotlight still not following mouse position
 really, really come up with ui workaround for GP - ALSO
 be really carefull with Target implementation!!
 
 */


//video capture
//import com.hamoid.*; 
//VideoExport LightingRig2; 


Controls controls;
ENV env;
Score score;
State state;
Levels LVL;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  env = new ENV();
  score = new Score();
  state = new State();
  LVL = new Levels();
  struct = 1;

  //video capture
  //LightingRig2 = new VideoExport(this, "LightingRig2.mp4");
}

void draw() {
  background (0);  

  switch(struct) {

  case 0:
    cursor();

    break;

  case 1: 

    state.gameloop();
    //test.move();

    break;
  }
  //LightingRig2.saveFrame();
}

void mouseClicked() {
}

void keyPressed() {

  controls.reset();
  //controls.menu();
}