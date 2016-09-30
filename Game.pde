class State {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, best, target, Finish;
  PVector randomXY, mouseXY; // needed for autorun
  int level, mode;

  State() {
    // ! gameloop setup !
    Kubes = new ArrayList(); 
    hit = false;
    start = false; 
    finish = false; 
    mode = 3;
    level = 1;
    Finish = 750; // easy = 500 | medium = 2000 | hard = 5000
    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 2000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {
    if ((hit == false) && (start == false) && (finish == false)) {
      gui.titlescreen();
      cursor();
    }
    if ((hit == false) && (start == true) && (finish == false)) {
      noCursor();
      controls.Distance();
      controls.mouse();
      generator();
      iterate();
      Target();
    }
    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      //gui.reset();
      controls.mouseHit();
      iterate();
    }
    if ((hit == true) && (start == false) && (finish == true)) {
      gui.finish();
      cursor();
    }
  }

  void Target() {

    // target trigger visible and moving
    if (dist > Finish) { // this term here is what sets the finish distance for mode!!!!
      target = target + Speed;
      // 
      if (target >  Zplane) {
        Speed = 0; 
        hit = true;
        start = false;
        target = 550 ; // is zplane NOT the cause of mode not propegating
        finish = true;
        level = level + 1;
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
      //myCube.display();
      if ((hit == true) && (start == false)) { // turn cubes red 
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
    // added levels - prolly a better solution but f-it
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

  // return current & best distance 
  float distance() {
    if ((hit == false) && (start == true)) {
      dist = dist + Speed;
    }
    return dist;
  }

  float distance_best() {
    if (dist > best) {
      best = dist;
    }
    return best;
  }
}

// yeah this no longer gonna work ~ fix it tho
// auturun
// dont forget mouseXY in Cubes collision!!
//PVector autorun() {
//  if ((hit == true) && (start == false)) {
//    hit = false;
//    start = true; 
//    Speed = 10;
//    Kubes = new ArrayList();
//    randomXY = new PVector(random(0, 640), random(0, 640));
//  }
//  return randomXY;
//}