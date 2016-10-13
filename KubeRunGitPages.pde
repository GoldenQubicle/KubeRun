import processing.opengl.*;

state State;
gui Gui;
controls Controls;
float lightZ;
void setup() {
  size(640, 640, P3D); 
  colorMode(RGB, 255, 255, 255, 255);
  State = new state();
  Gui = new gui();
  Controls = new controls();
  lightZ =  ((height/2.0) / tan(PI*60.0/360.0));
}

void draw() {
  background (127);  
 spotLight(255, 255, 126,320,320,lightZ, 0, 0, -1, 180,10);
  State.gameloop();
}

void mouseClicked() {
}

void keyPressed() {
  Controls.reset();
}

class controls {

  boolean inverse, freeze;
  PVector mouseXY;

  controls() {
    mouseXY = new PVector();
    freeze = false;
    inverse = false;
  }

  void Distance() {
    State.distance();
    State.distance_best();
  }


  void mouseHit() {
    // capture mouseXY pos & time to iterare freezeframe 
    if ((State.hit == true) && (State.start == false) && (freeze == false)) {    
      mouseXY = new PVector(mouseX, mouseY, millis()); // millisecond needed for fade
      freeze = true;
    }
    translate((Controls.mouseXY.x-width/2)*-1, (Controls.mouseXY.y-height/2)*-1, 0);
  }

  void reset() {
    if ((key == ' ') && ( State.start == false)) {
      State.start = true; 
      State.hit = false;     
      State.Kubes = new ArrayList();
      State.run = State.run + 1;
      State.dist = 0;
      State.target = 0;

      if (State.finish == true) {
        State.run = 1;
        State.best = 0;
        State.finish = false;
      }
      Controls.freeze = false;
    }
  }


  void mouse() {
    if (inverse == true) {
      translate((mouseXY.x-width/2)*-1, (mouseXY.y-height/2)*-1, 0); // normal mouse movement
    }

    if (inverse == false) {
      translate((mouseX-width/2)*-1, (mouseY-height/2)*-1, 0); // normal mouse movement
    }

    //autorun
    //translate(randomXY.x-width/2, randomXY.y-height/2, 0);
  }
}


class Cubes {
  PShape Kube;
  PVector size, pos, cubeW, cubeH;
  int cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;
  float pX, pY;


  Cubes(int level) {
    // procedural spawn cube per level. note level4 is actually extra layer in lvl3 
    if (level == 1) {
      pos = new PVector(random(0, 640), random(0, 640), random(0, 50)); 
      size = new PVector(random(10, 64), random(10, 64), random(10, 64));
    }
    if (level == 2) {
      pos = new PVector(random(0, 640), random(0, 640), random(0, 25)); 
      size = new PVector(random(25, 65), random(25, 65), random(25, 65));
    }
    if (level == 3) {
      pos = new PVector(random(0, 640), random(0, 640), random(0, 25)); 
      size = new PVector(random(35, 70), random(35, 70), random(35, 70));
    }
    if (level == 4) {
      pos = new PVector(random(0, 640), random(0, 640), random(0, 50)); 
      size = new PVector(random(5, 25), random(5, 25), random(5, 25));
    }
    // normalise position & volume of cube for collision
    cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
    cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));
    // random color 
    cubeR = int(random(0, 255));
    cubeG = int(random(0, 255));
    cubeB = int(random(0, 255));

  }

  void move() {
    pos.z += State.Speed;
    if (State.hit == true) {
      display(); 
      State.Speed = 0;
      State.start = false;
    }
    if ( State.start == true) {
      display();
    }
  }

  void display() {
    // set color &  outline cube per level
    translate(pos.x, pos.y, pos.z); 
    if (State.level == 1) {
       State.Speed = 8;
      strokeWeight(33); 
      strokeJoin(ROUND);
      strokeCap(ROUND);
      stroke(cubeR+100, cubeG+100, cubeB+100, 17);
      fill(cubeR, cubeG, cubeB);
    }
    if (State.level == 2) {
      State.Speed = 10.5;
      strokeWeight(1); 
      stroke(cubeR, cubeG); 
      fill(cubeR, cubeG, cubeG, cubeB);
    }
    if (State.level == 3) {
      State.Speed = 12;
      strokeWeight(0.5); 
      stroke(cubeR, cubeG, cubeG); 
      fill(cubeR, cubeG);
    }
    box(size.x, size.y, size.z);
  }

  boolean OutOfSight() {
    // check if Kube is behind Zplane
    if (pos.z-size.z > State.Zplane) {
      Z = true;
    }
    return Z;
  }

  void collision() {
    //normalse mouse position
    //state.mouseXY = new PVector((1-norm(mouseX, 0, 640)), (1-norm(mouseY, 0, 640))); // inverse collision
    State.mouseXY = new PVector((norm(mouseX, 0, 640)), (norm(mouseY, 0, 640))); // normal collision 

    //autorun
    //state.mouseXY = new PVector((1-norm(state.randomXY.x, 0, 640)), (1-norm(state.randomXY.y, 0, 640)));

    // check if cube is on Zplane
    if ((pos.z+size.z > State.Zplane)) {   
      // check normalized mouse position against normalized kube position
      if ( (State.mouseXY.x > cubeW.x) && (State.mouseXY.x < cubeW.y) && (State.mouseXY.y > cubeH.x) && (State.mouseXY.y < cubeH.y) ) {
        State.hit = true;
        State.start = false;
      }
    }
  }
}
class gui {

