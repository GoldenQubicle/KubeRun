class controls {

  boolean freeze;
  PVector mouseXY;

  controls() {
    mouseXY = new PVector();
    freeze = false;
  }


  PVector mouseHit() {
    if ((state.hit == true) && (state.start == false) && (freeze == false)) {    
      mouseXY = new PVector(mouseX, mouseY, millis()); // millisecond needed for fade
      freeze = true;
    }
    return mouseXY;
  }

  void reset() {
    if ((key == ' ') && ( state.start == false)) {
      /* if I want to make a couple of levels 
      speed & finish vary per level
      need to be stored & called from an array
      */
      state.Finish = -4000;
      //state.Speed = 10;
      
      state.start = true; 
      state.hit = false;     
      state.Kubes = new ArrayList();
      state.run = state.run + 1;
      state.dist = 0;

      controls.freeze = false;
      
      if (state.finish == true) {
        state.run = 1;
        state.best = 0;
        state.finish = false;
      }
    }
  }


  void mouse() {

    mouseHit();
    translate((mouseXY.x-width/2)*-1, (mouseXY.y-height/2)*-1, 0); // normal mouse movement


    // if inverse == false
    translate((mouseX-width/2)*-1, (mouseY-height/2)*-1, 0); // normal mouse movement

    // if inverse == true     
    //translate(mouseX-width/2, mouseY-height/2, 0);   // inverse mouse movement 

    //translate(randomXY.x-width/2, randomXY.y-height/2, 0);  //autorun
  }
}