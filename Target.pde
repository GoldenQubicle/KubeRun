class Target {
  PVector Range_1;
  float Size, Move, Distance, trigger;


  Target(float size) {
    Range_1 = new PVector();
    Range_1.x = size*width;
    Range_1.y = size*height;
    Size = size;
    Distance = 500; // how far back the target appears on trigger set per level, by passing level in constructor
  }

  void move() {
    pushMatrix();
    translate(0, 0, Move);
    display();
    popMatrix();
    Move += LVL.Speed;
    if (Move > Distance+state.Zplane) {
      detection();
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