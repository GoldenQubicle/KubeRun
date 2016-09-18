class Cubes {

  float cubeX, cubeY, cubeZ; // x,y & z position at which cube is spawned
  float cubeW, cubeH, cubeD; // width, height & depth of cube
  float cubeR, cubeG, cubeB; // r,g,b color values
  float cubeXr, cubeXl, cubeYd, cubeYu, cubeFront;
  boolean Z = false;


  Cubes() {
    // dynamic, randomized procedural spawn
    cubeX = random(0, 640);
    cubeY = random(0, 640);
    cubeZ = random(0, 220); 
    cubeW = random(10, 50);
    cubeD = random(10, 50);
    cubeH = random(10, 50);
    cubeR = random(0, 255);
    cubeG = random(0, 255);
    cubeB = random(0, 255);

    // static spawn for collision detection & debugging
    //cubeX = 320;
    //cubeY = 320;
    //cubeZ = 300; 
    //cubeW = 10;
    //cubeH = 10;
    //cubeD = 10;
    //cubeR = 20;
    //cubeG = 122;
    //cubeB = 122;

    cubeXl = cubeX - cubeW;
    cubeXr = cubeX + cubeW;
    cubeYd = cubeY - cubeH;
    cubeYu = cubeY + cubeH;
  }

  void move() {
    cubeZ += Speed;
    cubeFront = cubeZ + cubeD;
  }

  void display() {
    pushMatrix();
    translate(cubeX, cubeY, cubeZ); 
    box(cubeW, cubeH, cubeD);
    fill(cubeR, cubeG, cubeB);
    popMatrix();
  }

  boolean OutOfSight() {    
    if ((cubeZ-cubeD) >= Zplane) {
      Z = true;
    }
    return Z;
  }


  void collision() {

    if ((cubeFront > Zplane) && 
        (mouseX > cubeXl) && (mouseX < cubeXr) && 
        (mouseY > cubeYd) && (mouseY < cubeYu)) {
      hit = true;
    }
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