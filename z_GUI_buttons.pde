//class Button {


//  float Xpos, Ypos, BWidth, BHeight, xpos, ypos, bwidth, bheight;
//  PFont Font, font;
//  int TextSize, textsize;
//  String Title, title;
//  boolean hoover;
//  color Hoover, Clicked;

//  Button (String title, float xpos, float ypos, float bwidth, float bheight, PFont font, int textsize) {
//    hoover = false;  
//    Title = title;
//    Xpos = xpos;
//    Ypos = ypos;
//    BWidth = bwidth;
//    BHeight = bheight;
//    Font = font;
//    TextSize = textsize;
//    Hoover = color (180, 50);
//    Clicked = color (200, 100);
//  }

//  void Text() {
//    textAlign(CENTER);
//    textFont(Font);
//    fill(255, 255, 0);    
//    text(Title, (Xpos+BWidth/2), (Ypos+(BHeight*.6)));
//  }

//  void hoover() {
//    if (mouseX > Xpos && mouseX < Xpos + BWidth && 
//      mouseY > Ypos && mouseY < Ypos + BHeight) {
//      fill(Hoover);
//      rect(Xpos, Ypos, BWidth, BHeight);
//      hoover = true;
//    } else {
//      hoover = false;
//    }
//  }

//  void mouseClicked() {
//    if (mousePressed == true && hoover == true) {
//      if (Title == "header") {
//      }
//      if (Title == "header") {
//      }
//      if (Title == "start") {
//        struct = 1;
//        state.hit = false;
//        state.start = true;
//        state.finish = false;
//      }
//      if (Title == "stats") {
//      }
//      if (Title == "easy") {
//        state.mode = 1;
//      }
//      if (Title == "normal") {
//        state.mode = 2;
//      }
//      if (Title == "hard") {
//        state.mode = 3;
//      }
//      if (Title == "hyper") {
//      }
//    }
//  }
//}
//!! carried over from former GUI class
  //void buttons() {
  //  noStroke();
  //  fill(180);
  //  for (int i = 0; i < buttons.size(); i++) {      
  //    Button myButton = buttons.get(i);
  //    myButton.Text();
  //    myButton.hoover();
  //    myButton.mouseClicked();
  //  }
  //}


// possible hoover texts
  // silly little game by vrtxt, link to GP
  // run 'n dodge through 3 levels , dodge 'n run
  // dem scores
  // smallest distance, slowest overall speed, 3 levels
  // normal distance, normal overall speed, 3 levels
  // largest distance, highest overall speed, 3 levels
  // clear all 3 modes in one go! 9 levels without a single hit
  // up is up, left is left and all is right. 
  // left is right, up is down and whats going on?!