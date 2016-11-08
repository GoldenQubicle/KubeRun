class Score {

  FloatList Target, Scores, Overall;
  Float LevelScore = 0.0;

  Score() {

    Scores = new FloatList();
    Target = new FloatList();
    Overall = new FloatList();
  }

  Float LevelScore() {

    for (int i = 0; i < Target.size(); i++) {
      Overall.append(Target.get(i));
      LevelScore = LevelScore + Target.get(i);
    }
    Overall.append(state.level);
    Overall.append(state.run);
    println(Overall);
    return LevelScore;
  }
  

  
}