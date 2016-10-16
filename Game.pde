class State {
  boolean hit, start, finish;
  float fov, drawdistance, Zplane, run, dist, PushBack;
  int level;

  State() {
    // ! gameloop setup !
    hit = false;
    start = false; 
    finish = false; 
    level = 1;
    PushBack = 1000;
     // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 10000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {  
    if ((hit == false) && (start == true) && (finish == false)) {
      // replace mouse cursor with small dot
      noCursor();
      noStroke();
      fill(128, 128, 128);
      ellipse(width/2, height/2, 2, 2);

      controls.Mouse();
      env.spotlight();
      env.walls();
      distance();

      // pushback here!
      pushMatrix();
      translate(0, 0, -PushBack);
      LVL.Kubes();
      iterate();
      popMatrix();

      LVL.Targets();
    }
    
    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      controls.MouseHit();
      translate(0, 0, -PushBack);
      iterate();
    }
    
    if ((hit == true) && (start == false) && (finish == true)) {
      controls.finish();
      cursor();
    }
  }

  void iterate() {
    // iterate backwards over Arraylist & delete cubes once out of sight
    for (int i = LVL.Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = LVL.Kubes.get(i);
      pushMatrix();
      if ((hit == true) && (start == false)) { // inject red for fail state
        myCube.cubeR = env.RedFade(); 
        myCube.cubeG = 0;
      }
      myCube.move();
      myCube.collision();
      if (myCube.OutOfSight()) {
        LVL.Kubes.remove(i);
      }
      popMatrix();
    }
  }

  // keep track of distance to trigger targets - basically just a timer
  float distance() {
    if ((hit == false) && (start == true)) {
      dist = dist + 1;
    }
    return dist;
  }
}