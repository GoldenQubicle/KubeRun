class Cubes {

  PShape Kube;
  PVector size, pos, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;


  Cubes() {

    // procedural spawn
    pos = new PVector(random(0, 640), random(0, 640), random(0, 0)); // make z plane in which to spawn dynamic 
    size = new PVector(random(10, 50), random(10, 50), random(10, 50)); // prolly want to make the size constraints dynamic, too

    // static spawn for collision detection & debugging
    //pos = new PVector(320, 320, -100);
    //size = new PVector(10, 10, 10);

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
    strokeWeight(.25); // ok this is very cool to play around with
    stroke(cubeR, cubeG); // its all gonna be dynamic!
    fill(cubeR, cubeG, cubeG, cubeB); //, cubeB);
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
    state.mouseXY = new PVector((1-norm(mouseX, 0, 640)), (1-norm(mouseY, 0, 640)));

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