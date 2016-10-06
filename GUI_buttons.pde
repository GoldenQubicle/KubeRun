class Button {

  int Red, Green, Blue;
  int Xpos, Ypos, BWidth, BHeight;
  String Name;
  int xpos, ypos, bwidth, bheight;
  boolean hoover;

  Button (String name, int xpos, int ypos, int bwidth, int bheight) {
    hoover = false;  
    Name = name;
    Xpos = xpos;
    Ypos = ypos;
    BWidth = bwidth;
    BHeight = bheight;
    //Red = red;
    //Green = green;
    //Blue = blue;
  }

  void hoover() {
    if (mouseX > Xpos && mouseX < Xpos + BWidth && 
      mouseY > Ypos && mouseY < Ypos + BHeight) {
      fill(180);
      rect(Xpos, Ypos, BWidth, BHeight);
      hoover = true;
    } else {
      hoover = false;
    }
  }

  void mouseClicked() {
    if (mousePressed == true && hoover == true) {
      if (Name == "header") {
      }
      if (Name == "header") {
      }
      if (Name == "start") {
        struct = 1;
        state.hit = false;
        state.start = true;
        state.finish = false;
      }
      if (Name == "stats") {
      }
      if (Name == "easy") {
        state.mode = 1;
        println(state.mode);
      }
      if (Name == "normal") {
        state.mode = 2;    
        println(state.mode);
      }
      if (Name == "hard") {
        state.mode = 3;   
        println(state.mode);
      }
      if (Name == "hyper") {
      }
      if (Name == "mouse") {
      }
      if (Name == "mouse_i") {
      }
    }
  }
}