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


  //video capture
  //Targets = new VideoExport(this, "Targets.mp4");
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
  //Targets.saveFrame();
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
    mouseXY = new PVector();
  }

  void Mouse() {
    mouseXY.x = (norm(mouseX, 0, width));
    mouseXY.y = (norm(mouseY, 0, height));

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
        design.Kubes.clear();
        design.Targets.clear();
        design.Targetsetup();
        state.run = state.run + 1;
        state.dist = 0;

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
  boolean Z = false;
  float pX, pY;
  color cubeC;

  Cubes(int size_min, int size_max, int spawn_min, int spawn_max, color colorkube) {
    // spawn position & size cubes
    pos = new PVector(random(0, width), random(0, height), random(spawn_min, spawn_max)); 
    size = new PVector(random(size_min, size_max), random(size_min, size_max), random(size_min, size_max));
    // normalise position & volume of cube for collision
    cubeW = new PVector(norm(pos.x-(size.x), 0, width), norm(pos.x+(size.x), 0, width));
    cubeH = new PVector(norm(pos.y-(size.y), 0, height), norm(pos.y+(size.y), 0, height));
    // color 
    cubeC = color (colorkube);
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
    pushMatrix();
    translate(0, 0, -state.PushBack);
    translate(pos.x, pos.y, pos.z); 
    fill(cubeC);
    box(size.x, size.y, size.z);
    popMatrix();
  }

  boolean OutOfSight() {
    // check if Kube is behind Zplane
    if (pos.z/state.acc-size.z > state.Zplane+size.z) {
      Z = true;
    }
    return Z;
  }

  void collision() {
    // check if cube is on Zplane
    if ((pos.z/state.acc)-size.z >= state.Zplane) {   
      // check normalized mouse position against normalized kube position
      if ( (controls.mouseXY.x > cubeW.x) && (controls.mouseXY.x < cubeW.y) && (controls.mouseXY.y > cubeH.x) && (controls.mouseXY.y < cubeH.y) ) { // new collision detection
        state.hit = true;
        state.start = false;
        //println("test Kube");
      }
    }
  }
}


class ENV {

  float MoveWall;
  color color1, color2, color3, color4;
  PShape Wall_lvl3; 
  
