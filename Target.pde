class Target {
  PVector Dim, Pos;
  float Size, MoveT, Distance, Trigger;
  color C;

  Target(float size, float trigger, float distance, color c) { // pass scores as well? 
    Dim = new PVector();
    Dim.x = size*width;
    Dim.y = size*height;
    Pos = new PVector();
    Size = size;
    Distance = distance; 
    Trigger = trigger;
    C = c;
    
  }

  void move() {
    if (state.dist > Trigger) {
      pushMatrix();
      translate(0, 0, MoveT);
      display();
      popMatrix();
      MoveT += design.Speed;
      if (MoveT > Distance+state.Zplane) {
        detection();
      }
    }
  }
  

  void display() {
    fill(C);
    pushMatrix();
    rectMode(CENTER);
    translate(0, 0, -Distance); 
    shininess(2);
    emissive(64,128,64);
    rect(Pos.x*width, Pos.y*height, Dim.x, Dim.y); 
    popMatrix();
  }

  void detection() {
    if  ((controls.mouseXY.x < .5+Size/4 &&  controls.mouseXY.x > .5-Size/4) &&
      (controls.mouseXY.y < .5+Size/4 &&  controls.mouseXY.y > .5-Size/4)) {
      //println("hit");
    } else {
      //println("nope");
    }
  }
}