ArrayList<Streak> Streaks;
int TextSize = 32;

void setup() {
  Streaks = new ArrayList<Streak>();
  for (int i = 0; i < 75; i++) {
    Streaks.add(new Streak());
  }
  background(0);
  fullScreen();
}

void draw() {
  textSize(TextSize);
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);
  fill(#1FF81F);
  for (Streak Current : Streaks) {
    Current.Show();
    if (frameCount % 4 == 0) {
      Current.NewChar();
      Current.Update();
    }
  }
  
  for (int i = Streaks.size()-1; i >= 0; i--) {
    Streak Current = Streaks.get(i);
    if (Current.Gone) {
      Streaks.remove(i);
    }
  }
  
  if (random(0,1) < 0.3) {
    Streaks.add(new Streak());
  }
}
