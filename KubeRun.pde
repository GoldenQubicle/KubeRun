/* TO DO

Game / Controls / gui
  score dependent on mode, number of runs and center hits
  so a perfect score would read like

   mode - runs - hit
   hard - 3 - center/center/center
   
   hyper run
   all modes in one go, i.e. 9 runs with 9x center hit
  
 bulls eye with scoring rings
 easy / normal / hard mode which differ in distance, i.e. secons p run
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

State state;
GUI gui;
Controls controls;

void setup() {
  size(640, 640, P3D); 
  controls = new Controls();
  state = new State();
  gui = new GUI();
 
}

void draw() {
  background (127);  

  state.gameloop();
  
}

void mouseClicked() {

}

void keyPressed() {
  controls.reset();
}