class Cubes {

  PShape Kube;
  PVector size, pos, VPX, VPY, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;
  float volume;

  Cubes() {
    // procedural spawn
    pos = new PVector(random(0, 640), random(0, 640), random(0, 10)); // make z plane in which to spawn dynamic 
    size = new PVector(random(10, 50), random(10, 50), random(10, 50)); // prolly want to make the size constraints dynamic, too

    // static spawn for collision detection & debugging
    //pos = new PVector(317, 537, 300);
    //size = new PVector(10, 10, 10);

    cubeW = new PVector(pos.x-(size.x), pos.x+(size.x));
    cubeH = new PVector(pos.y-(size.y), pos.y+(size.y));
    // random color 
    cubeR = int(random(0, 255));
    cubeG = int(random(0, 255));
    cubeB = int(random(0, 255));
    color c = color(cubeR, cubeG, cubeG); /* initially used cubeG twice by accident but 
     put it back on purpose bc I liked the result =) */

    Kube = createShape(BOX, size.x, size.y, size.z);
    Kube.setFill(c);
    volume = size.x*size.y*size.z;
  }

  void move() {
    pos.z += Speed;

    //if (hit == false) {
    //  Speed = 5;
    //}
    if (hit == true) {
      Speed = 0;
      println("HIT");
    }
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z); 
    //translate(pos.x, pos.y, 0); 
    shape(Kube);
    popMatrix();
  }

  boolean OutOfSight() {    
    if (pos.z-size.z > Zplane) {
      Z = true;
    }
    return Z;
  }


  void collision() {
    /*
TO DO 
     - get the volume of each cube which can be calculated from size 
     - get the position relative to Zplane which can be grabbed from position
     - perform multiple checks
     1) check if front surface of the cube is touching Zplane viewport
     2) if yes, check if front surface (i.e. w*h) is actually inside viewport 
     THIS is the difficult part because viewport is translated by mouse
     SO perhaps need to 'undo' that transaltion for check?
     BASICALLY: explicity define the viewport as an object with x,y,z dimensions as well
     because if mouseX=0, than viewportX = 320,960
     likewise if mouseX=640, than viewportX = -320,320
     
     if mouseY=0, than viewportY = 320,960
     if mouse=640, than viewportY = -320,320
     
     THE QUESTION: how to take mouseX and normalize (?) it to cube
     */
    //VPX = new PVector((320-mouseX)/2, (960-mouseX)/2);
    //VPY = new PVector((320-mouseY)/2, (960-mouseY)/2);

    VPX = new PVector((mouseX)/2, (mouseX)/2);
    VPY = new PVector((mouseY)/2, (mouseY)/2);

    float mX = 1-norm(mouseX, 0, 640);
    float mY = 1-norm(mouseY, 0, 640);
    float cXl = norm(cubeW.x, 0, 640);
    float cXr = norm(cubeW.y, 0, 640);
    float cYu = norm(cubeH.x, 0, 640);
    float cYd = norm(cubeH.y, 0, 640);
    //println(mX, cXl);

    if ((pos.z+size.z > Zplane)) {    
      if ( (mX > cXl) && (mX < cXr) && (mY > cYu) && (mY < cYd) ) {
        //println("HIT"); 
        hit = true;
      } else {
        //println("CLEAR");
      }
    }
  }
}