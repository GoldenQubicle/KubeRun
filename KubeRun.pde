//import com.hamoid.*;
//VideoExport MovingNow;

Cubes Cubes;

// camera stuff
float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;

float move;


void setup() {
  //MovingNow = new VideoExport(this, "MovingNow.mp4");
  //hint(ENABLE_STROKE_PERSPECTIVE);
  size(640, 640, P3D);
  //fullScreen(P3D);
  randomSeed(33);
  background (127);

  eyeX = width/2.0;
  eyeY =  height/2.0;
  eyeZ = (height/2.0) / tan(PI*30.0 / 180.0);
  centerX = width/2.0;
  centerY = height/2.0;
  centerZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;

  Cubes = new Cubes();
}


void draw() {
  background (128);

  //pointLight(51, 102, 126, 320, 0, 1000);

  camera(mouseX, mouseY, eyeZ, mouseX, mouseY, centerZ, upX, upY, upZ);

  //translate(320, 320, 0); 
  //box(50);

  //Cubes.Kubes();
  //Cubes.generator();
  pushMatrix();
  translate(0, 0, move); // OK OK OK so: the generator itself needs to move inside here with move HOWEVER - the generated cubes need to be redrawn outside here for camera movement
  //Cubes.Box();        // allmost there, the Z term that is being translated needs to be update in Table to draw cubes 
  Cubes.generator();

  popMatrix();
  move = move + 10;

  //eyeX++;
  //println(centerX);
  //centerX--;

  //eyeY = eyeY + 5;
  eyeZ = (eyeZ + 5);


  //centerX = centerX + 5;
  //centerY = centerY + 5;
  //centerZ = centerZ - 5;
  println(eyeZ);
  //MovingNow.saveFrame();
}


class Cubes {

  float BW, BH, BD, X, Y, Z, R, G, B; 
  Table Kubes;
  int row;  

  float moveZ;

  Cubes() {

    Kubes = new Table();
    Kubes.addColumn("BW");
    Kubes.addColumn("BH");
    Kubes.addColumn("BD");
    Kubes.addColumn("X");
    Kubes.addColumn("Y");
    Kubes.addColumn("Z");
    Kubes.addColumn("R");
    Kubes.addColumn("G");
    Kubes.addColumn("B");
    Kubes.addRow();
  }

  void generator() {

    Kubes.setFloat(row, 0, BW());
    Kubes.setFloat(row, 1, BH());
    Kubes.setFloat(row, 2, BD());
    Kubes.setFloat(row, 3, X());
    Kubes.setFloat(row, 4, Y());
    Kubes.setFloat(row, 5, Z());
    Kubes.setFloat(row, 6, R());
    Kubes.setFloat(row, 7, G());
    Kubes.setFloat(row, 8, B());

    row = row + 1;

    for (int i = 0; i < Kubes.getRowCount(); i++) {
      pushMatrix();
      //noStroke();
      fill(Kubes.getFloat(i, 6), Kubes.getFloat(i, 7), Kubes.getFloat(i, 8));
      translate(Kubes.getFloat(i, 3), Kubes.getFloat(i, 4), Kubes.getFloat(i, 5));
      box(Kubes.getFloat(i, 0), Kubes.getFloat(i, 1), Kubes.getFloat(i, 2));
      popMatrix();
      //println(X,Y,Z);
    }
  }

  //float moveZ() { Z = (random(20, 620)) + 100; return Z;}

  float X() {
    X = random(0, 640); // general rule of thumb, add .5*Z to X&Y to fill screen space
    return X;
  }

  float Y() {
    Y = random(0, 640);
    //Y = Y + 5;
    return Y;
  }

  float Z() {
    //Z = random(20, 620);
    Z = Z - 5;
    return Z;
  }

  float BW() {
    BW = random(10, 50);
    return BW;
  }

  float BH() {
    BH = random(10, 50);
    return BH;
  }

  float BD() {
    BD = random(10, 50);
    return BD;
  }

  float R() {
    R = random(0, 255); 
    return R;
  }

  float G() {
    G = random(0, 255); 
    return G;
  }

  float B() {
    B = random(0, 255); 
    return B;
  }
}