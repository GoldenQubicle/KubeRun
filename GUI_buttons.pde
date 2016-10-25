class Button {

  float Xpos, Ypos, BWidth, BHeight, xpos, ypos, bwidth, bheight;
  PFont Font, font;
  int TextSize, textsize;
  String Title, title;
  boolean hoover;
  color Hoover, Clicked, select, TextColor;

  Button (String title, float xpos, float ypos, float bwidth, float bheight, PFont font, int textsize, color textcolor) {
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
    select = textcolor - 200;
    TextColor = textcolor;
  }

  void Display() {
    fill(TextColor);
    textAlign(CENTER);
    textFont(Font);
    textSize(TextSize);
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
      if (Title == "start" || Title == "continue") {
        struct = 1;
        controls.reset();
      }
      if (Title == "LVL1") {
        state.level = 1;
        fill(select);
        rect(Xpos, Ypos, BWidth, BHeight);
      }
      if (Title == "LVL2") {
        state.level = 2;
        fill(select);
        rect(Xpos, Ypos, BWidth, BHeight);
      } 
      if (Title == "LVL3") {
        state.level = 3;
        fill(select);
        rect(Xpos, Ypos, BWidth, BHeight);
      }
      if (Title == "back to menu") {
        struct = 0;
        if (state.level > 3) {
          state.level = 1;
        }
      }
    }
  }
}