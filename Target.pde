class Target {
  PVector Dim;
  float Size, MoveT, Distance, Trigger;
  color C;
   
  Target(float size, float trigger,float distance, color c) {
    Dim = new PVector();
    Dim.x = size*width;
    Dim.y = size*height;
    Size = size;
    Distance = distance; // how far back the target appears on trigger set per level, by passing level in constructor
    Trigger = trigger;
    C = c;
    MoveT = 0;
   }

  void move() {
    if(state.dist > Trigger){
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
    translate(0, 0, -Distance); // about *8 actually, this translate could also be mstate shorter than all the way back
    rect(width/2, height/2, Dim.x, Dim.y); // always drawn from middle of screen
    popMatrix();
  }

  void detection() {
    if  ((controls.mouseXY.x < .5+Size/4 &&  controls.mouseXY.x > .5-Size/4) &&
      (controls.mouseXY.y < .5+Size/4 &&  controls.mouseXY.y > .5-Size/4)) {
      println("hit");
    } else {
      println("nope");
    }
  }
}