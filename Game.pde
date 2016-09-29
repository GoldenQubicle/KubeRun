class state {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, best, Finish;
  PVector randomXY, mouseXY; // needed for autorun
  int level;

  state() {
    // ! gameloop setup !
    Kubes = new ArrayList(); // holds kubes to draw
    //Speed = 10; // obviously wanna make this dynamic later
    hit = false; // collision check
    start = false; // restart game
    Finish = -1000; // distance to finish
    finish = false;   
    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 2000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
    // ! needed for autorun !
    randomXY = new PVector(random(0, 640), random(0, 640));
    level = 1;
  }


  void gameloop() {

    if ((hit == false) && (start == false) && (finish == false)) {
      gui.titlescreen();
      cursor();
    }

    if ((hit == false) && (start == true) && (finish == false)) {
      noCursor();
      gui.display();
      translate((mouseX-width/2)*-1, (mouseY-height/2)*-1, 0); // normal mouse movement
      generator();
      iterate();
    }

    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      gui.reset();
      controls.mouseHit();
      translate((controls.mouseXY.x-width/2)*-1, (controls.mouseXY.y-height/2)*-1, 0);
      iterate();
    }

    if ((hit == true) && (start == false) && (finish == true)) {
      gui.finish();
      cursor();
    }
  }

  void finish() {
    // flag trigger visible
    if (dist > 200) {
      Finish = Finish + Speed;
   // flag start moving
      if (Finish >  Zplane) {
        Speed = 0; 
        hit = true;
        start = false;
        Finish = 550 ;
        finish = true;
        level = level + 1;
      }
      pushMatrix();
      translate(0, 0, Finish);
      gui.finishflag();
      popMatrix();
    }
  }

  void iterate() {
    // iterate backwards over Arraylist & delete cubes once out of sight
    for (int i = Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = Kubes.get(i);
      pushMatrix();
      //myCube.display();
      if ((hit == true) && (start == false)) { // turn cubes red . but. plz y fade u no work
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
    //generate cubes & add to ArrayList
    if (level == 1) {
      Cubes lvl1 = new Cubes(1); 
      Kubes.add(lvl1);
    }

    if (level == 2) {
      Cubes lvl2 = new Cubes(2); 
      Kubes.add(lvl2);
      //Cubes lvl2 = new Cubes();  
      //Kubes.add(lvl2);
    }

    if (level == 3) {
      Cubes lvl3 = new Cubes(3); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(4); 
      Kubes.add(lvl3e);
    }
  }

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

  // return current & best distance to GUI
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