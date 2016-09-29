
state state;
gui gui;
controls controls;

void setup() {
  size(640, 640, P3D); 
  controls = new controls();
  state = new state();
  gui = new gui();

}

void draw() {
    background (127);  


  //state.autorun();

  state.gameloop();
  state.finish();

  // state failure

  
}

void mouseClicked() {
  // needs to trigger countdown when clicked on start ui button 

  //noCursor();
}

void keyPressed() {
  // spawn single cube for debug
  //if (key == 'k'){
  // Cubes myKube = new Cubes(); 
  //  state.Kubes.add(myKube);
  //  state.hit = false;
  //  state.Speed= 10;
  //}  
  //reset on spacebar
  controls.reset();
}