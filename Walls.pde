class Wall {
  float WWidth, WHeight, WposX, WposY;
  String Orienation;
  color Kolors, Mat_em;
  float MoveWall = 0;

  Wall(float wposx, float wposy, float wwidht, float wheight, String orientation, color kolors, color mat_em) {


    WposX = wposx;
    WposY = wposy;
    WWidth = wwidht;
    WHeight = wheight;
    Orienation = orientation;
    Kolors = kolors;
    Mat_em = mat_em;
  }


  void display() {
    pushMatrix();
    translate(0, 0, state.Zplane);  // pull walls back
    pushMatrix();

    if (Orienation == "LEFT") {
      rotateY(TAU/4);
    }

    if (Orienation == "RIGHT") {
      rotateY(TAU/4);  
      translate(0, 0, width);
    }

    if (Orienation == "UP") {
      rotateX(-TAU/4);
    }

    if (Orienation == "DOWN") {
      rotateX(-TAU/4);
      translate(0, 0, height);
    }
    fill(Kolors);
    emissive(Mat_em);
    rectMode(CORNER);
    rect(WposX, WposY, WWidth, WHeight);
    popMatrix();
    popMatrix();
  }

  void MoveWallLVL3() {

    MoveWall+=design.Speed;

    pushMatrix();
    translate(0, 0, MoveWall);
    display();
    if (MoveWall > width*2) {
      MoveWall = 0;
    }    
    popMatrix();
  }
}