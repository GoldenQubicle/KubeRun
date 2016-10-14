class ENV {

  int fade;
  float finish;
  color color1, color2, color3, color4;

  ENV() {
    // target colors
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51);
    color3 = color(153, 255, 51);
    color4 = color(51, 255, 51);
    // red fail state
    fade = 255;
  }

  void lights() {
    //if (keyPressed == true && key == 'l') {
      //ambientLight(128, 128, 128, width/2, height/2, state.Zplane);

      //pushMatrix();
      //rotateY(TAU/4);      
      //directionalLight(128, 128, 128, width/2, height/2, 0);

      //spotLight(64, 64, 64, width, 320, state.Zplane+500, -1, 0, -1, 180, 10); 
      //spotLight(64, 64, 64, 0, 320, state.Zplane+500, 1, 0, -1, 180, 10); 
      //pushMatrix();
      //translate(width/2, height/2, -50);
      //sphere(33);
      //popMatrix();


      spotLight(255, 255, 126, 320, 320, state.Zplane, 0, 0, -1, 180, 10); // center spotligth
    //}
  }

  void walls() {
    //ambient(10,10,10);
    lightFalloff(0.0001, 0.0001, 0.000001);
    ambientLight(64, 64, 128, 0, height/2, state.Zplane+100);
   //lightFalloff(0.001, 0.0001, 0.000001);
    ambientLight(64, 64, 128, width, height/2, state.Zplane+100);
    
    
    fill(180, 180, 255, 128); // dynamic color on basis off level

    noStroke();
    // left & right
    pushMatrix();
    rotateY(TAU/4);   
    rect(0, 0, width*4, height); // replace in here, preset the walls to finish distance? 
    pushMatrix();
    translate(0, 0, width);
    rect(0, 0, width*4, height); // replace in here
    popMatrix();
    popMatrix();

    // up & down
    pushMatrix();
    rotateX(-TAU/4);
    rect(0, 0, width, height*4); // replace in here
    pushMatrix();
    translate(0, 0, height);
    rect(0, 0, width, height*4); // replace in here
    popMatrix();
    popMatrix();
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

  int RedFade() {
    return fade;
  }
}