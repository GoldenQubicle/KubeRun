class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Wall> Walls;
  ArrayList<Target> Targets;
  PVector TargetPos;
  float R, G, B, A, Speed; 
  boolean level3 = false;
  Target T1, T2, T3, T4, T5;
  color TargetEmission, TargetStroke, TargetColor;
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
      TargetEmission = color (64, 128, 64);
      TargetColor = color(153, 255, 51, 128);
      //                   size, R, xpos,             ypos,           trigger,         distance,    score, last, curves
      T1 = new Target(400, 3, random(340, 440), random(240, 440), random(50, 150), random(700, 800), 300, false, 80);
      T2 = new Target(300, 2, random(150, 250), random(450, 490), random(300, 350), random(700, 800), 400, false, 120);  
      T3 = new Target(640, 5, 320, 320, 600, 1000, 600, true, 0);  
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
    }
    if (state.level == 2) {
      TargetEmission = color (64, 128, 64);
      TargetColor = color(153, 255, 51, 128);
      //                 size, R, xpos,             ypos,           trigger,         distance,      score, last, curves
      T1 = new Target(320, 4, random(192, 240), random(192, 448), random(50, 150), random(700, 800), 500, false, 50); 
      T2 = new Target(192, 3, random(300, 340), random(300, 340), random(250, 300), random(800, 900), 750, false, 75);  
      T3 = new Target(128, 2, random(320, 576), random(320, 500), random(500, 550), random(750, 850), 1000, false, 125);  
      T4 = new Target(640, 5, 320, 320, 700, 1250, 1200, true, 0);
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
      Targets.add(T4);
    }
    if (state.level == 3) {
      TargetStroke = color (0, 0, 255);
      TargetColor = color (0, 0, 2, 57);
      TargetEmission = color (0, 128, 255);

      //                 size, R, xpos,             ypos,      trigger,    distance,     score, last, curves
      T1 = new Target(280, 5, random(140, 500), random(140, 400), 10, random(2400, 2700), 1000, false, 37);
      T2 = new Target(200, 4, random(100, 400), random(300, 540), 10, random(3700, 4000), 1000, false, 37);
      T3 = new Target(150, 3, random(300, 550), random(150, 405), 450, random(2400, 2700), 1000, false, 45);
      T4 = new Target(100, 2, random(150, 450), random(320, 590), 450, random(3900, 4250), 1000, false, 75);
      T5 = new Target(640, 6, 320, 320, 800, 7000, 1800, true, 0);
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
      Targets.add(T4);
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
      Cubes lvl1 = new Cubes(20, 50, 0, 150, ColorKube, 0, 0, 100); 
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
      Cubes lvl2XL = new Cubes(80, 160, 0, 150, ColorKube, ColorKube, color (50, 50, 50), 100); 
      if (lvl2XL.size.z - lvl2XL.size.x > 66 ) {  
        specular(255);
        Kubes.add(lvl2XL);
      }
      Cubes lvl2M = new Cubes(50, 67, 0, 100, ColorKube, ColorKube, color (50, 50, 50), 100);
      if (lvl2M.size.x - lvl2M.size.y < 7 && lvl2M.size.z + lvl2M.size.x > 119) {  
        specular(255);
        Kubes.add(lvl2M);
      }
      if (T2.sight == true && state.dist < 750) {
        Cubes lvl2S = new Cubes(7, 12, 150, 250, ColorKube, ColorKube, color (50, 50, 50), 100);
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
      if (T1.sight == false || T2.sight == false || T3.sight == false) {
        //                                           color      stroke          emissive          specular
        Cubes lvl3 = new Cubes(35, 70, -700, -150, ColorKube, light.color4, color (100, 100, 100), 100);       
   
        if (T1.sight == true) {
          lvl3.Emissive = color (80, 80, 80);
          ColorKube = color(R, G+20);
        }      
        if (T2.sight == true) {
          lvl3.Emissive = color (60, 60, 60);
          ColorKube = color(R, G+40);
        }  
        if (T3.sight == true) {
          lvl3.Emissive = color (20, 20, 20);
          ColorKube = color(R, G+60);
         
        }  
        if (lvl3.size.y + lvl3.size.x > 107) { 
          Kubes.add(lvl3);
        }
      }


      if (T2.sight == true) {
        //                  
        ColorKube = color (0, 0, 2, 57);              //color      stroke          emissive          specular
        Cubes lvl3s = new Cubes(35, 70, -700, -150, ColorKube, color(0,0,255, 0), color (0, 64, 255), 100);    
        if(lvl3s.size.x - lvl3s.size.y > 15){ 
        Kubes.add(lvl3s);
        }
        
        TargetEmission =  color (255, 64, 0);
        TargetStroke = color (255, 0, 0);

        //ColorWall = ColorWall/2;
        //ColorWall_M_E = ColorWall_M_E/2; 
      }

  if(T3.sight == true){
     //ColorWall = ColorWall/2;
     //   ColorWall_M_E = ColorWall_M_E/2; 
 
  }


       //small cubes cone
      //if (T1.sight == false) {
      //  Cubes lvl3SS = new Cubes(5, 15, 0, 25, ColorKube,  light.color4, color (100, 100, 100), 100); 
      //  float cone = random(37, 57);
      //  lvl3SS.pos = new PVector(random(controls.mouseXY.x*width -cone, controls.mouseXY.x*width+cone), random(controls.mouseXY.y*height-cone, controls.mouseXY.y*height+cone));
      //  Kubes.add(lvl3SS);
      //}


      state.acc = 1.15;
      Speed = 13;
    }
  }
}