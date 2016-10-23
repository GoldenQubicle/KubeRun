class Cubes {
  PVector size, pos, cubeW, cubeH;
  boolean Z = false;
  //float pX, pY;
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

    //if (design.LVL2_T1.sight == true) {
    //  float cone = 80;
    //  pos = new PVector(random(controls.mouseXY.x-cone,controls.mouseXY.x+cone), random(controls.mouseXY.y-cone,controls.mouseXY.y+cone),random(spawn_min, spawn_max));
    //  //lvl2S.pos.y = random(controls.mouseXY.y*height-cone, controls.mouseXY.y*height+cone);
    //  //lvl2S.pos.z = random(0, 150);
    //}
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
    
    if (state.level == 2) {
      stroke(cubeC);
      emissive(50, 50, 50);
      specular(100);
    }

    if (state.level == 3) {
      //stroke(random(0, 255),random(0, 255),0);
      stroke(env.color4);
      emissive(100, 100, 100);
      specular(100);
    }
    fill(cubeC);
    box(size.x, size.y, size.z);
    popMatrix();
  }

  boolean OutOfSight() {
    // check if Kube is behind Zplane
    if (pos.z/state.acc-size.z > state.Zplane+size.z) { // normal check
    //if (pos.z/state.acc-size.z > state.Zplane+size.z+state.PushBack) { //  check small cubes lvl2
      Z = true;
    }
    return Z;
  }

  void collision() {
    //println(state.Zplane, ((pos.z/state.acc)-(size.z*2)));
    // check if cube is on Zplane
    //if ((pos.z/state.acc)-size.z/2 >= state.Zplane) { // collision detection v1
    if (((pos.z/state.acc)-(size.z)) >= state.Zplane) {   // collision detection v1
    //if (((pos.z/state.acc)-(size.z)) >= state.PushBack-state.Zplane) { // detection for reactie cubes lvvl2
      // check normalized mouse position against normalized kube position
      if ( (controls.mouseXY.x > cubeW.x) && (controls.mouseXY.x < cubeW.y) && (controls.mouseXY.y > cubeH.x) && (controls.mouseXY.y < cubeH.y) ) { // new collision detection
        state.hit = true;
        state.start = false;
      }
    }
  }
}