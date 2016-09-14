class Cubes {


  float cubeX, cubeY, cubeZ; // x,y & z position at which cube is spawned
  float cubeW, cubeH, cubeD; // width, height & depth of cube
  float cubeR, cubeG, cubeB; // r,g,b color values


  Cubes() {
    // dynamic, randomized procedural spawn
    cubeX = random(0, 640);
    cubeY = random(0, 640);
    cubeZ = random(0, 200);
    cubeW = random(10, 50);
    cubeD = random(10, 50);
    cubeH = random(10, 50);
    cubeR = random(0, 255);
    cubeG = random(0, 255);
    cubeB = random(0, 255);

    // static spawn for collision detection & debugging
    //cubeX = 320;
    //cubeY = 320;
    //cubeZ = 200; //553.302;
    //cubeW = 10;
    //cubeH = 10;
    //cubeD = 10;
    //cubeR = 20;
    //cubeG = 122;
    //cubeB = 122;
    
  }

void move(){
  
 cubeZ = cubeZ + Speed; 
}

  void display() {
    pushMatrix();
    translate(cubeX, cubeY, cubeZ); 
    box(cubeW, cubeH, cubeD);
    fill(cubeR, cubeG, cubeB);
    popMatrix();
    }
}