class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Wall> Walls;
  ArrayList<Target> Targets;
  PVector TargetPos;
  float R, G, B, A, Speed; 
  boolean level3 = false;
  Target T1, T2, T3, T4, T5;
  Wall Wall_l, Wall_r, Wall_u, Wall_d; 
  color ColorKube, ColorWall, ColorWall_M_E; 

  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();
    Walls = new ArrayList();
  }

  ArrayList Wallsetup() {
    if (state.level == 1 || state.level == 2 ) {
      ColorWall = color (124, 180, 255, 200);
      ColorWall_M_E = color (12, 12, 240);
      Wall_l = new Wall(0, 0, width*8, height, "LEFT", ColorWall, ColorWall_M_E);
      Wall_r = new Wall(0, 0, width*8, height, "RIGHT", ColorWall, ColorWall_M_E);
      Wall_u = new Wall(0, 0, width, height*8, "UP", ColorWall, ColorWall_M_E);
      Wall_d = new Wall(0, 0, width, height*8, "DOWN", ColorWall, ColorWall_M_E);
      Walls.add(Wall_r);
      Walls.add(Wall_l);
      Walls.add(Wall_u);
      Walls.add(Wall_d);
    }
    if (state.level == 3) {
      ColorWall = color(15, 75, 25);
      ColorWall_M_E = color (20, 60, 45);
      Wall_l = new Wall(0, 0, width*18, height, "LEFT", ColorWall, ColorWall_M_E);
      Wall_r = new Wall(0, 0, width*18, height, "RIGHT", ColorWall, ColorWall_M_E);
      Wall_u = new Wall(0, 0, width, height*18, "UP", ColorWall, ColorWall_M_E);
      Wall_d = new Wall(0, 0, width, height*18, "DOWN", ColorWall, ColorWall_M_E);
      Walls.add(Wall_l);
      Walls.add(Wall_r);
      Walls.add(Wall_u);
      Walls.add(Wall_d);
    }
    return Walls;
  }


  ArrayList Targetsetup() {
    if (state.level == 1) {
      //                   size, R, xpos,             ypos,           trigger,         distance,             color, score, last, curves
      T1 = new Target(400, 3, random(340, 440), random(240, 440), random(50, 150), random(700, 800), light.color3, 300, false, 80);
      T2 = new Target(300, 2, random(150, 250), random(450, 490), random(300, 350), random(700, 800), light.color3, 400, false, 120);  
      T3 = new Target(640, 5, 320, 320, 600, 1000, light.color3, 600, true, 0);  
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
    }
    if (state.level == 2) {
      //                 size, R, xpos,             ypos,           trigger,         distance,             color, score, last, curves
      T1 = new Target(320, 4, random(192, 240), random(192, 448), random(50, 150), random(700, 800), light.color3, 500, false, 50); 
      T2 = new Target(192, 3, random(300, 340), random(300, 340), random(250, 300), random(800, 900), light.color3, 750, false, 75);  
      T3 = new Target(128, 2, random(320, 576), random(320, 500), random(500, 550), random(750, 850), light.color3, 1000, false, 125);  
      T4 = new Target(640, 5, 320, 320, 700, 1250, light.color3, 1200, true, 0);
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
      Targets.add(T4);
    }
    if (state.level == 3) {
      //                 size, R, xpos,             ypos,      trigger,    distance,             color, score, last, curves
      T1 = new Target(280, 5, random(140, 500), random(140, 400), 10, random(2400, 2700), light.color2, 1000, false, 37);
      T2 = new Target(200, 4, random(100, 400), random(300, 540), 10, random(3700, 4000), light.color2, 1000, false, 37);
      //T3 = new Target();
      //T4 = new Target();
      T5 = new Target(640, 6, 320, 320, 800, 6500, light.color3, 1800, true, 0);
      Targets.add(T1);
      Targets.add(T2);
      //Targets.add(T3);
      //Targets.add(T4);
      Targets.add(T5);
    }
    return Targets;
  }

  void generator() {

    R = int(random(0, 255));
    G = int(random(0, 255));
    B = int(random(0, 255));
    A = 255;

    // LEVEL 1
    if (state.level == 1) {
      ColorKube = color(R, G, B, A);
      Cubes lvl1 = new Cubes(20, 50, 0, 150, ColorKube); 
      if ((lvl1.size.x - lvl1.size.y < 40) || (lvl1.size.x - lvl1.size.y > 30)) {  
        shininess(100);
        emissive(20);
        Kubes.add(lvl1);
      }
      state.acc = 1.15;
      Speed = 6.5;
    }

    // LEVEL 2
    if (state.level == 2) {
      ColorKube = color(R, G, G, B+100);
      Cubes lvl2XL = new Cubes(80, 160, 0, 150, ColorKube); 
      if (lvl2XL.size.z - lvl2XL.size.x > 66 ) {  
        specular(255);
        Kubes.add(lvl2XL);
      }
      Cubes lvl2M = new Cubes(50, 67, 0, 100, ColorKube);
      if (lvl2M.size.x - lvl2M.size.y < 7 && lvl2M.size.z + lvl2M.size.x > 119) {  
        specular(255);
        Kubes.add(lvl2M);
      }
      if (T2.sight == true && state.dist < 750) {
        Cubes lvl2S = new Cubes(7, 12, 150, 250, ColorKube);
        float cone = random(37, 57);
        lvl2S.pos = new PVector(random(controls.mouseXY.x*width -cone, controls.mouseXY.x*width+cone), random(controls.mouseXY.y*height-cone, controls.mouseXY.y*height+cone));
        pushMatrix();
        translate(0, 0, -state.PushBack);
        specular(255);
        emissive(255, 255, 45);
        Kubes.add(lvl2S);
        popMatrix();
      }
      state.acc = 1.15;
      Speed = 11.5;
    }

    // LEVEL 3
    level3 = true;
    if (state.level == 3) {
      ColorKube = color(R, G);
      Cubes lvl3 = new Cubes(35, 70, -500, -150, ColorKube);       
      //> 50 && lvl3.size.x - lvl3.size.y < 100 ) {  
      if (lvl3.size.y + lvl3.size.x > 97) { 
        Kubes.add(lvl3);
      }
      Cubes lvl3S = new Cubes(15, 25, 0, 50, ColorKube); 
      //Kubes.add(lvl3S);
      Cubes lvl3SS = new Cubes(5, 15, 0, 25, ColorKube); 
      float cone = random(37, 57);
      lvl3SS.pos = new PVector(random(controls.mouseXY.x*width -cone, controls.mouseXY.x*width+cone), random(controls.mouseXY.y*height-cone, controls.mouseXY.y*height+cone));
      //Kubes.add(lvl3SS);
      state.acc = 1.15;
      Speed = 13;
    }
  }
}