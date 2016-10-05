class Controls {

  // selection for distance & mode should go here
  boolean inverse, freeze;
  PVector mouseXY, mouseHit;
  
  Controls() {
    freeze = false;
    inverse = false;
    mouseXY = new PVector((norm(mouseX, 0, width)), (norm(mouseY, 0, height)));
    }

  void Mouse() {
    mouseXY = new PVector((norm(mouseX, 0, width)), (norm(mouseY, 0, height)));
    if (inverse == true) {
      translate(((mouseXY.x*width)-width/2), ((mouseXY.y*height)-height/2)); // normalised mouse movement
    }
    if (inverse == false) {
      translate(((mouseXY.x*width)-width/2)*-1, ((mouseXY.y*height)-height/2)*-1); // normalised mouse movement
    }
  }

  void MouseHit() {
    // capture mouseXY pos & time to iterare freezeframe 
    if (freeze == false) {    
      mouseHit = new PVector(mouseX, mouseY, millis()); // millisecond for fade animation, currently not in use
      freeze = true;
    }
    translate((mouseHit.x-width/2)*-1, (mouseHit.y-height/2)*-1, 0); // handle freeze frame upon collision
  }


  void reset() {
    if (state.start == false) {
      state.start = true; 
      state.hit = false;     
      state.Kubes = new ArrayList();
      state.run = state.run + 1;
      state.dist = 0;
      state.target = 0;
      struct = 3;
      if (state.finish == true) {
        state.run = 1;
        state.finish = false;
      }
      controls.freeze = false;
    }
  }
  
  void menu(){
    if (key == 'm'){
      state.start = false;
      struct = 0;
    }
  }
}