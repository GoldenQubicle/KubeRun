class Cubes {

  float BW, BH, BD, X, Y, Z, R, G, B; 
  Table Kubes;
  int row;  

  //float moveZ;

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
      fill(Kubes.getFloat(i, 6), Kubes.getFloat(i, 7), Kubes.getFloat(i, 8));
      translate(Kubes.getFloat(i, 3), Kubes.getFloat(i, 4), Kubes.getFloat(i, 5));
      box(Kubes.getFloat(i, 0), Kubes.getFloat(i, 1), Kubes.getFloat(i, 2));
      popMatrix();

    }
  }

  void collision(){
 
      
      
    
  }


  float X() {
    X = random(0, 640); 
    return X;
  }

  float Y() {
    Y = random(0, 640);
    //Y = Y + 5;
    return Y;
  }

  float Z() {
    //Z = random(20, 620);
    Z = Z - speed; 
    /* this here is speed at which generator moves! 
    thus this determines the position at which cubes are being drawn. 
    Currently this is a negative value since z = z -5    
    */
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