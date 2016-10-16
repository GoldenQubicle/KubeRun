class Controls {
  boolean inverse, freeze;
  PVector mouseXY, mouseHit;

  Controls() {

    freeze = false;
    inverse = false;
    mouseXY = new PVector((norm(mouseX, 0, width)), (norm(mouseY, 0, height)));
  }

  void Mouse() {
    mouseXY.x = (norm(mouseX, 0, width));
    mouseXY.y = (norm(mouseY, 0, height));

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
    if (key == ' ') {
      if (state.start == false) {
        state.start = true; 
        state.hit = false; 
        
        design.Kubes.clear();
        
        for(int i = 0; i < design.Targets.size();i++){
          Target myTarget = design.Targets.get(i);
          myTarget.MoveT = 0;
        }
          
        state.run = state.run + 1;
        state.dist = 0;
        //state.test = new Target(.5); // soooo probably want to make a function here which calls forth the proper target / level
        if (state.finish == true) {
          state.run = 1;
          state.finish = false;
        }
        controls.freeze = false;
      }
    }
  }
  void finish() {
    textAlign(CENTER);
    fill(255);
    if (state.level <= 3) {
      text("placeholder", width/2, height/2);
    } else {    
      text("congrats I guess", width/2, height/2);
    }
  }

  void menu() {
    if (key == 'm') {
      state.start = false;
      state.level = 1;
      struct = 0;
    }
  }
}