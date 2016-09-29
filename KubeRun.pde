
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

  state.gameloop();
  
}

void mouseClicked() {

}

void keyPressed() {
  controls.reset();
}