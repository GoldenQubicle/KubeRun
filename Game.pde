class State {
  boolean hit, start, finish;
  float fov, drawdistance, Zplane, run, dist, PushBack, acc;
  int level;

  State() {
    // ! gameloop setup !
    hit = false;
    start = false; 
    finish = false; 
    level = 1;
    PushBack = 1000;
    acc = 1.25;
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
      //spotLight(255, 255, 255, mouseX, mouseY, state.Zplane+state.PushBack, 0, 0, -1, 360, 250);

      controls.Mouse();
      env.walls();
      distance();

      design.generator();
      iterate();
    }

    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      controls.MouseHit();
      iterate();
    }

    if ((hit == true) && (start == false) && (finish == true)) {
      controls.finish();
      cursor();
    }
  }

  void iterate() {
    // iterate backwards over Arraylist & delete cubes once out of sight
    for (int i = design.Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = design.Kubes.get(i);
      pushMatrix();
      translate(0, 0, myCube.pos.z*acc);
      if ((hit == true) && (start == false)) { 
        noStroke();
        myCube.cubeC = color (255, 0, 0, 255); // inject red for fail state
      }
      myCube.move();
      myCube.collision();
      if (myCube.OutOfSight()) {
        design.Kubes.remove(i);
      }
      popMatrix();
      println(design.Kubes.size());
    }
    for (int i = 0; i < design.Targets.size(); i++) {
      Target myTarget = design.Targets.get(i);
      myTarget.move();
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