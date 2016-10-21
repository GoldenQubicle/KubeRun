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
 pass stroke colors in cube contructor
 
 question: what to do with state.run when level>1 is reset?
 or in other words, how do I track the hyperrun, i.e one continous run through all 3 levels?!
 
 */


//video capture
//import com.hamoid.*; 
//VideoExport Targets; 


Controls controls;
ENV env;
Score score;
State state;
Levels design;

Target range1, range2, range3;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  env = new ENV();
  score = new Score();
  state = new State();
  design = new Levels();
  struct = 1;

  
  //range1 = new Target(400,3,320, 320, 0, 0, env.color2, 400, false);
  //range2 = new Target(250, 320, 320, 0, 0, env.color2, 250, false);
  //range3 = new Target(100, 320, 320, 0, 0, env.color2, 100, false);

  //video capture
  //Targets = new VideoExport(this, "Targets.mp4");
}

void draw() {
  background (0);  
  if (width > 640) {

    struct = 3;
  }


  switch(struct) {


  case 0:
    cursor();
    noStroke();
    //controls.Mouse();
    range1.display();
    //range1.detection();
    //range2.display();
    //range3.display();
    break;

  case 1: 

    state.gameloop();

    break;


  case 3 :

    println("screen dimensions have been changed");
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