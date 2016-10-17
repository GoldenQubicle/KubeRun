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
 really, really come up with ui workaround for GP - ALSO

 
 */


//video capture
//import com.hamoid.*; 
//VideoExport LightingRig2; 


Controls controls;
ENV env;
Score score;
State state;
Levels design;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  env = new ENV();
  score = new Score();
  state = new State();
  design = new Levels();
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