class Controls {

  boolean inverse, freeze;
  PVector mouseXY;

  Controls() {
    mouseXY = new PVector();
    freeze = false;
    inverse = false;
  }

  void Distance() {
    state.distance();
    state.distance_best();
  }


  void mouseHit() {
    // capture mouseXY pos & time to iterare freezeframe 
    if ((state.hit == true) && (state.start == false) && (freeze == false)) {    
      mouseXY = new PVector(mouseX, mouseY, millis()); // millisecond needed for fade
      freeze = true;
    }
    translate((controls.mouseXY.x-width/2)*-1, (controls.mouseXY.y-height/2)*-1, 0);
  }

  void reset() {
    if ((key == ' ') && ( state.start == false)) {
      state.start = true; 
      state.hit = false;     
      state.Kubes = new ArrayList();
      state.run = state.run + 1;
      state.dist = 0;
      state.target = 0;

      if (state.finish == true) {
        state.run = 1;
        state.best = 0;
        state.finish = false;
      }
      controls.freeze = false;
    }
  }


  void mouse() {
    if (inverse == true) {
      translate((mouseXY.x-width/2)*-1, (mouseXY.y-height/2)*-1, 0); // normal mouse movement
    }

    if (inverse == false) {
      translate((mouseX-width/2)*-1, (mouseY-height/2)*-1, 0); // normal mouse movement
    }

    //autorun
    //translate(randomXY.x-width/2, randomXY.y-height/2, 0);
  }
}