/* 
 CURRENT CONCERNS
 
 controls.mouseXY is used for steering, target score & collision, however, latter is not working properly yet with inverse control
 
 
 TO DO
 
 !! DO NOT RESET RANDOM SEED PER RUN, i.e. re-runs should be in the same randomseed
 !! once succesfully cleared level should be able to select it for practice (this ties into randomseed, should be stored somewhere?
 
 Game / Controls / gui
 score dependent on distance to target (average speed increases over short/medium/long), number of runs and center hits
 so a perfect score would read like
 
 distance - runs - hit
 small - 3 - center / center / center
 medium - 3 - center/center/center
 far - 3 - center/center/center
 
 modes: infitine runs / sudden death (i.e. 9 discrete achievements)
 
 hyper run achievement
 all distances/levels in one go, i.e. 9 runs in sudden death mode
 
 bulls eye with scoring rings
 easy / normal / hard mode which differ in distance, i.e. seconds per run
 scoring system based on the above 2
 scoring menu
 
 UI
 title menu
 start - in current mode / show in tooltip 
 how to screen / short tutorial with mouse toggle (and a got it button to start too)     
 score menu (load from db?!)
 // sort highest score per level 
 // and of course hyperrun
 
 controls
 mouse-over buttons in title menu / how to screen
 'hit esc' during run to return to title menu
 toggle distance/second countdown
 toggle inverse mouse control
 */

Controls controls;
GUI gui;
Score score;
State state;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  gui = new GUI();
  score = new Score();
  state = new State();
  struct = 0;
}

void draw() {
  background (127);  
//struct = 0;
  switch(struct) {

  case 0:
    gui.titlescreen();
 
   //println(width/2-gui.wB/2);
    break;

  case 1: 

    //println(state.start);
    break;

  case 2:
  
    break;
    
   case 3:
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