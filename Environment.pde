class ENV {

  float MoveWall;
  color color1, color2, color3, color4;
  PShape Wall_lvl3; 

  ENV() {
    // target colors
    color1 = color(255, 153, 51);
    color2 = color(255, 255, 51, 64);
    color3 = color(153, 255, 51, 128);
    color4 = color(51, 255, 51);
  }

  void lighting() {
    if (state.level == 1) {
      float strenght = 6;
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(strenght, strenght, strenght*2, 0, 0, 0);
      ambientLight(strenght, strenght, strenght*2, 0, height, 0);
      ambientLight(strenght, strenght, strenght*2, width, 0, 0);
      ambientLight(strenght, strenght, strenght*2, width, height, 0);
    }
    if (state.level == 3) {
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(12, 12, 12, width/2, height/2, state.Zplane);
    }
  }

  void walls() { // prolly easiest to pass level here and yes, duplicate if structure
    //ambient(10,10,10);
    // lighting setting level1
    // includes, lighfalloff, lights, emmisive wall AND cubes

    if (state.level == 1) {
      float strenght = 6;
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(strenght, strenght, strenght*2, 0, 0, 0);
      ambientLight(strenght, strenght, strenght*2, 0, height, 0);
      ambientLight(strenght, strenght, strenght*2, width, 0, 0);
      ambientLight(strenght, strenght, strenght*2, width, height, 0);

      fill(124, 180, 255, 200); // dynamic color on basis off level

      // pull walls backwards
      pushMatrix();
      translate(0, 0, state.Zplane);
      rectMode(CORNER);

      // left & right
      pushMatrix();
      rotateY(TAU/4);   
      emissive(12, 12, 240);
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


    if (state.level == 3) {
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(12, 12, 12, width/2, height/2, state.Zplane);

      //spotLight(255, 255, 255, mouseX, mouseY, state.Zplane+state.PushBack, 0, 0, -1, 360, 250);

      // pull walls backwards
      pushMatrix();
      fill(255);
      translate(0, 0, state.Zplane);
      rectMode(CORNER);

      //MoveWall+=design.Speed*6;

      //pushMatrix();
      //translate(0, 0, MoveWall);
      //println(MoveWall);
      //if (MoveWall > width*3) {
      //  MoveWall = 0;
      //}

      // left
      pushMatrix();
      rotateY(TAU/4);      
      //emissive(12, 120, 12);
      //rect(0, 0, width, height); 
      emissive(120, 10, 12);
      rect(width, 0, width, height);
      //emissive(10, 10, 120);
      //rect(width*2, 0, width, height);
      popMatrix();

      //pushMatrix();
      //translate(0, 0, -width*3);
      //pushMatrix();
      //rotateY(TAU/4);      
      //emissive(12, 120, 12);
      //rect(0, 0, width, height); 
      //emissive(120, 10, 12);
      //rect(width, 0, width, height);
      //emissive(10, 10, 120);
      //rect(width*2, 0, width, height);
      //popMatrix();
      //popMatrix();

      //pushMatrix();
      //translate(0, 0, -width*6);
      //pushMatrix();
      //rotateY(TAU/4);      
      //emissive(12, 120, 12);
      //rect(0, 0, width, height); 
      //emissive(120, 10, 12);
      //rect(width, 0, width, height);
      //emissive(10, 10, 120);
      //rect(width*2, 0, width, height);
      //popMatrix();
      //popMatrix();

      //pushMatrix();
      //translate(0, 0, -width*9);
      //pushMatrix();
      //rotateY(TAU/4);      
      //emissive(12, 120, 12);
      //rect(0, 0, width, height); 
      //emissive(120, 10, 12);
      //rect(width, 0, width, height);
      //emissive(10, 10, 120);
      //rect(width*2, 0, width, height);
      //popMatrix();
      //popMatrix();

      //pushMatrix();
      //translate(0, 0, -width*12);
      //pushMatrix();
      //rotateY(TAU/4);      
      //emissive(12, 120, 12);
      //rect(0, 0, width, height); 
      //emissive(120, 10, 12);
      //rect(width, 0, width, height);
      //emissive(10, 10, 120);
      //rect(width*2, 0, width, height);
      //popMatrix();
      //popMatrix();

      //pushMatrix();
      //translate(0, 0, width);
      //rect(0, 0, width*8, height); // replace in here
      //popMatrix();
      popMatrix();

      // up & down
      //pushMatrix();
      //rotateX(-TAU/4);
      //rect(0, 0, width, height*8); // replace in here
      //pushMatrix();
      //translate(0, 0, height);
      //rect(0, 0, width, height*8); // replace in here
      //popMatrix();
      //popMatrix();

      //popMatrix();
    }
  }
}