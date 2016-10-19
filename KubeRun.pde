/* 
 BIG RIG JOB
 setup walls & lighting // level1 done
 
 DESIGN STUFF
 formalise color scheme // level1 done
 
 design UI in PS - keep start & button in middle!
 
 GAMEPLAY TWEAKS
 after entering new level, upon fail reset to that level
 
 all levels one after another, and more targets - maybe slight change after target?
 level 1 = 2 targets
 level 2 = 3 targets // 
 level 3 = 4 targets // spawn the small kubes at midpoint
 
 special message if runs==1 hyperrun!
 disable background and let it space out!
 
 
 
 */


//video capture
//import com.hamoid.*; 
//VideoExport LightingRig2; 


Controls controls;
ENV env;
Score score;
State state;
Levels design;

Target test;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  env = new ENV();
  score = new Score();
  state = new State();
  design = new Levels();
  struct = 1;
//test = new Target();

  //video capture
  //LightingRig2 = new VideoExport(this, "LightingRig2.mp4");
}

void draw() {
  background (0);  

  switch(struct) {


  case 0:
    cursor();
    //controls.Mouse();
    //design.generator();
    //state.iterate();
    design.T1.display();
    design.T1.detection();
    //test.display();
    //design.T1.detection();
    
    //println(controls.mouseXY.x, design.T1.Th.x); 
    
    //test.Tw.x+((test.Tw.y-test.Tw.x)/4));

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