  String [] text; 
  PFont font1, font2;
  int x, y, w, h, alpha, fade;
  float finish;
  color checker1, checker2;

  gui() {
    //font1 = createFont ("TOSTADA.ttf", 64);
    //font2 = createFont ("PoiretOne-Regular.ttf", 33);
    text = new String [5];
    text[0] = "KubeRun"; 
    text[1] = "start";
    text[2] = "stats";
    text[3] = "LVL ";
    text[4] = "Congrats!";
    //finishflag setup
    alpha = 255;
    x = 0;
    y = 0;
    w = 64;
    h = 64;
    checker1 = color(175, alpha);
    checker2 = color(75, alpha);
    fade = 255;
  }

  void titlescreen() {
    pushMatrix();
    translate(width/2, 64, 0);
    textAlign(CENTER);
    textFont(font1);
    text(text[0], 0, 160);
    textSize(48);
    text(text[1], 0, 288);
    text(text[2], 0, 416);
    popMatrix();
  }



  void target() {
    if (State.level == 3) {
      strokeWeight(8);
    } 
    fill(checker1);
    rect(0, 0, width, height);  
    // draws checker2
    for ( y = 0; y < 640; y = y + 128) {
      pushMatrix();
      translate(0, y);
      for ( x = 0; x < 640; x = x + 128) {
        noStroke();
        fill(checker2);
        rect(x, 0, w, h);
      }
      translate(64, 64);
      for ( x = 0; x < 640; x = x + 128) {
        noStroke();
        fill(checker2);
        rect(x, 0, w, h);
      }
      popMatrix();
    }
  }

  //void reset() {
  //  textAlign(CENTER);
  //  textFont(font1, 33);
  //  fill(0, 0, 0);
  //  //text("Press Spacebar to retry", width/2, height/2);
  //}

  //void finish() {
  //  textAlign(CENTER);
  //  textFont(font1, 33);
  //  fill(255);
  //  if(state.level <= 3){
  //  text(text[3] + state.level, width/2, height/2);
  //  } else {    
  //  text(text[4],width/2, height/2);
  //  }

  //}


  int RedFade() {

    //float S, s, start, stop;
    //start = controls.mouseXY.z;
    //stop = start + 255*10000;

    //for ( S = start; S < stop; S++){
    //  for ( s = 0; s < 10000; s++){

    //fade = fade -1;
    //  }

    //}
    //println(start, stop, S, s, fade);
    return fade;
  }
}
class state {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Speed, fov, drawdistance, Zplane, run, dist, best, target, Finish;
  PVector randomXY, mouseXY; // needed for autorun
  int level, mode;

  state() {
    // ! gameloop setup !
    Kubes = new ArrayList(); 
    hit = false;
    start = false; 
    finish = false; 
    mode = 2;
    level = 2;
    Finish = 750; // easy = 500 | medium = 2000 | hard = 5000
    // ! camera setup !     
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    fov = PI/3.0;
    drawdistance = 2000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {
    if ((hit == false) && (start == false) && (finish == false)) {
      //gui.titlescreen();
      cursor();
    }
    if ((hit == false) && (start == true) && (finish == false)) {
      noCursor();
      Controls.Distance();
      Controls.mouse();
      generator();
      iterate();
      Target();
    }
    if ((hit == true) && (start == false) && (finish == false)) {
      cursor(); 
      //gui.reset();
      Controls.mouseHit();
      iterate();
    }
    if ((hit == true) && (start == false) && (finish == true)) {
      //gui.finish();
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
      Gui.target();
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
        myCube.cubeR = Gui.RedFade(); 
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
