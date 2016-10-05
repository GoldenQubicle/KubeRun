class GUI {

  String [] text; 
  PFont font1, font2;
  int x, y, w, h, alpha, fade;
  float finish;
  color color1, color2, color3, color4;
  float wB, hB;

  GUI() {
    font1 = createFont ("TOSTADA.ttf", 120);
    font2 = createFont ("PoiretOne-Regular.ttf", 33);
    text = new String [11];
    text[0] = "KubeRun"; 
    text[1] = "start";
    text[2] = "stats";
    text[3] = "LVL ";
    text[4] = "Congrats!";
    text[5] = "easy";
    text[6] = "normal";
    text[7] = "hard";
    text[8] = "hyper";
    text[9] = "mouse normal";
    text[10] = "mouse inverse";
    // target setup
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
    // buttons
    wB = 150;
    hB = 50;
  }

  void menu() {
    noStroke();

    fill(180);
    rect(0, 0, width, 155);
    fill(80);
    rect(0, 155, width/2, 155);
    fill(100);
    rect(width/2, 155, width/2, 155);

    fill(200);
    rect(0, 310, width/2, 110);
    fill(220);
    rect(width/2, 310, width/2, 110);

    fill(180);
    rect(0, 420, width/2, 110);
    fill(160);
    rect(width/2, 420, width/2, 110);

    fill(120);
    rect(0, 530, width/2, 110);
    fill(140);
    rect(width/2, 530, width/2, 110);
  }

  void titlescreen() {
    menu();

    fill(255);
    textAlign(CENTER);
    textFont(font1);
   
    text(text[0], width/2, 128);  // silly little game by vrtxt, link to GP
    textSize(48);
    text(text[1], width/4, 255); // run 'n dodge through 3 levels , dodge 'n run
    text(text[2], (width-width/4), 255); // dem scores


    textSize(33);   
    text(text[5], width/4, 375); // smallest distance, slowest overall speed, 3 levels
    text(text[6], (width-width/4), 375); // normal distance, normal overall speed, 3 levels
    text(text[7], width/4, 485); // largest distance, highest overall speed, 3 levels
    text(text[8], (width-width/4), 485); // clear all 3 modes in one go! 9 levels without a single hit
    textSize(28); 
    text(text[9], width/4, 595); // up is up, left is left and all is right. 
    text(text[10], (width-width/4), 595); // left is right, up is down and whats going on?!
  }

  void buttons_title() {
    fill(0, 117);
    noStroke();
    strokeCap(ROUND);
    rectMode(CENTER);
    if ((mouseX > (width/2 - wB/2) && mouseX < (width/2 + wB/2)) && 
      (mouseY > (270 - hB/2) && mouseY < (270 + hB/2))) {
      rect(width/2, 272, wB, hB); // start
      //if (mousePressed && (mouseButton == LEFT)) {
      //  struct = 1;
      //}
    } else if ((mouseX > (width/2 - wB/2) && mouseX < (width/2 + wB/2)) && 
      (mouseY > (400 - hB/2) && mouseY < (400 + hB/2))) {
      rect(width/2, 402, wB, hB); // stats
      //if (mousePressed && (mouseButton == LEFT)) {
      //  struct = 2;
      //}
    } else {
      println("");
    }
  }



  void target() {
    pushMatrix();
    rectMode(CORNER);
    noStroke();
    fill(color1);
    rect(0, 0, width, height);  
    fill(color2);
    rect(width/8, height/8, 3*(width/4), 3*(height/4)); 
    fill(color3);
    rect(width/4, height/4, 2*(width/4), 2*(height/4));
    fill(color4);
    rect(1.5*(width/4), 1.5*(height/4), 2*(width/8), 2*(height/8));
    popMatrix();
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