class Target {
  PVector Pos;
  float MoveT, Score, Curve, Size, SizeR, SizeRN, Trigger, Distance;
  color C;
  boolean sight = false;
  boolean Last = false;
  boolean detect = false;
  int R;

  Target(float size, int ranges, float xpos, float ypos, float trigger, float distance, color c, float score, boolean finish, float curve) { // pass scores as well? 
    Size =  size;
    R = ranges;
    SizeR = size/ranges;
    Pos = new PVector(norm(xpos, 0, width), norm(ypos, 0, height));
    Trigger = trigger;
    Distance = distance;
    C = c;
    Score = score;
    Last = finish;
    Curve = curve;
    // calculate normalised width of target range
    SizeRN = (norm(size, 0, 640)/(ranges));
    SizeRN = SizeRN/2;
  }  
  void move() {
    if (state.dist > Trigger) {
      MoveT += design.Speed;
      if (Last == true) {
        translate(0, 0, MoveT*state.acc);
      }
      translate(0, 0, MoveT);
      display();
    }
  }

  void display() {
    fill(C);
    pushMatrix(); 
    translate(Pos.x*width, Pos.y*height, -Distance); 
    shininess(2);
    emissive(64, 128, 64);
    //if (Last == false) {
    rectMode(CENTER);
    for (int i = 0; i <= R; i++) {
      noStroke();
      rect(0, 0, Size-(SizeR*i), Size-(SizeR*i), Curve);
    }
    popMatrix();
  }

  boolean detection() {
    if (sight == true) {
      float totalscore = 0;
      for (int i = 1; i <= R; i++) {
        if ((controls.mouseXY.x > (Pos.x-SizeRN*i)) && (controls.mouseXY.x < Pos.x+(SizeRN*i)) && 
          (controls.mouseXY.y > (Pos.y-SizeRN*i)) && (controls.mouseXY.y < Pos.y+(SizeRN*i)) ) {
          detect = true;        
          totalscore = totalscore + Score/i;
        }
      }
    } else {
      detect = false;
    }
    return detect;
  }

  boolean Sight() {
    if (Last == false && MoveT > Distance+state.Zplane) {
      sight = true;
    } else if (Last == true && MoveT > (Distance*state.acc-state.Zplane)+50) {
      sight = true;
      state.finish = true;
    } else if (Last == true && state.level == 3 && MoveT > (Distance*state.acc-state.Zplane)-3650) {
      sight = true;
      state.finish = true;
    } else {  
      sight = false;
    }
    return sight;
  }
}