class Levels {
  ArrayList <Cubes> Kubes;
  float R, G, B, A; // r,g,b color values for kubes
  float Speed, Trigger;

  Levels() {
    Kubes = new ArrayList();
  }

  void Kubes() {
    R = int(random(0, 64));
    G = int(random(0, 64));
    B = int(random(0, 64));
    A = 255;

    if (state.level == 1) {
      Cubes lvl1 = new Cubes(10, 64, 0, 60, R, G, B, A); 
      Kubes.add(lvl1);

      while (Speed < 8) {
        Speed = Speed + .025;
      }

      Trigger = 50;
    }

    if (state.level == 2) {
      Cubes lvl2 = new Cubes(25, 65, 0, 25, R, G, G, B+100); 
      Kubes.add(lvl2);

      while (Speed < 15) {
        Speed = Speed + .05;
      }

      Trigger = 50;
    }

    if (state.level == 3) {
      Cubes lvl3 = new Cubes(35, 70, 0, 25, R, 0, 0, G); 
      Kubes.add(lvl3);
      Cubes lvl3e = new Cubes(5, 25, 0, 50, R, 0, 0, G); 
      Kubes.add(lvl3e);

      while (Speed < 20) {
        Speed = Speed + .075;
      }

      Trigger = 50;
    }
  }
}