class GUI {
  //Button header, start, howto, stats, easy, normal, hard, hyper;
  //ArrayList <Button> buttons;
  //String [] text; 
  //PFont font1, font2;
  int fade;
  float finish;
  color color1, color2, color3, color4;

  GUI() {
    //font1 = createFont ("TOSTADA.ttf", 120);
    //font2 = createFont ("PoiretOne-Regular.ttf", 64);
    //text = new String [9];
    //text[0] = "KubeRun"; 
    //text[1] = "start";
    //text[2] = "what?";
    //text[3] = "stats";
    //text[4] = "easy";
    //text[5] = "normal";
    //text[6] = "hard";
    //text[7] = "hyper";
    //text[8] = "LVL ";
      // buttons
    //buttons = new ArrayList();
    //header = new Button(text[0], 0, 0, width, height/3, font1, 128);
    //start = new Button(text[1], width/3, height/3, width/3, height/3, font2, 64);
    //howto = new Button(text[2], 0, height/3, width/3, height/3, font2, 64);
    //stats = new Button(text[3], (width-width/3), height/3, width/3, height/3, font2, 64);
    //easy = new Button(text[4], 0, (height-height/3), width/2, 110, font2, 64);
    //normal = new Button(text[5], width/2, (height-height/3), width/2, 110, font2, 64);
    //hard = new Button(text[6], 0, (height-110), width/2, 110, font2, 64);
    //hyper = new Button(text[7], width/2, (height-110), width/2, 110, font2, 64);
    //buttons.add(header);
    //buttons.add(start);
    //buttons.add(howto);
    //buttons.add(stats);
    //buttons.add(easy);
    //buttons.add(normal);
    //buttons.add(hard);
    //buttons.add(hyper);
    // target colors
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51);
    color3 = color(153, 255, 51);
    color4 = color(51, 255, 51);
    // red fail state
    fade = 255;
  }

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
   
    fill(255);
    if (state.level <= 3) {
      text("placeholder", width/2, height/2);
    } else {    
      text("congrats I guess", width/2, height/2);
    }
  }

  int RedFade() {
    return fade;
  }
}