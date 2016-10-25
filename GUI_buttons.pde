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

  void Display() {
    textAlign(CENTER);
    textFont(Font);
    textSize(TextSize);
    fill(100,175,255);    
    text(Title, Xpos, Ypos+BHeight/3);

    if (mouseX > Xpos-BWidth/2 && mouseX < Xpos + BWidth/2 && 
      mouseY > Ypos-BHeight/2 && mouseY < Ypos + BHeight/2) {
      fill(Hoover);
      rectMode(CENTER);
      noStroke();
      rect(Xpos, Ypos, BWidth, BHeight);
      hoover = true;
    } else {
      hoover = false;
    }
  }

  void mouseClicked() {
    if (mousePressed == true && hoover == true) {
      if (Title == "start") {
        struct = 1;
        controls.reset();
      }
      if (Title == "LVL1") {
        state.level = 1;
      }
      if (Title == "LVL2") {
        state.level = 2;
      }
      if (Title == "LVL3") {
        state.level = 3;
      }
    }
  }
}