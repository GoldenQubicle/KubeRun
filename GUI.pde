class GUI {

  String [] text; 
  PFont font1, font2;
  int x, y, w, h, alpha, fade;
  float finish;
  color color1, color2, color3, color4;

  GUI() {
    font1 = createFont ("TOSTADA.ttf", 64);
    font2 = createFont ("PoiretOne-Regular.ttf", 33);
    text = new String [5];
    text[0] = "KubeRun"; 
    text[1] = "start";
    text[2] = "stats";
    text[3] = "LVL ";
    text[4] = "Congrats!";
    // finishflag setup
    alpha = 255;
    x = 0;
    y = 0;
    w = 64;
    h = 64;
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51);
    color3 = color(153, 255, 51);
    color4 = color(51, 255, 51);
    fade = 255;
  }

  void titlescreen() {
    pushMatrix();
    translate(width/2, 64, 0);
    textAlign(CENTER);
    textFont(font1);
    text(text[0], 0, 160);
    textSize(48);
    text(text[1], 0, 288);
    text(text[2], 0, 416);
    popMatrix();
  }

  void target() {
    noStroke();
    fill(color1);
    rect(0, 0, width, height);  
    fill(color2);
    rect(width/8, height/8, 3*(width/4), 3*(height/4)); 
    fill(color3);
    rect(width/4, height/4, 2*(width/4), 2*(height/4));
    fill(color4);
    rect(1.5*(width/4), 1.5*(height/4), 2*(width/8), 2*(height/8));
  }

  void finish() {
    textAlign(CENTER);
    textFont(font1, 33);
    fill(255);
    if (state.level <= 3) {
      text(text[3] + state.level, width/2, height/2);
    } else {    
      text(text[4], width/2, height/2);
    }
  }

  int RedFade() {
    return fade;
  }
}