  ENV() {
    // target colors
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51, 128);
    color3 = color(153, 255, 51, 128);
    color4 = color(51, 255, 51);
    
 
    
    
  }

  void spotlight() {
    //float x, y;
    //x = mouseX;
    //y = mouseY;
    //if (state.hit == false) {
    //  x = mouseX;
    //  y = mouseY;
    //}
    // center spotlight
    //spotLight(128, 128, 128, width/2, height/2, state.Zplane+state.PushBack, 0, 0, -1, 360, 250);
  }

  void walls() { // prolly easiest to pass level here and yes, duplicate if structure
    //ambient(10,10,10);
    // lighting setting level1
    // includes, lighfalloff, lights, emmisive wall AND cubes

    if (state.level == 1) {
      float strenght = 6;
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(strenght, strenght, strenght*2, 0, 0, 0);
      ambientLight(strenght, strenght, strenght*2, 0, height, 0);
      ambientLight(strenght, strenght, strenght*2, width, 0, 0);
      ambientLight(strenght, strenght, strenght*2, width, height, 0);
      
      fill(124, 180, 255, 200); // dynamic color on basis off level

      // pull walls backwards
      pushMatrix();
      translate(0, 0, state.Zplane);
      rectMode(CORNER);

      // left & right
      pushMatrix();
      rotateY(TAU/4);   
      emissive(12, 12, 240);
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
        
      
    if (state.level == 3) {
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(12, 12, 12, width/2, height/2, state.Zplane);

      //spotLight(255, 255, 255, mouseX, mouseY, state.Zplane+state.PushBack, 0, 0, -1, 360, 250);
      
      // pull walls backwards
      pushMatrix();
      fill(255);
      translate(0, 0, state.Zplane);
      rectMode(CORNER);

      MoveWall+=design.Speed*6;

      pushMatrix();
      translate(0, 0, MoveWall);
      println(MoveWall);
      if (MoveWall > width*3) {
        MoveWall = 0;
      }

      // left
      pushMatrix();
      rotateY(TAU/4);      
      emissive(12, 120, 12);
      rect(0, 0, width, height); 
      emissive(120, 10, 12);
      rect(width, 0, width, height);
      emissive(10, 10, 120);
      rect(width*2, 0, width, height);
      popMatrix();

      pushMatrix();
      translate(0, 0, -width*3);
      pushMatrix();
      rotateY(TAU/4);      
      emissive(12, 120, 12);
      rect(0, 0, width, height); 
      emissive(120, 10, 12);
      rect(width, 0, width, height);
      emissive(10, 10, 120);
      rect(width*2, 0, width, height);
      popMatrix();
      popMatrix();

      pushMatrix();
      translate(0, 0, -width*6);
      pushMatrix();
      rotateY(TAU/4);      
      emissive(12, 120, 12);
      rect(0, 0, width, height); 
      emissive(120, 10, 12);
      rect(width, 0, width, height);
      emissive(10, 10, 120);
      rect(width*2, 0, width, height);
      popMatrix();
      popMatrix();

      pushMatrix();
      translate(0, 0, -width*9);
      pushMatrix();
      rotateY(TAU/4);      
      emissive(12, 120, 12);
      rect(0, 0, width, height); 
      emissive(120, 10, 12);
      rect(width, 0, width, height);
      emissive(10, 10, 120);
      rect(width*2, 0, width, height);
      popMatrix();
      popMatrix();

      pushMatrix();
      translate(0, 0, -width*12);
      pushMatrix();
      rotateY(TAU/4);      
      emissive(12, 120, 12);
      rect(0, 0, width, height); 
      emissive(120, 10, 12);
      rect(width, 0, width, height);
      emissive(10, 10, 120);
      rect(width*2, 0, width, height);
      popMatrix();
      popMatrix();

      //pushMatrix();
      //translate(0, 0, width);
      //rect(0, 0, width*8, height); // replace in here
      //popMatrix();
      popMatrix();

      // up & down
      //pushMatrix();
      //rotateX(-TAU/4);
      //rect(0, 0, width, height*8); // replace in here
      //pushMatrix();
      //translate(0, 0, height);
      //rect(0, 0, width, height*8); // replace in here
      //popMatrix();
      //popMatrix();

      popMatrix();
    }
  }
}

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
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 554.256
    fov = PI/3.0;
    drawdistance = 10000;
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
  }

  void gameloop() {  
     //env.walls();
    if ((hit == false) && (start == true) && (finish == false)) {

      // replace mouse cursor with small dot
      noCursor();
      noStroke();
      fill(128, 128, 128);
      ellipse(width/2, height/2, 2, 2);
    

      controls.Mouse();
      env.walls();
      distance();

      design.generator();
      iterate();
    }

    if (hit == true && start == false && finish == false) {
      cursor(); 
      controls.MouseHit();
      iterate();
    }

    if (finish == true && start == true && hit == false) {
      state.level = state.level +1;
      design.Kubes.clear();
      design.Targetsetup();
      dist = 0;
      finish = false;
    }
  }


  void iterate() {
    // iterate backwards over ArrayList & delete cubes once out of sight
    for (int i = design.Kubes.size()-1; i >= 0; i--) {   
      Cubes myCube = design.Kubes.get(i);
      pushMatrix();
      translate(0, 0, myCube.pos.z*acc);
      myCube.move();
      myCube.collision();
      if ((hit == true) && (start == false)) { 
        noStroke();
        myCube.cubeC = color (255, 0, 0, 255); // inject red for fail state
      }      
      if (myCube.OutOfSight() == true) {
        design.Kubes.remove(myCube);
      }
      popMatrix();
    }
    // same for targets, iterate backwards over ArrayList & delete once out of sight
    for (int i = design.Targets.size()-1; i >= 0; i--) { 
      Target myTarget = design.Targets.get(i);
      pushMatrix();
      //if (state.dist > 625 && state.level == 1) { // ensures targets move at different speed than finish, i.e. equalizes speed finish
      if (myTarget.Last == true) {
        translate(0, 0, myTarget.MoveT);
        //println(myTarget.MoveT, myTarget.Distance-state.Zplane);
      }
      myTarget.move();      
      if (myTarget.Sight() == true) {
        myTarget.detection();
        design.Targets.remove(myTarget);
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
  float R, G, B, A; 
  float Speed, Trigger;
  Target T1, T2, T3, T4;
  color ColorKube;

  // make levels progress, i.e. after 2 target, finish lvl1, continue level 2

  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();
  }

  ArrayList Targetsetup() {
    if (state.level == 1) {
      T1 = new Target(400, random(192, 448), random(192, 448), 800, random(50, 150), env.color2, "T1", false); //trigger values could be randomized as well?!
      T2 = new Target(317, random(128, 512), random(128, 512), 1000, random(300, 400), env.color3, "T2", false);  
      T3 = new Target(640, 320, 320, 1750, 625, env.color4, "T3", true);  
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
    }
    if (state.level == 2) {
      T1 = new Target(320, random(192, 240), random(192, 448), 1250, random(0, 100), env.color3, "lvl2 T1", false); //trigger values could be randomized as well?!
      T2 = new Target(192, random(300, 340), random(300, 340), 1000, random(300, 400), env.color4, "lvl2 T2", false);  
      T3 = new Target(128, random(480, 576), random(480, 576), 1500, random(500, 600), env.color1, "lvl2 T3", true);  
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
    }
    return Targets;
  }

  void generator() {

    R = int(random(0, 255));
    G = int(random(0, 255));
    B = int(random(0, 255));
    A = 255;

    // LEVEL 1
    if (state.level == 1) {
      ColorKube = color(R, G, B, A);
      Cubes lvl1 = new Cubes(20, 50, 0, 150, ColorKube); 
      if ((lvl1.size.x - lvl1.size.y < 40) || (lvl1.size.x - lvl1.size.y > 30)) {  
        shininess(100);
        //ambient(128);
        emissive(20);
        stroke(0);
        Kubes.add(lvl1);
      }
      state.acc = 1.15;
      Speed = 7.5;
    }

    // LEVEL 2
    if (state.level == 2) {
      ColorKube = color(R, G, G, B+100);
      Cubes lvl2 = new Cubes(25, 65, 0, 25, ColorKube); 
      Kubes.add(lvl2);

      state.acc = 1.2;
      Speed = 7.5;
    }

    // LEVEL 3
    if (state.level == 3) {
      ColorKube = color(R, G);
      Cubes lvl3 = new Cubes(35, 70, 0, 50, ColorKube); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, ColorKube); 
      Kubes.add(lvl3e);
      while (Speed < 12) {
        Speed = Speed + .075;
      }
    }
  }
}

