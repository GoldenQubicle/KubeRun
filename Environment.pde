class ENV {
  int fade;
  float finish;
  color color1, color2, color3, color4;

  ENV() {
    // target colors
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51);
    color3 = color(153, 255, 51,128);
    color4 = color(51, 255, 51, 128);
    // red fail state
    fade = 255;
  
  }

  void spotlight() {
    //float x, y;
    //x = mouseX;
    //y = mouseY;
    //if (state.hit == false) {
    //  x = mouseX;
    //  y = mouseY;
    //}
     // center spotlight
     //spotLight(128, 128, 128, width/2, height/2, state.Zplane+state.PushBack, 0, 0, -1, 360, 250);
  }

  void walls() {
    //ambient(10,10,10);
    // lighting setting level1
    // includes, lighfalloff, lights, emmisive wall AND cubes
    float strenght = 7;
    lightFalloff(0.000001, 0.000001, 0.00000035);
    ambientLight(strenght, strenght, strenght*2, 0, 0, 0);
    ambientLight(strenght, strenght, strenght*2, 0, height, 0);
    ambientLight(strenght, strenght, strenght*2, width, 0, 0);
    ambientLight(strenght, strenght, strenght*2, width, height, 0);;


    fill(124, 180, 255, 200); // dynamic color on basis off level

    // pull walls backwards
    pushMatrix();
    translate(0, 0, state.Zplane);
    rectMode(CORNER);
 
    // left & right
    pushMatrix();
    rotateY(TAU/4);   
    emissive(12,12,240);
    rect(0, 0, width*8, height); // replace in here, preset the walls to finish distance? 
    pushMatrix();
    translate(0, 0, width);
    rect(0, 0, width*8, height); // replace in here
    popMatrix();
    popMatrix();

    // up & down
    pushMatrix();
    rotateX(-TAU/4);
    rect(0, 0, width, height*8); // replace in here
    pushMatrix();
    translate(0, 0, height);
    rect(0, 0, width, height*8); // replace in here
    popMatrix();
    popMatrix();

    popMatrix();
  }

  int RedFade() {
    return fade;
  }
}