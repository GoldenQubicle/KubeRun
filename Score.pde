class Score {
  float score;
  FloatList Scores;

  Score() {
    score = 0;
    Scores = new FloatList();
  }

  float Target() {
    if (controls.mouseXY.x < .125 || controls.mouseXY.x > .875 || controls.mouseXY.y < .125 || controls.mouseXY.y > .875) {
      score = 250;
    }
    if ((((controls.mouseXY.x > .125 && controls.mouseXY.x < .25) ||(controls.mouseXY.x > .75 && controls.mouseXY.x < .875))
      && (controls.mouseXY.y > .125 && controls.mouseXY.y < .875)) ||
      (((controls.mouseXY.y > .125 && controls.mouseXY.y < .25) ||(controls.mouseXY.y > .75 && controls.mouseXY.y < .875))
      && (controls.mouseXY.x > .125 && controls.mouseXY.x < .875))) {    
      score = 500;
    }
    if ((((controls.mouseXY.x > .25 && controls.mouseXY.x < .375) ||(controls.mouseXY.x > .625 && controls.mouseXY.x < .75))
      && (controls.mouseXY.y > .25 && controls.mouseXY.y < .75)) ||
      (((controls.mouseXY.y > .25 && controls.mouseXY.y < .375) ||(controls.mouseXY.y > .625 && controls.mouseXY.y < .75))
      && (controls.mouseXY.x > .25 && controls.mouseXY.x < .75))) {    
      score = 750;
    }
    if ((controls.mouseXY.x >.375 && controls.mouseXY.x < .625 && controls.mouseXY.y > .375 && controls.mouseXY.y < .625)) {
      score = 1000;
    }
    if (state.run > 1) {
      score = score * 1/state.run;
      Scores.append(score);
    } else {
      Scores.append(score);
    }
    println(Scores);
    return score;
  }
}