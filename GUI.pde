class GUI {

  String [] text; 
  PFont font1, font2;
  int x, y, w, h, alpha, fade;
  float finish;
  color checker1, checker2;

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
    checker1 = color(175, alpha);
    checker2 = color(75, alpha);
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
    if (state.level == 3) {
      strokeWeight(8);
    } 
    fill(checker1);
    rect(0, 0, width, height);  
    // draws checker2
    for ( y = 0; y < 640; y = y + 128) {
      pushMatrix();
      translate(0, y);
      for ( x = 0; x < 640; x = x + 128) {
        noStroke();
        fill(checker2);
        rect(x, 0, w, h);
      }
      translate(64, 64);
      for ( x = 0; x < 640; x = x + 128) {
        noStroke();
        fill(checker2);
        rect(x, 0, w, h);
      }
      popMatrix();
    }
  }

  void reset() {
    textAlign(CENTER);
    textFont(font1, 33);
    fill(0, 0, 0);
    //text("Press Spacebar to retry", width/2, height/2);
  }

  void finish() {
    textAlign(CENTER);
    textFont(font1, 33);
    fill(255);
    if(state.level <= 3){
    text(text[3] + state.level, width/2, height/2);
    } else {    
    text(text[4],width/2, height/2);
    }
    
  }


  int RedFade() {

    //float S, s, start, stop;
    //start = controls.mouseXY.z;
    //stop = start + 255*10000;

    //for ( S = start; S < stop; S++){
    //  for ( s = 0; s < 10000; s++){

    //fade = fade -1;
    //  }

    //}
    //println(start, stop, S, s, fade);
    return fade;
  }
}