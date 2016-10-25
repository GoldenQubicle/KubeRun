class Score {

  FloatList Target, Scores;
  Float LevelScore = 0.0;

  Score() {

    Scores = new FloatList();
    Target = new FloatList();
    Target.append(200);
    Target.append(400);
    Target.append(600);
    Target.append(800);
    Target.append(1000);
  }

  Float TargetScore() {

    for (int i = 0; i < Target.size(); i++) {
      LevelScore = LevelScore + Target.get(i);
    }
    return LevelScore;
  }
}