import processing.opengl.*;

Controls controls;
ENV env;
//Score score;
State state;
Target test;
int struct;

void setup() {
  size(640, 640, OPENGL); 
  controls = new Controls();
  env = new ENV();
  //score = new Score();
  state = new State();
  struct = 1;
  //test = new Target(.5);
}

void draw() {
  background (0);  

  switch(struct) {

  case 0:
    cursor();

    break;

  case 1:                
    state.gameloop();

    break;
  }
}

void mouseClicked() {
}

void keyPressed() {
  controls.reset();
 }
 
  class State {
  Target test;
  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, target, trigger, Score, PushBack;
  int level;

  State() {
    // ! gameloop setup !
    Kubes = new ArrayList(); 
    hit = false;
    start = false; 
    finish = false; 
    level = 1;
    trigger = 2000; // distance 1 = 750 | distance 2 = 2000 | distance 3 = 5000
    PushBack = 1000;
    //test = new Target(.5); // so okay, setting target up in here breaks GP
    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 10000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {  
    if ((hit == false) && (start == true) && (finish == false)) {
      noCursor();
     
      noStroke();
      fill(128,128,128);
      ellipse(width/2,height/2,2,2);
      
      controls.Mouse();
      env.spotlight();
      env.walls();
      distance();
    
      pushMatrix();
      translate(0, 0, -PushBack);
      generator();
      iterate();
      popMatrix();
      //Target();
      
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

  void Target() {

    // target trigger visible and moving
    if (dist > test.Trigger()) { 
      test.move();
      //if(

      // what happens when target is hit, target hit detection & calculation score should prolly be called here
      //  Score = score.Target();
      //  Speed = 0; 
      //  hit = true;
      //  start = false;
      //  target = 550 ; // lock at Zplane so to not pass it
      //  finish = true;
      //  level = level + 1;
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

  // keep track of distance to trigger targets - basically just a timer
  float distance() {
    if ((hit == false) && (start == true)) {
      dist = dist + 1;
    }
    return dist;
  }
}
 
 class Target {
  PVector Range_1;
  float Size, Move, Distance, trigger;

  
  Target(float size) {
    Range_1 = new PVector();
    Range_1.x = size*width;
    Range_1.y = size*height;
    Size = size;
    Distance = 500; // how far back the target appears on trigger set per level, by passing level in constructor
   }
  
  
   // set trigger distance per level
  float Trigger() {
    if (state.level == 1) {
      trigger = 50;
    }
    if (state.level == 2) {
      trigger = 2000;
    }
    if (state.level == 3) {
      trigger = 5000;
    }
    return trigger;
  }

  void move(){
   pushMatrix();
   translate(0,0,Move);
   display();
   popMatrix();
   Move += state.Speed;
   if(Move > Distance+state.Zplane){
      detection();
    }
  }

  void display() {
    fill(env.color3, 64 );
    pushMatrix();
    rectMode(CENTER);
    translate(0,0, -Distance); // about *8 actually, this translate could also be made shorter than all the way back
    rect(width/2, height/2, Range_1.x, Range_1.y);
    popMatrix();
  }

  void detection() {
    if  ((controls.mouseXY.x < .5+Size/4 &&  controls.mouseXY.x > .5-Size/4) &&
    (controls.mouseXY.y < .5+Size/4 &&  controls.mouseXY.y > .5-Size/4)){
      println("hit");
    
    } else {
      println("nope");
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

class Cubes {
  PShape Kube;
  PVector size, pos, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;
  float pX, pY;

  Cubes(int level) {
    // procedural spawn cube per level. Note level4 is actually extra layer in lvl3 
    if (level == 1) {
      pos = new PVector(random(0, width), random(0, height), random(0, 64)); // this here determines the cube density
      size = new PVector(random(10, 64), random(10, 64), random(10, 64));
    }
    if (level == 2) {
      pos = new PVector(random(0, width), random(0, height), random(0, 25)); 
      size = new PVector(random(25, 65), random(25, 65), random(25, 65));
    }
    if (level == 3) {
      pos = new PVector(random(0, width), random(0, height), random(0, 25)); 
      size = new PVector(random(35, 70), random(35, 70), random(35, 70));
    }
    if (level == 4) {
      pos = new PVector(random(0, width), random(0, height), random(0, 50)); 
      size = new PVector(random(5, 25), random(5, 25), random(5, 25));
    }
    // normalise position & volume of cube for collision
    cubeW = new PVector(norm(pos.x-(size.x), 0, width), norm(pos.x+(size.x), 0, width));
    cubeH = new PVector(norm(pos.y-(size.y), 0, height), norm(pos.y+(size.y), 0, height));
    // random color 
    cubeR = int(random(0, 64));
    cubeG = int(random(0, 64));
    cubeB = int(random(0, 64));
  }

  void move() {
    pos.z += state.Speed;
    if (state.hit == true) {
      display(); 
      state.Speed = 0;
      state.start = false;
    }
    if (state.start == true) {
      display();
    }
  }

  void display() {
    // set color & outline cube per level
    translate(pos.x, pos.y, pos.z); 
    if (state.level == 1) {
      state.Speed = 8;
      strokeWeight(1); 
      strokeJoin(ROUND);
      strokeCap(ROUND);
      stroke(cubeR+100, cubeG+100, cubeB+100, 17);
      fill(cubeR, cubeG, cubeB);
    }
    if (state.level == 2) {
      state.Speed = 15;
      strokeWeight(1); 
      stroke(cubeR, cubeG); 
      fill(cubeR, cubeG, cubeG, cubeB+100);
    }
    if (state.level == 3) {
      state.Speed = 12;
      strokeWeight(0.5); 
      stroke(cubeR, cubeG, cubeG); 
      fill(cubeR, cubeG);
    }
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
        state.Kubes = new ArrayList();
        state.run = state.run + 1;
        state.dist = 0;
        state.target = 0;
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