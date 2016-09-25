class GUI {
  String [] text; 
  PFont font;
  int x, y, w, h, alpha;
  float finish;
  color checker1, checker2;
  GUI() {

    font = createFont ("MyriadHebrew-Bold-40.tff", 33);
    text = new String [4];
    text[0] = "run"; // at the start
    text[1] = "runs"; // after 2, or more, attempts
    text[2] = "distance";
    text[3] = "best";  //

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
    fill(255); 
    textFont(font);
    text(text[0], 0, 100);
    text(state.run, 75, 100);
    text(text[2], 0, 175);
    text(state.distance(), 150, 175);
    text(text[3], 0, 250);
    text(state.distance_best(), 125, 250);
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