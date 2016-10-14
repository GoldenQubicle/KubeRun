class State {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, target, Finish, Score, PushBack;
  int level;

  State() {
    // ! gameloop setup !
    Kubes = new ArrayList(); 
    hit = false;
    start = false; 
    finish = false; 
    level = 1;
    Finish = 2000; // distance 1 = 750 | distance 2 = 2000 | distance 3 = 5000
    PushBack = 1000;
    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 10000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {  
    env.spotlight();
    
    if ((hit == false) && (start == true) && (finish == false)) {
      noCursor();
      controls.Mouse();

      env.walls();
     
      distance();
      translate(0,0,-PushBack);
      generator();
      iterate();
      Target();
    }
    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      controls.MouseHit();
      translate(0,0,-PushBack);
      iterate();
    }
    if ((hit == true) && (start == false) && (finish == true)) {
      controls.finish();
      cursor();
    }
  }

  void Target() {
    // target trigger visible and moving
    if (dist > finish_trigger()) { 
      target = target + Speed;
      // what happens when target is hit, target hit detection & calculation score should prolly be called here
      if (target >  Zplane + PushBack*2) {
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
      translate(0, 0, target-PushBack);
      env.target();
      popMatrix();
    }
  }

  void iterate() {
    // iterate backwards over Arraylist & delete cubes once out of sight
    for (int i = Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = Kubes.get(i);
      pushMatrix();
      if ((hit == true) && (start == false)) { // inject red for fail state
        myCube.cubeR = env.RedFade(); 
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

  // keep track of distance to trigger targets
  float distance() {
    if ((hit == false) && (start == true)) {
      dist = dist + Speed;
    }
    return dist;
  }
  
  // set finish distance per level
  float finish_trigger() {
    if (level == 1) {
      Finish = 750;
    }
    if (level == 2) {
      Finish = 2000;
    }
    if (level == 3) {
      Finish = 5000;
    }
    return Finish;
  }
}