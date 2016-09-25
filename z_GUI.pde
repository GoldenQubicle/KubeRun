class GUI {
  String [] text; 
  PFont font;
  int x, y, w, h, alpha;
  float finish;
  color checker1, checker2;
  GUI() {

    font = createFont ("MyriadHebrew-Bold-40.tff", 33);
    text = new String [7];
    text[0] = "run"; // 
    text[1] = "ph"; // 
    text[2] = "current";
    text[3] = "best";  //
    text[4] = "ph"; 
    text[5] = "ph"; 
    text[6] = "ph"; 
    // finishflag setup
    alpha = 128;
    x = 0;
    y = 0;
    w = 64;
    h = 64;
    checker1 = color(255, alpha);
    checker2 = color(0, alpha);
  }


  void display() {
    pushMatrix();
    translate(-15 ,-65);
    fill(255);   
    textFont(font);
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
 blame randomasation
 d'oh
 
 O_O
 
 right before finish
 (╯°□°)╯ ┻┻
 ┌∩┐(◣_◢)┌∩┐ 
 
 } */