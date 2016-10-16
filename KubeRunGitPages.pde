import processing.opengl.*;

Controls controls;
ENV env;

State state;
Levels design;

int struct;

void setup() {
  size(640, 640, P3D); 

  controls = new Controls();
  env = new ENV();
  state = new State();
  design = new Levels();
  struct = 1;
}

void draw() {
  background (0);  

  switch(struct) {

  case 0:
    cursor();

    break;

  case 1: 

    state.gameloop();
    //test.move();

    break;
  }
}

void mouseClicked() {
}

void keyPressed() {

  controls.reset();
  //controls.menu();
}

class Controls {

  boolean inverse, freeze;
  PVector mouseXY, mouseHit;

  Controls() {

    freeze = false;
    inverse = false;
    mouseXY = new PVector((norm(mouseX, 0, width)), (norm(mouseY, 0, height)));
  }

  void Mouse() {
    mouseXY = new PVector((norm(mouseX, 0, width)), (norm(mouseY, 0, height)));
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
    if (key == ' ') {
      if (state.start == false) {
        state.start = true; 
        state.hit = false;     
        design.Kubes = new ArrayList();
        state.run = state.run + 1;
        state.dist = 0;
        //state.test = new Target(.5); // soooo probably want to make a function here which calls forth the proper target / level
        if (state.finish == true) {
          state.run = 1;
          state.finish = false;
        }
        controls.freeze = false;
      }
    }
  }
  void finish() {
    textAlign(CENTER);
    fill(255);
    if (state.level <= 3) {
      text("placeholder", width/2, height/2);
    } else {    
      text("congrats I guess", width/2, height/2);
    }
  }

  void menu() {
    if (key == 'm') {
      state.start = false;
      state.level = 1;
      struct = 0;
    }
  }
}

class Cubes {
  PVector size, pos, cubeW, cubeH;
  float cubeR, cubeG, cubeB, cubeA; 
  boolean Z = false;
  float pX, pY;

  Cubes(int size_min, int size_max, int spawn_min, int spawn_max, float r, float g, float b, float a) {
    // spawn position & size cubes
    pos = new PVector(random(0, width), random(0, height), random(spawn_min, spawn_max)); 
    size = new PVector(random(size_min, size_max), random(size_min, size_max), random(size_min, size_max));
    // normalise position & volume of cube for collision
    cubeW = new PVector(norm(pos.x-(size.x), 0, width), norm(pos.x+(size.x), 0, width));
    cubeH = new PVector(norm(pos.y-(size.y), 0, height), norm(pos.y+(size.y), 0, height));
    // color 
    cubeR = r;
    cubeG = g;
    cubeB = b;
    cubeA = a;
  }

  void move() {    
    pos.z += design.Speed;
    if (state.hit == true) {
      display(); 
      design.Speed = 0;
      state.start = false;
    }
    if (state.start == true) {
      display();
    }
  }

  void display() {
    // set color & outline cubes
    translate(pos.x, pos.y, pos.z); 
    fill(cubeR, cubeG, cubeB, cubeA);
    box(size.x, size.y, size.z);
  }

  boolean OutOfSight() {
    // check if Kube is behind Zplane
    if (pos.z-size.z > state.Zplane+state.PushBack) {
      Z = true;
    }
    return Z;
  }

  void collision() {
    // check if cube is on Zplane
    if ((pos.z+size.z > state.Zplane+state.PushBack)) {   
      // check normalized mouse position against normalized kube position
      if ( (controls.mouseXY.x > cubeW.x) && (controls.mouseXY.x < cubeW.y) && (controls.mouseXY.y > cubeH.x) && (controls.mouseXY.y < cubeH.y) ) { // new collision detection
        state.hit = true;
        state.start = false;
      }
    }
  }
}


class ENV {
  int fade;
  float finish;
  color color1, color2, color3, color4;

