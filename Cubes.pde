class Cubes {

  PShape Kube;
  PVector size, pos, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;


  Cubes() {
    // procedural spawn
    pos = new PVector(random(0, 640), random(0, 640), random(0, 10)); // make z plane in which to spawn dynamic 
    size = new PVector(random(10, 50), random(10, 50), random(10, 50)); // prolly want to make the size constraints dynamic, too

    // static spawn for collision detection & debugging
    //pos = new PVector(317, 537, 300);
    //size = new PVector(10, 10, 10);

    // normalise position & volume of cube for collision
    cubeW = new PVector(norm(pos.x-(size.x), 0, 640), norm(pos.x+(size.x), 0, 640));
    cubeH = new PVector(norm(pos.y-(size.y), 0, 640), norm(pos.y+(size.y), 0, 640));

    // random color 
    cubeR = int(random(0, 255));
    cubeG = int(random(0, 255));
    cubeB = int(random(0, 255));
    color c = color(cubeR, cubeG, cubeG); /* initially used cubeG twice by accident but 
     put it back on purpose bc I liked the result =) */

    //Kube = createShape(BOX, size.x, size.y, size.z); // createShape IS NOT IN JS REFERENCE!!!!!!
    //Kube.setFill(c);
  }

  void move() {
    pos.z += Speed;
    
    if (hit == true) {
      Speed = 0;
      println("HIT");
      noLoop();
    }
    
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z); 
    //shape(Kube);
    fill(cubeR,cubeG,cubeG);
    box(size.x, size.y, size.z);
    popMatrix();
  }

  boolean OutOfSight() {
    // check if Kube is behind Zplane
    if (pos.z-size.z > Zplane) {
      Z = true;
    }
    return Z;
  }


  void collision() {
    //normalse mouse position
    float mX = 1-norm(mouseX, 0, 640);
    float mY = 1-norm(mouseY, 0, 640);
    
    // check if cube is on Zplane
    if ((pos.z+size.z > Zplane)) {   
      // check normalized mouse position against normalized kube position
      if ( (mX > cubeW.x) && (mX < cubeW.y) && (mY > cubeH.x) && (mY < cubeH.y) ) {
        hit = true;
      }
    }
  }
}