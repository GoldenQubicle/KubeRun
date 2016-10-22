class Score {
  float targetscore;
  FloatList Target, Scores;
  int i = 0;

  Score() {
    targetscore = 0;
    Scores = new FloatList();
    Target = new FloatList();
  }

  void TargetScore() {
   
    while ( i < Target.size()){
      targetscore = targetscore + Target.get(i); 
      i = i + 1;
      //println(targetscore);
      //break;
    }
    //println(targetscore,Target.size(), "check");
  }
}