class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Target> Targets;
  float R, G, B, A; // r,g,b color values for kubes
  float Speed, Trigger;
  Target T1, T2;

  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();
    T1 = new Target(.5, 200, 50); 
    T2 = new Target(.75, 500, 100); 
    Targets.add(T1);
    Targets.add(T2);
  }

  void Targets() {
    for (int i = 0; i < Targets.size(); i++) {
      Target myTarget = Targets.get(i);
      myTarget.move();
    }
  }

  void Kubes() {
    R = int(random(0, 64));
    G = int(random(0, 64));
    B = int(random(0, 64));
    A = 255;
    
    // LEVEL 1
    if (state.level == 1) {
      Cubes lvl1 = new Cubes(10, 64, 0, 60, R, G, B, A); 
      Kubes.add(lvl1);
      while (Speed < 8) {
        Speed = Speed + .025;
      }
    }
    
    // LEVEL 2
    if (state.level == 2) {
      Cubes lvl2 = new Cubes(25, 65, 0, 25, R, G, G, B+100); 
      Kubes.add(lvl2);
      while (Speed < 15) {
        Speed = Speed + .05;
      }
    }
    
    // LEVEL 3
    if (state.level == 3) {
      Cubes lvl3 = new Cubes(35, 70, 0, 25, R, 0, 0, G); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, R, 0, 0, G); 
      Kubes.add(lvl3e);
      while (Speed < 20) {
        Speed = Speed + .075;
      }
    }
  }
}