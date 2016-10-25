class Lighthing {

  float MoveWall;
  color color1, color2, color3, color4;
  PShape Wall_lvl3; 

  Lighthing() {
    // target colors
    color1 = color(255, 153, 51, 100);
    color2 = color(255, 255, 51, 64);
    color3 = color(153, 255, 51, 128);
    color4 = color(random(128,255), 51, 51, random(64,128));
  }

  void level() {
    if (state.level == 1) {
      float strenght = 6;
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(strenght, strenght, strenght*2, 0, 0, 0);
      ambientLight(strenght, strenght, strenght*2, 0, height, 0);
      ambientLight(strenght, strenght, strenght*2, width, 0, 0);
      ambientLight(strenght, strenght, strenght*2, width, height, 0);
    }
    if (state.level == 2) {
      lightFalloff(.5, 0.0005, 0.0000005);
      ambientLight(180, 180, 180, mouseX, mouseY, state.Zplane);
      lightSpecular(102, 180, 25);
    }

    if (state.level == 3) {
      lightFalloff(0.000001, 0.000001, 0.00000035);
      ambientLight(12, 12, 12, mouseX, mouseY, state.Zplane);
      spotLight(255, 255, 255, mouseX, mouseY, state.Zplane+state.PushBack, 0, 0, -1, 360, 250);
    }
  }
}