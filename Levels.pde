class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Target> Targets;
  float R, G, B, A; // r,g,b color values for kubes
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
    
    T1 = new Target(.2, random(0,100), 1250, env.color3); //trigger values could be randomized as well?!
    //T2 = new Target(.75, 0, 2500, 128); 
    Targets.add(T1);
    Targets.add(T2);
  }


  void targets() {
    for (int i = 0; i < Targets.size(); i++) {
      Target myTarget = Targets.get(i);
      myTarget.move();
    }
  }

  void generator() {

    R = int(random(0, 64));
    G = int(random(0, 64));
    B = int(random(0, 64));
    A = 255;

    // LEVEL 1
  
    if (state.level == 1) {
      
      //T1.TXY.x = random(40,200);
      //T1.TXY.y = random(0,320);
            
      ColorKube = color(R,G,B,A);
  
      Cubes lvl1 = new Cubes(10, 64, 0, 60, ColorKube); 
      Kubes.add(lvl1);
      while (Speed < 8) {
        Speed = Speed + .025;
      }
    }

    // LEVEL 2
    ColorKube = color(R,G,G,B+100);
    
    if (state.level == 2) {
      Cubes lvl2 = new Cubes(25, 65, 0, 25, ColorKube); 
      Kubes.add(lvl2);
      while (Speed < 15) {
        Speed = Speed + .05;
      }
    }

    // LEVEL 3
    ColorKube = color(R,G);
    
    if (state.level == 3) {
      Cubes lvl3 = new Cubes(35, 70, 0, 25,ColorKube); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, ColorKube); 
      Kubes.add(lvl3e);
      while (Speed < 20) {
        Speed = Speed + .075;
      }
    }
  }
}