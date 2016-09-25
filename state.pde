class state {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, best, Finish;
  PVector randomXY, mouseXY; // needed for autorun

  state() {
    // ! gameloop setup !
    Kubes = new ArrayList(); // holds kubes to draw
    Speed = 10; // obviously wanna make this dynamic later
    hit = false; // collision check
    start = false; // restart game
    Finish = -3000; // distance to finish
    finish = false;   
    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 2000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
    // ! needed for autorun !
    randomXY = new PVector(random(0, 640), random(0, 640));
  }


  void finish() {
    if (dist > 2000) {
      Finish = Finish + Speed;

      if (Finish >  Zplane) {
        Speed = 0; 
        state.hit = true;
        state.start = false;
        Finish = 550 ;
        finish = true;
      }
      pushMatrix();
      translate(0, 0, Finish);
      GUI.finishflag();
      popMatrix();
    }
  }

  void reset() {
    if ((key == ' ') && ( state.start == false)) {
      Speed = 10; 
      start = true; 
      hit = false;     
      Kubes = new ArrayList();
      run = state.run + 1;
      dist = 0;
      Finish = -4000;
      if (finish == true) {
        run = 0;
        best = 0;
        finish = false;
      }
    }
  }

  void core() {
    if ((hit == false) && (start == true) && (finish == false)) {
      gameloop();
    }
    if ((hit == true) && (start == false) && (finish == false)) {
      GUI.reset();
    }
    if ((hit == true) && (start == false) && (finish == true)) {
      GUI.finish();
    }
  }

  void gameloop() {
    //generate cubes & add to ArrayList 
    //if ((hit == false) && (start == true)) {
    Cubes myKube = new Cubes(); 
    Cubes myKubextra = new Cubes(); 
    Kubes.add(myKube);
    Kubes.add(myKubextra);
    //}
    // iterate backwards over Arraylist & delete cubes once out of sight
    for (int i = Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = Kubes.get(i);
      pushMatrix();
      translate(mouseX-width/2, mouseY-height/2, 0);   //mouse movement 
      //translate(randomXY.x-width/2, randomXY.y-height/2, 0);  //autorun
      myCube.display();
      myCube.move();
      myCube.collision();
      if (myCube.OutOfSight()) {
        Kubes.remove(i);
      }
      popMatrix();
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
    if ((state.hit == false) && (state.start == true)) {
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