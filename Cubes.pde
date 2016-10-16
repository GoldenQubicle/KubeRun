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
    pos.z += LVL.Speed;
    if (state.hit == true) {
      display(); 
      LVL.Speed = 0;
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