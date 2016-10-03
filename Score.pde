class Score {
float score;
FloatList Scores;

  Score() {
    score = 0;
    Scores = new FloatList();
  }

  float Target() {

    // working out target hit
    //controls.Mouse();
    //println(controls.mouseXY.x, controls.mouseXY.y);

    // .125, .25, .375, .5, .625, .75, .875, 1

    if (controls.mouseXY.x < .125 || controls.mouseXY.x > .875 || controls.mouseXY.y < .125 || controls.mouseXY.y > .875) {
        score = 250;
    }
    if ((((controls.mouseXY.x > .125 && controls.mouseXY.x < .25) ||(controls.mouseXY.x > .75 && controls.mouseXY.x < .875))
      && (controls.mouseXY.y > .125 && controls.mouseXY.y < .875)) ||
      (((controls.mouseXY.y > .125 && controls.mouseXY.y < .25) ||(controls.mouseXY.y > .75 && controls.mouseXY.y < .875))
      && (controls.mouseXY.x > .125 && controls.mouseXY.x < .875))){    
       score = 500;
    }
     if ((((controls.mouseXY.x > .25 && controls.mouseXY.x < .375) ||(controls.mouseXY.x > .625 && controls.mouseXY.x < .75))
      && (controls.mouseXY.y > .25 && controls.mouseXY.y < .75)) ||
      (((controls.mouseXY.y > .25 && controls.mouseXY.y < .375) ||(controls.mouseXY.y > .625 && controls.mouseXY.y < .75))
      && (controls.mouseXY.x > .25 && controls.mouseXY.x < .75))){    
        score = 750;
    }
    if ((controls.mouseXY.x >.375 && controls.mouseXY.x < .625 && controls.mouseXY.y > .375 && controls.mouseXY.y < .625)){
          score = 1000;
    }
    score = score * 1/state.run;
    //println(score);
   return score;
  }
  
  // what if end score is 'target score * 1/runs' and hyperrun highscore  score = 9 * 1000 + 1000 bonus = 10000
  
}