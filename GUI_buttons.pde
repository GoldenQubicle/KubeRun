class Button {


  float Xpos, Ypos, BWidth, BHeight, xpos, ypos, bwidth, bheight;
  PFont Font, font;
  int TextSize, textsize;
  String Title, title;
  boolean hoover;
  color Hoover, Clicked;

  Button (String title, float xpos, float ypos, float bwidth, float bheight, PFont font, int textsize) {
    hoover = false;  
    Title = title;
    Xpos = xpos;
    Ypos = ypos;
    BWidth = bwidth;
    BHeight = bheight;
    Font = font;
    TextSize = textsize;
    Hoover = color (180, 50);
    Clicked = color (200, 100);
  }

  void Text() {
    textAlign(CENTER);
    textFont(Font);
    fill(255, 255, 0);    
    text(Title, (Xpos+BWidth/2), (Ypos+(BHeight*.6)));
  }

  void hoover() {
    if (mouseX > Xpos && mouseX < Xpos + BWidth && 
      mouseY > Ypos && mouseY < Ypos + BHeight) {
      fill(Hoover);
      rect(Xpos, Ypos, BWidth, BHeight);
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
      }
      if (Title == "stats") {
      }
      if (Title == "easy") {
        state.mode = 1;
      }
      if (Title == "normal") {
        state.mode = 2;
      }
      if (Title == "hard") {
        state.mode = 3;
      }
      if (Title == "hyper") {
      }
    }
  }
}