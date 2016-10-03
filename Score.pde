class Score {


  Score() {
  }

  void Target() {

    // working out target hit
    controls.Mouse();
    println(controls.mouseXY.x, controls.mouseXY.y);

    // .125, .25, .375, .5, .625, .75, .875, 1

    if (controls.mouseXY.x < .125 || controls.mouseXY.x > .875 || controls.mouseXY.y < .125 || controls.mouseXY.y > .875) {
      println("score == 25");
    }
    if ((((controls.mouseXY.x > .125 && controls.mouseXY.x < .25) ||(controls.mouseXY.x > .75 && controls.mouseXY.x < .875))
      && (controls.mouseXY.y > .125 && controls.mouseXY.y < .875)) ||
      (((controls.mouseXY.y > .125 && controls.mouseXY.y < .25) ||(controls.mouseXY.y > .75 && controls.mouseXY.y < .875))
      && (controls.mouseXY.x > .125 && controls.mouseXY.x < .875))){    
      println("score == 50");
    }
     if ((((controls.mouseXY.x > .25 && controls.mouseXY.x < .375) ||(controls.mouseXY.x > .625 && controls.mouseXY.x < .75))
      && (controls.mouseXY.y > .25 && controls.mouseXY.y < .75)) ||
      (((controls.mouseXY.y > .25 && controls.mouseXY.y < .375) ||(controls.mouseXY.y > .625 && controls.mouseXY.y < .75))
      && (controls.mouseXY.x > .25 && controls.mouseXY.x < .75))){    
      println("score == 75");
    }
    if ((controls.mouseXY.x >.375 && controls.mouseXY.x < .625 && controls.mouseXY.y > .375 && controls.mouseXY.y < .625)){
      println("score == 100");
    }
  }
}