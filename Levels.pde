class Levels {
  ArrayList <Cubes> Kubes;
  ArrayList<Target> Targets;
  float R, G, B, A; 
  float Speed, Trigger;
  Target T1, T2, T3, T4;
  color ColorKube;
 
  // make levels progress, i.e. after 2 target, finish lvl1, continue level 2

  Levels() {
    Kubes = new ArrayList();
    Targets = new ArrayList();

    if (state.level == 1) {
      //T1 = new Target(320, 320, 320,500, random(0,100), env.color2, "T1"); //trigger values could be randomized as well?!

      T1 = new Target(400, random(192,448), random(192,448), 800, random(0,100), env.color2, "T1"); //trigger values could be randomized as well?!
      T2 = new Target(317, random(128, 512),random(128, 512),1000,random(300, 400), env.color3, "T2");  
      T3 = new Target(640, 320, 320, 1750, 625, env.color4, "T3");  
      Targets.add(T1);
      Targets.add(T2);
      Targets.add(T3);
      //Targets.add(T4);
    }
    //if (state.level == 2) {
    //  T1 = new Target(.5, random(0, 100), 1250, env.color3); //trigger values could be randomized as well?!
    //  T2 = new Target(.3, random(300, 400), 1000, env.color4);  
    //  T3 = new Target(.2, random(500, 600), 1000, env.color1);  
    //  Targets.add(T1);
    //  Targets.add(T2);
    //  Targets.add(T3);
    //}
  }

  void TargetPos() {
    // LEVEL 1
    if (state.level == 1) {
      T1.Pos.x = random(192,448);
      T1.Pos.y = random(192,448);
      T2.Pos.x = random(128, 256);
      T2.Pos.y = random(128, 512);
      T3.Pos.x = 320;
      T3.Pos.y = 320;
     }
    // LEVEL 2
    //if (state.level == 2) {
    //  T1.Pos.x = random(.3, .3);
    //  T1.Pos.y = random(.3, .3);
    //  T2.Pos.x = random(.5, .5);
    //  T2.Pos.y = random(.5, .5);
    //  T3.Pos.x = random(.75, .9);
    //  T3.Pos.y = random(.75, .9);
    //}
    // LEVEL 3
  }

  void generator() {

    R = int(random(0, 255));
    G = int(random(0, 255));
    B = int(random(0, 255));
    A = 255;

    // LEVEL 1
    if (state.level == 1) {
      //println(count);
      //println(design.Kubes.size());


      ColorKube = color(R, G, B, A);
      Cubes lvl1 = new Cubes(20, 50, 0, 150, ColorKube); 
      if ((lvl1.size.x - lvl1.size.y < 40) || (lvl1.size.x - lvl1.size.y > 30)) {  
        shininess(100);
        //ambient(128);
        emissive(20);
        stroke(0);
        Kubes.add(lvl1);
        state.acc = 1.15;
      }
      while (Speed < 6.5 ) {
        Speed = Speed + .000005;
      }
    }

    // LEVEL 2
    if (state.level == 2) {
      ColorKube = color(R, G, G, B+100);
      Cubes lvl2 = new Cubes(25, 65, 0, 25, ColorKube); 
      Kubes.add(lvl2);
      
      state.acc = 1.2;
      while (Speed < 8.5) {
        Speed = Speed + .05;
      }
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