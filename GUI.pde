class GUI {

  Button start, level1, level2, level3, Continue, Menu;
  PFont font1, font2;
  ArrayList <Button> buttons;
  color textcolor;

  GUI() {
    font1 = createFont ("TOSTADA.ttf", 120);
    font2 = createFont ("PoiretOne-Regular.ttf", 128);
    textcolor = color(100, 175, 255); 
    buttons = new ArrayList();
    start = new Button("start", width/2, height/2, 400, 120, font2, 128, textcolor);
    level1 = new Button("LVL1", 100, 540, 150, 65, font1, 44, textcolor);
    level2 = new Button("LVL2", 320, 540, 150, 65, font1, 44, textcolor);
    level3 = new Button("LVL3", 540, 540, 150, 65, font1, 44, textcolor);
    Continue = new Button("continue", width/2, height/2, 400, 85, font2, 100, textcolor);
    Menu = new Button("back to menu", width/2, 450, 220, 40, font2, 33, textcolor);
    buttons.add(start);
    buttons.add(level1);
    buttons.add(level2);
    buttons.add(level3);
  }


  void ScoreMenu() {
    TargetScore();
    if (state.level <= 3) {
      Continue.Display();
      Continue.mouseClicked();
    }
    Menu.Display();
    Menu.mouseClicked();
 
  }

  void TargetScore() {
    for (int i = 0; i < score.Target.size(); i++) {
      String Targets = "Target " + (i+1);
      String Scores = " " + score.Target.get(i);
      fill(255);
      textAlign(CENTER);
      textFont(font2);
      textSize(33);
      textAlign(LEFT);
      text(Targets, width/2, 100+(35*i), 400, 100);
      textAlign(RIGHT);
      text(Scores, width/2, 100+(35*i), 400, 100);
      textAlign(LEFT);
      text("Total Score", width/2, 275, 400, 100);
      textAlign(RIGHT);
      text(""+score.LevelScore, width/2, 275, 400, 100);
    }
  }

  void Title() { 
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