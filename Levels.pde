class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Target> Targets;
  float R, G, B, A; 
  float Speed, Trigger;
  Target T1, T2;
  Cubes level1, level2, level3;
  color ColorKube;
  
  /*
  IDEA: small targets appear at random place, only finish is screenfill & bullseye 
   
   */
  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();
 
    T1 = new Target(.6, random(0, 100), 1250, env.color3); //trigger values could be randomized as well?!
    T2 = new Target(.4, random(300, 400), 1000, env.color4); 
    Targets.add(T1);
    Targets.add(T2);
  }

  void TargetPosReset() {

    T1.Pos.x = random(.3, .7);
    T1.Pos.y = random(.3, .7);
    T2.Pos.x = random(.2, .8);
    T2.Pos.y = random(.2, .8);
  }

  void generator() {

    R = int(random(0, 64));
    G = int(random(0, 64));
    B = int(random(0, 64));
    A = 255;


    // LEVEL 1

    if (state.level == 1) {
      ColorKube = color(R, G, B, A);
      Cubes lvl1 = new Cubes(10, 64, 0, 60, ColorKube); 
      Kubes.add(lvl1);
      while (Speed < 9) {
        Speed = Speed + .025;
      }
    }

    // LEVEL 2
    ColorKube = color(R, G, G, B+100);

    if (state.level == 2) {
      Cubes lvl2 = new Cubes(25, 65, 0, 25, ColorKube); 
      Kubes.add(lvl2);
      while (Speed < 15) {
        Speed = Speed + .05;
      }
    }

    // LEVEL 3
    ColorKube = color(R, G);

    if (state.level == 3) {
      Cubes lvl3 = new Cubes(35, 70, 0, 25, ColorKube); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, ColorKube); 
      Kubes.add(lvl3e);
      while (Speed < 20) {
        Speed = Speed + .075;
      }
    }
  }
}