class Target {
  PVector Size, Pos, Tw, Th;
  float MoveT, Distance, Trigger;
  color C;
  boolean sight = false;
  boolean Last = false;
  String Check;


  Target(float size, float PX, float PY, float distance, float trigger, color c, String check, boolean finish) { // pass scores as well? 
    Size = new PVector(size, size);
    Pos = new PVector(PX, PY);
    Distance = distance; 
    Trigger = trigger;
    C = c;
    Check = check;
    Last = finish;
    Tw = new PVector(norm (Pos.x-(Size.x/2), 0, width), (norm(Pos.x+(Size.x/2), 0, width)));
    Th = new PVector(norm (Pos.y-(Size.y/2), 0, width), (norm(Pos.y+(Size.y/2), 0, width)));
  }  

  //Target(){ // test constructor
  //  Size = new PVector(320,320);
  //  Pos = new PVector(320,320);
  //  Distance = 0;
  //  Tw = new PVector(norm (Pos.x-(Size.x/2),0,width),(norm(Pos.x+(Size.x/2),0,width)));
  //  Th = new PVector(norm (Pos.y-(Size.y/2),0,width),(norm(Pos.y+(Size.y/2),0,width)));
  //}

  void move() {
    if (state.dist > Trigger) {
      MoveT += design.Speed;
      translate(0, 0, MoveT);
      display();
    }
  }

  void display() {
    fill(C);
    pushMatrix(); 
    rectMode(CENTER);
    translate(Pos.x, Pos.y, -Distance); 
    shininess(2);
    emissive(64, 128, 64);
    rect(0, 0, Size.x, Size.y);  
    popMatrix();
  }

  void detection() {
    if (sight == true) {
      if ((controls.mouseXY.x > Tw.x) && (controls.mouseXY.x < Tw.y) &&  
        (controls.mouseXY.y > Th.x) && (controls.mouseXY.y < Th.y)) {
        println(Check);
      }
    }
  }

  boolean Sight() {
    if (Last == false && MoveT >  Distance+state.Zplane) {
      sight = true;
    } else if (Last == true && MoveT > Distance-state.Zplane-10) {
      sight = true;
      state.finish = true;
    } else {  
      sight = false;
    }
    return sight;
  }
}