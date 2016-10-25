class GUI {
  Button start, level1, level2, level3;
  PFont font1, font2;
  ArrayList <Button> buttons;
  GUI() {
    font1 = createFont ("TOSTADA.ttf", 120);
    font2 = createFont ("PoiretOne-Regular.ttf", 128);
    buttons = new ArrayList();
    start = new Button("start", width/2, height/2, 400, 120, font2, 128);
    level1 = new Button("LVL1", 100, 540, 150, 65, font1, 44);
    level2 = new Button("LVL2", 320, 540, 150, 65, font1, 44);
    level3 = new Button("LVL3", 540, 540, 150, 65, font1, 44);
    buttons.add(start);
    buttons.add(level1);
    buttons.add(level2);
    buttons.add(level3);     
  }

  void Title(){ 
    textAlign(CENTER);
    textFont(font1);
    fill(100, 175, 255);
    text("KubeRun", width/2, 200);

  }
  
  void menu() {
    noStroke();
    fill(180);
    for (int i = 0; i < buttons.size(); i++) {      
      Button myButton = buttons.get(i);
      myButton.Display();
      myButton.mouseClicked();
    }
  }
  
  
}