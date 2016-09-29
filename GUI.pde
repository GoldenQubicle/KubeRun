class gui {

  String [] text; 
  PFont font1, font2;
  int x, y, w, h, alpha, fade;
  float finish;
  color checker1, checker2;

  gui() {
    font1 = createFont ("TOSTADA.ttf", 64);
    font2 = createFont ("PoiretOne-Regular.ttf", 33);
    text = new String [10];
    text[0] = "run"; // 
    text[1] = "ph"; // 
    text[2] = "current";
    text[3] = "best";  //
    text[4] = "ph"; 
    text[5] = "ph"; 
    text[6] = "ph"; 
    text[7] = "KubeRun"; 
    text[8] = "start";
    text[9] = "stats";
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
    text(text[7], 0, 160);
    textSize(48);
    text(text[8], 0, 288);
    text(text[9], 0, 416);
    popMatrix();
  }


  void display() {
    pushMatrix();
    translate(-15, -65);
    fill(255);   
    textFont(font2);
    // static
    translate(150, 0, 0);
    textAlign(RIGHT);
    text(text[0], 0, 100);
    text(text[2], 175, 100);
    text(text[3], 350, 100);
    //  dynamic
    textAlign(LEFT);
    text(Run(), 15, 100);    
    text(Distance(), 190, 100);
    text(Best(), 365, 100);
    popMatrix();
  }
  String Run() {
    return text[1] = nf(state.run, 0, 0);
  }

  String Distance() {
    return text[4] = nf(state.distance(), 0, 0);
  }

  String Best() {
    return text[5] = nf(state.distance_best(), 0, 0);
  }

  void finishflag() {
    // checker1 is solidfill backdrop which might affect how checker2 loops w aplha!! 
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
    text("Press Spacebar to retry", width/2, height/2);
  }

  void finish() {
    textAlign(CENTER);
    textFont(font1, 33);
    fill(255);
    text("Press Spacebar to restart", width/2, height/2);
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

/* 
 
 void win(){
 finish flag here?
 
 hyper space short animation to bring back to reset screen?
 }
 
 void failure(){
 after a lot of attempts?
 you ded
 do you even Kube
 
 at the very start
 >.<
 that's unfortuante
 C
 d'oh
 
 O_O
 
 right before finish
 (╯°□°)╯ ┻┻
 ┌∩┐(◣_◢)┌∩┐ 
 
 } */