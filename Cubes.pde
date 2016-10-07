class Cubes {
  PShape Kube;
  PVector size, pos, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;
  float pX, pY;

  Cubes(int level) {
    // procedural spawn cube per level. Note level4 is actually extra layer in lvl3 
    if (level == 1) {
      pos = new PVector(random(0, width), random(0, height), random(0, 50)); 
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
    cubeR = int(random(0, 255));
    cubeG = int(random(0, 255));
    cubeB = int(random(0, 255));
  }

  void move() {
    pos.z += state.Speed;
    if (state.hit == true) {
      display(); 
      state.Speed = 0;
      state.start = false;
    }
    if ( state.start == true) {
      display();
    }
    if (state.lock == true){
       state.Speed = lerp(0,state.Speed,1); 
    }
  }

  void display() {
    // set color & outline cube per level
    translate(pos.x, pos.y, pos.z); 
    if (state.level == 1) {
      state.Speed = 8;
      strokeWeight(33); 
      strokeJoin(ROUND);
      strokeCap(ROUND);
      stroke(cubeR+100, cubeG+100, cubeB+100, 17);
      fill(cubeR, cubeG, cubeB);
    }
    if (state.level == 2) {
      state.Speed = 10.5;
      strokeWeight(1); 
      stroke(cubeR, cubeG); 
      fill(cubeR, cubeG, cubeG, cubeB);
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
    if (pos.z-size.z > state.Zplane) {
      Z = true;
    }
    return Z;
  }

  void collision() {
    // check if cube is on Zplane
    if ((pos.z+size.z > state.Zplane)) {   
      // check normalized mouse position against normalized kube position
      if ( (controls.mouseXY.x > cubeW.x) && (controls.mouseXY.x < cubeW.y) && (controls.mouseXY.y > cubeH.x) && (controls.mouseXY.y < cubeH.y) ) { // new collision detection
        state.hit = true;
        state.start = false;
      }
    }
  }
}