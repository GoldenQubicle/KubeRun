class Cubes {

  PShape Kube;
  PVector size, pos, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;
  float pX, pY;

  Cubes(int level) {

    if (level == 1) {
      // procedural spawn    
      pos = new PVector(random(0, 640), random(0, 640), random(0, 100)); // make z plane in which to spawn dynamic 
      size = new PVector(random(10, 50), random(10, 50), random(10, 50)); // prolly want to make the size constraints dynamic, too
      // normalise position & volume of cube for collision
      cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
      cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));
      // random color 
      cubeR = int(random(0, 255));
      cubeG = int(random(0, 255));
      cubeB = int(random(0, 255));
    }

    if (level == 2) {
      // procedural spawn    
      pos = new PVector(random(0, 640), random(0, 640), random(0, 50)); // make z plane in which to spawn dynamic 
      size = new PVector(random(25, 75), random(25, 75), random(25, 75)); // prolly want to make the size constraints dynamic, too
      // normalise position & volume of cube for collision
      cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
      cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));
      // random color 
      cubeR = int(random(0, 255));
      cubeG = int(random(0, 255));
      cubeB = int(random(0, 255));
    }

    if (level == 3) {
      // procedural spawn    
      pos = new PVector(random(0, 640), random(0, 640), random(0, 25)); // make z plane in which to spawn dynamic 
      size = new PVector(random(35, 75), random(35, 75), random(35, 75)); // prolly want to make the size constraints dynamic, too
      // normalise position & volume of cube for collision
      cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
      cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));
      // random color 
      cubeR = int(random(0, 255));
      cubeG = int(random(0, 255));
      cubeB = int(random(0, 255));
    }
    if (level == 4) {
      // procedural spawn    
      pos = new PVector(random(0, 640), random(0, 640), random(0, 50)); // make z plane in which to spawn dynamic 
      size = new PVector(random(5, 25), random(5, 25), random(5, 25)); // prolly want to make the size constraints dynamic, too
      // normalise position & volume of cube for collision
      cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
      cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));
      // random color 
      cubeR = int(random(0, 255));
      cubeG = int(random(0, 255));
      cubeB = int(random(0, 255));
    }
    // static spawn for collision detection & debugging
    //pos = new PVector(320, 320, -100);
    //size = new PVector(10, 10, 10);
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
  }

  void display() {
    // set color &  outline cube per level
    translate(pos.x, pos.y, pos.z); 

    if (state.level == 1) {
      state.Speed = 8;
      stroke(64, 64, 64);
      fill(cubeR, cubeG, cubeB);
    }
    if (state.level == 2) {
      state.Speed = 10.5;
      strokeWeight(1); 
      stroke(cubeR, cubeG); 
      fill(cubeR, cubeG, cubeG, cubeB);
    }
    if (state.level == 3) {
      state.Speed = 12.5;
      strokeWeight(0.5); 
      stroke(cubeR, cubeG, cubeG); // its all gonna be dynamic!
      fill(cubeR, cubeG); //, cubeB);
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
    //normalse mouse position
    //state.mouseXY = new PVector((1-norm(mouseX, 0, 640)), (1-norm(mouseY, 0, 640))); // inverse collision
    state.mouseXY = new PVector((norm(mouseX, 0, 640)), (norm(mouseY, 0, 640))); // normal collision 

    //autorun
    //state.mouseXY = new PVector((1-norm(state.randomXY.x, 0, 640)), (1-norm(state.randomXY.y, 0, 640)));

    // check if cube is on Zplane
    if ((pos.z+size.z > state.Zplane)) {   
      // check normalized mouse position against normalized kube position
      if ( (state.mouseXY.x > cubeW.x) && (state.mouseXY.x < cubeW.y) && (state.mouseXY.y > cubeH.x) && (state.mouseXY.y < cubeH.y) ) {
        state.hit = true;
        state.start = false;
      }
    }
  }
}