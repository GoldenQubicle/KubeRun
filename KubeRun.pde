import processing.opengl.*;

state state;
GUI GUI;

void setup() {
  size(640, 640, OPENGL); // using opengl for web
  state = new state();
  GUI = new GUI();
  }

void draw() {
  background (127);
  GUI.display();  
  state.gameloop();
  state.finish();
  }

void mouseClicked() {
  noCursor();
}

void keyPressed() {
  //reset on spacebar
  state.reset();   
}

class Cubes {
  
  PVector size, pos, cubeW, cubeH, mouseXY;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;

  Cubes() {

    // procedural spawn
    pos = new PVector(random(0, 640), random(0, 640), random(0, 0)); // make z plane in which to spawn dynamic 
    size = new PVector(random(10, 50), random(10, 50), random(10, 50)); // prolly want to make the size constraints dynamic, too

      // normalise position & volume of cube for collision
    cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
    cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));

    // random color 
    cubeR = int(random(0, 255));
    cubeG = int(random(0, 255));
    cubeB = int(random(0, 255));
  }

  void move() {
    pos.z += state.Speed;
    if ( state.hit == true) {
      state.Speed = 0;
      state.start = false;
    }
  }

  void display() {
    translate(pos.x, pos.y, pos.z); 
    strokeWeight(.25); 
    stroke(cubeR, cubeG); 
    fill(cubeR, cubeG, cubeG, cubeB); 
    box(size.x, size.y, size.z);
  }

  boolean OutOfSight() {
    // check if Kube is behind Zplane
    if (pos.z-size.z > state.Zplane) {
      Z = true;
    }
    return Z;
  }

  void collision() {
    //normalse mouse position
    mouseXY = new PVector((1-norm(mouseX, 0, 640)), (1-norm(mouseY, 0, 640)));

    // check if cube is on Zplane
    if ((pos.z+size.z > state.Zplane)) {   
      // check normalized mouse position against normalized kube position
      if ( (mouseXY.x > cubeW.x) && (mouseXY.x < cubeW.y) && (mouseXY.y > cubeH.x) && (mouseXY.y < cubeH.y) ) {
        state.hit = true;
        state.start = false;
      }
    }
  }
}
class state {

  ArrayList <Cubes> Kubes;
  boolean hit, start, finish;
  float Finish, Speed, fov, drawdistance, Zplane, run, dist, best;
  
  
  state() {

    Kubes = new ArrayList(); // holds kubes to draw
    hit = false; // collision check
    start = false; // restart game   
    finish = false;   
    Finish = -3000; // distance to finish
    Speed = 10; // obviously wanna make this dynamic later
    fov = PI/3.0;
    drawdistance = 2000;
    Zplane =  ((height/2.0) / tan(PI*60.0/360.0)); // default cameraZ from perspective(); 
    perspective(fov, float(width)/float(height), 1, drawdistance); // however still need custom perpective to set zNear at 1
    run = 0;
    dist = 0;
    best = 0;
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
    noCursor();
  }

  void generator() {
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
      myCube.display();
      myCube.move();
      myCube.collision();
      if (myCube.OutOfSight()) {
        Kubes.remove(i);
      }
      popMatrix(); 
    }
  }
  
    void gameloop() {
    if ((hit == false) && (start == true) && (finish == false)) {
      generator();
    }
    if ((hit == true) && (start == false) && (finish == false)) {
      GUI.reset();
    }
    if ((hit == true) && (start == false) && (finish == true)) {
      GUI.finish();
    }
  }

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
class GUI {
  String [] text; 
  int x, y, w, h, alpha;
  float finish;
  color checker1, checker2;

  GUI() {
  
    text = new String [7];
    text[0] = "run"; // currently bit of a mess
    text[1] = "ph"; // want to add more stuff anyway
    text[2] = "current"; // so to have random message on retry/finish etc
    text[3] = "best";  //
    text[4] = "ph"; 
    text[5] = "ph"; 
    text[6] = "ph"; 

    // finishflag
    alpha = 128;
    x = 0;
    y = 0;
    w = 64;
    h = 64;
    checker1 = color(255, alpha);
    checker2 = color(0, alpha);
  }

  void display() {
    pushMatrix();
    translate(-15, -65);
    fill(255);   
    textSize(33);
    // static
    translate(150, 0, 0);
    textAlign(RIGHT);
    text(text[0], 0, 100);
    text(text[2], 175, 100);
    text(text[3], 350, 100);
    //  dynamic
    textAlign(LEFT);
    text(Run(), 15, 100);    
    text(Distance(), 190, 100);
    text(Best(), 365, 100);
    popMatrix();
  }

  String Run() {
    return text[1] = nf(state.run, 0, 0);
  }

  String Distance() {
    return text[4] = nf(state.distance(), 0, 0);
  }

  String Best() {
    return text[5] = nf(state.distance_best(), 0, 0);
  }

  void finishflag() {
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
  void reset() {
    textAlign(CENTER);
    text("Press Spacebar to retry", width/2, height/2); 
    cursor();
  }

  void finish() {
    textAlign(CENTER);
    text("Press Spacebar to restart", width/2, height/2); 
    cursor();
  }
}
