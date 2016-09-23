class Cubes {

  PShape Kube;
  PVector size, pos;
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

    // random color 
    cubeR = int(random(0, 255));
    cubeG = int(random(0, 255));
    cubeB = int(random(0, 255));
    color c = color(cubeR, cubeG, cubeG); /* initially used cubeG twice but put it back 
                                              on purpose bc I liked the result =)   */

    Kube = createShape(BOX, size.x, size.y, size.z);
    Kube.setFill(c);
    volume = size.x*size.y*size.z;
  }

  void move() {
    pos.z += Speed;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z); 
    shape(Kube);
    popMatrix();
  }

  boolean OutOfSight() {    
    if ((pos.z-size.z) >= Zplane) {
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
     THIS is the difficult part because viewport is transalted by mosue
     SO perhaps need to 'undo' that transaltion for check?
     
     */



    if (hit == true) {
      Speed = 0;
      println("HIT");
    }
    if (hit == false) {
      Speed = 5;
    }
  }

  /* 
   collision xymouse +- wh
   
   
   */
}