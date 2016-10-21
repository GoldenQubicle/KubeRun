class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Target> Targets;
  ArrayList<Wall> Walls;
  float R, G, B, A; 
  float Speed, TargetTrigger, TargetDistance;
  Target T1, T2, T3, T4, lvl1_t11, lvl1_t12, lvl1_t13, lvl1_t14;
  Wall wall_l, wall_r, wall_u, wall_d;
  color ColorKube, ColorWall, ColorWall_M_E, ColorWall_M_Er;
  PVector TargetPos;

  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();
    Walls = new ArrayList();
  }


  ArrayList Wallsetup() {
    if (state.level == 1) {
      ColorWall = color (124, 180, 255, 200);
      ColorWall_M_E = color (12, 12, 240);
      wall_l = new Wall(0, 0, width*8, height, "LEFT", ColorWall, ColorWall_M_E);
      wall_r = new Wall(0, 0, width*8, height, "RIGHT", ColorWall, ColorWall_M_E);
      wall_u = new Wall(0, 0, width, height*8, "UP", ColorWall, ColorWall_M_E);
      wall_d = new Wall(0, 0, width, height*8, "DOWN", ColorWall, ColorWall_M_E);
      Walls.add(wall_l);
      Walls.add(wall_r);
      Walls.add(wall_u);
      Walls.add(wall_d);
    }
    if (state.level == 3) {
      ColorWall = color(255);
      ColorWall_M_Er = color(120, 10, 12);
      wall_l = new Wall(width, 0, width, height, "LEFT", ColorWall, ColorWall_M_Er);
      Walls.add(wall_l);
    }
    return Walls;
  }


  ArrayList Targetsetup() {
    if (state.level == 1) {
      TargetTrigger = random(50, 150); 
      TargetDistance = random(700, 800);
      TargetPos = new PVector(random(340, 440), random(200, 300));
      //translate(TargetPos.x, TargetPos.y, 0); 
      lvl1_t11 = new Target(400, env.color2, 100, false, 80);
      lvl1_t12 = new Target(300, env.color2, 200, false, 60);
      lvl1_t13 = new Target(200, env.color2, 300, false, 40);
      lvl1_t14 = new Target(100, env.color2, 400, false, 30);
      //popMatrix();
      //T2 = new Target(317, random(128, 512), random(128, 512), 1000, random(300, 400), env.color3, 600, false);  
      //T3 = new Target(640, 320, 320, 1750, 625, env.color4, 1000, true);  
      Targets.add(lvl1_t11);
      Targets.add(lvl1_t12);
      Targets.add(lvl1_t13);
      Targets.add(lvl1_t14);
      //Targets.add(T2);
      //Targets.add(T3);
    }
    //if (state.level == 2) {
    //  T1 = new Target(320, random(192, 240), random(192, 448), 1250, random(0, 100), env.color3, "lvl2 T1", false); //trigger values could be randomized as well?!
    //  T2 = new Target(192, random(300, 340), random(300, 340), 1000, random(300, 400), env.color4, "lvl2 T2", false);  
    //  T3 = new Target(128, random(480, 576), random(480, 576), 1500, random(500, 600), env.color1, "lvl2 T3", true);  
    //  Targets.add(T1);
    //  Targets.add(T2);
    //  Targets.add(T3);
    //}
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
        //ambient(128);
        emissive(20);
        stroke(0);
        Kubes.add(lvl1);
      }
      state.acc = 1.15;
      Speed = 6.5;
    }

    // LEVEL 2
    if (state.level == 2) {
      ColorKube = color(R, G, G, B+100);
      Cubes lvl2 = new Cubes(25, 65, 0, 25, ColorKube); 
      Kubes.add(lvl2);

      state.acc = 1.2;
      Speed = 7.5;
    }

    // LEVEL 3
    if (state.level == 3) {
      ColorKube = color(R, G);
      Cubes lvl3 = new Cubes(35, 70, 0, 50, ColorKube); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, ColorKube); 
      Kubes.add(lvl3e);
      while (Speed < 12) {
        Speed = Speed + .075;
      }
    }
  }
}