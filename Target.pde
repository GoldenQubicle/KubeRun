class Target {
  PVector Range_1;
  float Size, MoveT, Distance, Trigger;


  Target(float size, float distance, float trigger) {
    Range_1 = new PVector();
    Range_1.x = size*width;
    Range_1.y = size*height;
    Size = size;
    Distance = distance; // how far back the target appears on trigger set per level, by passing level in constructor
    Trigger = trigger;
  }

  void move() {
    if(state.dist > Trigger){
    pushMatrix();
    translate(0, 0, MoveT);
    display();
    popMatrix();
    MoveT += LVL.Speed;
    if (MoveT > Distance+state.Zplane) {
      detection();
    }
    }
  }

  void display() {
    fill(env.color3, 64 );
    pushMatrix();
    rectMode(CENTER);
    translate(0, 0, -Distance); // about *8 actually, this translate could also be mstate shorter than all the way back
    rect(width/2, height/2, Range_1.x, Range_1.y);
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