class State {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, target, Finish, Score;
  int level, mode;

  State() {
    // ! gameloop setup !
    Kubes = new ArrayList(); 
    hit = false;
    start = false; 
    finish = false; 
    mode = 1;
    level = 1;
    Finish = 2000; // distance 1 = 750 | distance 2 = 2000 | distance 3 = 5000

    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 2000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {  
    
    if ((hit == false) && (start == true) && (finish == false)) {
      noCursor();
      controls.Mouse();
      distance();
      generator();
      iterate();
      Target();
    }
    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      controls.MouseHit();
      iterate();
    }
    if ((hit == true) && (start == false) && (finish == true)) {
      gui.finish();
      cursor();
    }
  }

  void Target() {
    // target trigger visible and moving
    if (dist > finish_trigger()) { 
      target = target + Speed;
      // what happens when target is hit, target hit detection & calculation score should prolly be called here
      if (target >  Zplane) {
        Score = score.Target();
        Speed = 0; 
        hit = true;
        start = false;
        target = 550 ; // lock at Zplane so to not pass it
        finish = true;
        level = level + 1;
        println(Score);
      }
      pushMatrix();
      translate(0, 0, target);
      gui.target();
      popMatrix();
    }
  }

  void iterate() {
    // iterate backwards over Arraylist & delete cubes once out of sight
    for (int i = Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = Kubes.get(i);
      pushMatrix();
      if ((hit == true) && (start == false)) { // inject red for fail state
        myCube.cubeR = gui.RedFade(); 
        myCube.cubeG = 0;
      }
      myCube.move();
      myCube.collision();
      if (myCube.OutOfSight()) {
        Kubes.remove(i);
      }
      popMatrix();
    }
  }

  void generator() {
    // added levels - prolly not the best solution but f-it
    // generate cubes & add to ArrayList
    if (level == 1) {
      Cubes lvl1 = new Cubes(1); 
      Kubes.add(lvl1);
    }
    if (level == 2) {
      Cubes lvl2 = new Cubes(2); 
      Kubes.add(lvl2);
    }
    if (level == 3) {
      Cubes lvl3 = new Cubes(3); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(4); 
      Kubes.add(lvl3e);
    }
  }

  // return current & best distance, latter no longer in use
  float distance() {
    if ((hit == false) && (start == true)) {
      dist = dist + Speed;
    }
    return dist;
  }
  // set finish distance per mode
  float finish_trigger() {
    if (mode == 1) {
      Finish = 750;
    }
    if (mode == 2) {
      Finish = 2000;
    }
    if (mode == 3) {
      Finish = 5000;
    }
    return Finish;
  }
}