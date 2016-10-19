/* 
 BIG RIG JOB
 setup walls & lighting // level1 done
 
 DESIGN STUFF
 formalise color scheme // level1 done
 
 design UI in PS - keep start & button in middle!
 
 GAMEPLAY TWEAKS
 all levels one after another, and more targets - maybe slight change after target?
 level 1 = 2 targets
 level 2 = 3 targets // 
 level 3 = 4 targets // spawn the small kubes at midpoint
 
 special message if runs==1 hyperrun!
 disable background and let it space out!
 
 CURRENT CONCERNS
 somehow disable generator before finish target, so that no new cuves spwawn just in front thereoff
 incremental speed gain over level 
 

 
 
 */


//video capture
//import com.hamoid.*; 
//VideoExport Targets; 


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
  //Targets = new VideoExport(this, "Targets.mp4");
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
  }
  //Targets.saveFrame();
}

void mouseClicked() {
}

void keyPressed() {

  controls.reset();
  //controls.menu();
}