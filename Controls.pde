class Controls {
  boolean inverse, freeze;
  PVector mouseXY, mouseHit;

  Controls() {

    freeze = false;
    inverse = false;
    mouseXY = new PVector();
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
    if (state.start == false) {
      state.start = true; 
      state.hit = false; 
      design.Kubes.clear();
      design.Targets.clear();
      design.Walls.clear();
      score.Target.clear();
      design.Targetsetup();
      design.Wallsetup();
      state.run = state.run + 1;
      state.dist = 0;
      score.LevelScore = 0.0;
      controls.freeze = false;
    }
  }

  void menu() {
    if (key == 'm') {
      state.start = false;
      state.run = 0;
      struct = 0;
      println("check");
    } else if (key == ' ') {  
      controls.reset();
    }
  }
}