  ENV() {
    // target colors
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51);
    color3 = color(153, 255, 51);
    color4 = color(51, 255, 51);
    // red fail state
    fade = 255;
  }

  void spotlight() {
    //float x, y;
    //x = mouseX;
    //y = mouseY;
    //if (state.hit == false) {
    //  x = mouseX;
    //  y = mouseY;
    //}
    spotLight(128, 128, 128, width/2, height/2, state.Zplane+state.PushBack, 0, 0, -1, 360, 250); // center spotlight
  }

  void walls() {
    //ambient(10,10,10);

    lightFalloff(0.00001, 0.00001, 0.000001);
    ambientLight(32, 32, 64, width/2, height/2, 0);
    ambientLight(32, 32, 64, 0, height, -state.Zplane);
    ambientLight(32, 32, 64, width, 0, -state.Zplane);
    ambientLight(32, 32, 64, width, height, -state.Zplane);


    fill(124, 180, 255, 128); // dynamic color on basis off level

    // pull walls backwards
    pushMatrix();
    translate(0, 0, state.Zplane);
    rectMode(CORNER);
    //noStroke();
    //strokeWeight(2);
    // left & right
    pushMatrix();
    rotateY(TAU/4);   
    emissive(10, 10, 10);
    rect(0, 0, width*8, height); // replace in here, preset the walls to finish distance? 
    pushMatrix();
    translate(0, 0, width);
    rect(0, 0, width*8, height); // replace in here
    popMatrix();
    popMatrix();

    // up & down
    pushMatrix();
    rotateX(-TAU/4);
    rect(0, 0, width, height*8); // replace in here
    pushMatrix();
    translate(0, 0, height);
    rect(0, 0, width, height*8); // replace in here
    popMatrix();
    popMatrix();

    popMatrix();
  }

  int RedFade() {
    return fade;
  }
}

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
      design.generator();
      iterate();
      popMatrix();

      design.targets();
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
    for (int i = design.Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = design.Kubes.get(i);
      pushMatrix();
      if ((hit == true) && (start == false)) { // inject red for fail state
        myCube.cubeR = env.RedFade(); 
        myCube.cubeG = 0;
      }
      myCube.move();
      myCube.collision();
      if (myCube.OutOfSight()) {
        design.Kubes.remove(i);
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

class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Target> Targets;
  float R, G, B, A; // r,g,b color values for kubes
  float Speed, Trigger;
  Target T1, T2;

  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();
    T1 = new Target(.5, 200, 50); 
    T2 = new Target(.75, 500, 100); 
    Targets.add(T1);
    Targets.add(T2);
  }

  void targets() {
    for (int i = 0; i < Targets.size(); i++) {
      Target myTarget = Targets.get(i);
      myTarget.move();
    }
  }

  void generator() {
    R = int(random(0, 64));
    G = int(random(0, 64));
    B = int(random(0, 64));
    A = 255;
    
    // LEVEL 1
    if (state.level == 1) {
      Cubes lvl1 = new Cubes(10, 64, 0, 60, R, G, B, A); 
      Kubes.add(lvl1);
      while (Speed < 8) {
        Speed = Speed + .025;
      }
    }
    
    // LEVEL 2
    if (state.level == 2) {
      Cubes lvl2 = new Cubes(25, 65, 0, 25, R, G, G, B+100); 
      Kubes.add(lvl2);
      while (Speed < 15) {
        Speed = Speed + .05;
      }
    }
    
    // LEVEL 3
    if (state.level == 3) {
      Cubes lvl3 = new Cubes(35, 70, 0, 25, R, 0, 0, G); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, R, 0, 0, G); 
      Kubes.add(lvl3e);
      while (Speed < 20) {
        Speed = Speed + .075;
      }
    }
  }
}

class Target {
  PVector Range_1;
  float Size, MoveT, Distance, Trigger;


  Target(float size, float distance, float trigger) {
    Range_1 = new PVector();
    Range_1.x = size*width;
    Range_1.y = size*height;
    Size = size;
    Distance = distance; // how far back the target appears on trigger set per level, by passing level in constructor
    Trigger = trigger;
  }

  void move() {
    if(state.dist > Trigger){
    pushMatrix();
    translate(0, 0, MoveT);
    display();
    popMatrix();
    MoveT += design.Speed;
    if (MoveT > Distance+state.Zplane) {
      detection();
    }
    }
  }

  void display() {
    fill(env.color3, 64 );
    pushMatrix();
    rectMode(CENTER);
    translate(0, 0, -Distance); // about *8 actually, this translate could also be mstate shorter than all the way back
    rect(width/2, height/2, Range_1.x, Range_1.y);
    popMatrix();
  }

  void detection() {
    if  ((controls.mouseXY.x < .5+Size/4 &&  controls.mouseXY.x > .5-Size/4) &&
      (controls.mouseXY.y < .5+Size/4 &&  controls.mouseXY.y > .5-Size/4)) {
      println("hit");
    } else {
      println("nope");
    }
  }
}