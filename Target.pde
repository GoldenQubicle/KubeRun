class Target {
  PVector Size, Pos, Tw, Th;
  float MoveT, Score, Curve;
  color C;
  boolean sight = false;
  boolean Last = false;
  boolean detect = false;

  // ROUND THE CORNERS!!! OR why not proper circle targets?! wut WUT! 
  // start with squares, round corners in lvl2, complete circles in lvl3
  // yeah thats fine and all, but! detection is still based on rectangle! 

  /*
ideally want a constructor where I pass maxixum size, normalised range so that number of rects == 1/.2,
   
   
   */

  Target(float size, color c, float score, boolean finish, float curve) { // pass scores as well? 
    Size = new PVector(size, size);
    //Pos = new PVector(PX, PY);
    C = c;
    Curve = curve;
    Score = score;
    Last = finish;
    Tw = new PVector(norm (design.TargetPos.x-(Size.x/2), 0, width), (norm(design.TargetPos.x+(Size.x/2), 0, width)));
    Th = new PVector(norm (design.TargetPos.y-(Size.y/2), 0, width), (norm(design.TargetPos.y+(Size.y/2), 0, width)));
  }  

  //Target(){ // test constructor
  //  Size = new PVector(320,320);
  //  Pos = new PVector(320,320);
  //  Distance = 0;
  //  Tw = new PVector(norm (Pos.x-(Size.x/2),0,width),(norm(Pos.x+(Size.x/2),0,width)));
  //  Th = new PVector(norm (Pos.y-(Size.y/2),0,width),(norm(Pos.y+(Size.y/2),0,width)));
  //}

  void move() {
    if (state.dist > design.TargetTrigger) {
      MoveT += design.Speed;
      translate(0, 0, MoveT);
      display();
    }
  }


  void display() {
    fill(C);
    pushMatrix(); 
    translate(design.TargetPos.x, design.TargetPos.y, -design.TargetDistance); 
    shininess(2);
    emissive(64, 128, 64);
    if (Last == false) {
      rectMode(CENTER);    
      rect(0, 0, Size.x, Size.y, Curve);
    } else if (Last == true) {
      rectMode(CENTER);
      rect(0, 0, Size.x, Size.y);
    }

    popMatrix();
  }

  boolean detection() {
    if(sight == true){
      if ((controls.mouseXY.x > Tw.x) && (controls.mouseXY.x < Tw.y) &&  
        (controls.mouseXY.y > Th.x) && (controls.mouseXY.y < Th.y)) {
        detect = true;
        }
    } else {
      detect = false;
    
    }
    return detect;
  }

  boolean Sight() {
    if (Last == false && MoveT >  design.TargetDistance+state.Zplane) {
      sight = true;
    } else if (Last == true && MoveT > design.TargetDistance-state.Zplane-10) {
      sight = true;
      state.finish = true;
    } else {  
      sight = false;
    }
    return sight;
  }
}