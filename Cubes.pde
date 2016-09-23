class Cubes {

  PShape Kube;
  PVector size, pos, VPX, VPY, cubeW, cubeH;
  float cubeR, cubeG, cubeB; // r,g,b color values
  boolean Z = false;
  float volume;

  Cubes() {
    // procedural spawn
    pos = new PVector(random(0, 640), random(0, 640), random(0, 220));
    size = new PVector(random(10, 50), random(10, 50), random(10, 50));

    // static spawn for collision detection & debugging
    //pos = new PVector(320, 320, 300);
    //size = new PVector(10, 10, 10);
    
    cubeW = new PVector(pos.x-(size.x/2), pos.x+(size.x/2));
    cubeH = new PVector(pos.y-(size.y/2), pos.y+(size.y/2));
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

    if (hit == false) {
      Speed = 5;
    }
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
     */
    VPX = new PVector((320-mouseX)/2, (960-mouseX)/2);
    VPY = new PVector((320-mouseY)/2, (960-mouseY)/2);

if ((pos.z+size.z > Zplane) && (VPX.y > cubeW.x) && (VPX.y < cubeW.y) && (VPY.y > cubeH.x) && (VPY.y < cubeH.y)){
      //println(VPX, cubeW);
    
      hit = true;
    }
    //} else{
    // println("clear"); 
    //}

     //checks front of cube hits Zplane
    }
  }