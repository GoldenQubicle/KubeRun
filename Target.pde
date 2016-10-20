class Target {
  PVector Size, Pos, Tw, Th;
  float MoveT, Distance, Trigger;
  color C;
  boolean sight = false;
  boolean Last = false;
  String Check;

  // ROUND THE CORNERS!!! OR why not proper circle targets?! wut WUT! 
  // start with squares, round corners in lvl2, complete circles in lvl3

  Target(float size, float PX, float PY, float distance, float trigger, color c, String check, boolean finish) { // pass scores as well? 
    Size = new PVector(size, size);
    Pos = new PVector(PX, PY);
    Distance = distance; 
    Trigger = trigger;
    C = c;
    Check = check;
    Last = finish;
    Tw = new PVector(norm (Pos.x-(Size.x/2), 0, width), (norm(Pos.x+(Size.x/2), 0, width)));
    Th = new PVector(norm (Pos.y-(Size.y/2), 0, width), (norm(Pos.y+(Size.y/2), 0, width)));
  }  

  //Target(){ // test constructor
  //  Size = new PVector(320,320);
  //  Pos = new PVector(320,320);
  //  Distance = 0;
  //  Tw = new PVector(norm (Pos.x-(Size.x/2),0,width),(norm(Pos.x+(Size.x/2),0,width)));
  //  Th = new PVector(norm (Pos.y-(Size.y/2),0,width),(norm(Pos.y+(Size.y/2),0,width)));
  //}

  void move() {
    if (state.dist > Trigger) {
      MoveT += design.Speed;
      translate(0, 0, MoveT);
      display();
    }
  }

  void display() {
    fill(C);
    pushMatrix(); 
    translate(Pos.x, Pos.y, -Distance); 
    shininess(2);
    emissive(64, 128, 64);

    if (Last == false) {
      ellipseMode(CENTER);
      ellipse(0, 0, Size.x, Size.y);
    } else if (Last == true) {
      rectMode(CENTER);
      rect(0, 0, Size.x, Size.y);
    }

    popMatrix();
  }

  void detection() {
    if (sight == true) {
      if ((controls.mouseXY.x > Tw.x) && (controls.mouseXY.x < Tw.y) &&  
        (controls.mouseXY.y > Th.x) && (controls.mouseXY.y < Th.y)) {
        println(Check);
      }
    }
  }

  boolean Sight() {
    if (Last == false && MoveT >  Distance+state.Zplane) {
      sight = true;
    } else if (Last == true && MoveT > Distance-state.Zplane-10) {
      sight = true;
      state.finish = true;
    } else {  
      sight = false;
    }
    return sight;
  }
}