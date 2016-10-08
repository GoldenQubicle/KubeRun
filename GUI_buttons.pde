class Button {


  float Xpos, Ypos, BWidth, BHeight,xpos, ypos, bwidth, bheight;
 
  String Title,title;
  boolean hoover;

  Button (String title, float xpos, float ypos, float bwidth, float bheight) {
    hoover = false;  
    
    Xpos = xpos;
    Ypos = ypos;
    BWidth = bwidth;
    BHeight = bheight;
    
    Title = title;
  }

  void hoover() {
    if (mouseX > Xpos && mouseX < Xpos + BWidth && 
      mouseY > Ypos && mouseY < Ypos + BHeight) {
    fill(180);
    
    rect(Xpos, Ypos, BWidth, BHeight);
    textAlign(CENTER);
    //fill(255, 255, 0);
    //text(Title, (Xpos+BWidth/2), (Ypos+BHeight/2));
    hoover = true;
    } else {
    hoover = false;
    }
  }

  void mouseClicked() {
    if (mousePressed == true && hoover == true) {
      if (Title == "header") {
      }
      if (Title == "header") {
      }
      if (Title == "start") {
        struct = 1;
        state.hit = false;
        state.start = true;
        state.finish = false;
        //state.lock = true;
        //state.lockdown = millis();
      }
      if (Title == "stats") {
      }
      if (Title == "easy") {
        state.mode = 1;
        println(state.mode);
      }
      if (Title == "normal") {
        state.mode = 2;    
        println(state.mode);
      }
      if (Title == "hard") {
        state.mode = 3;   
        println(state.mode);
      }
      if (Title == "hyper") {
      }
      if (Title == "mouse") {
      }
      if (Title == "mouse_i") {
      }
    }
  }
}