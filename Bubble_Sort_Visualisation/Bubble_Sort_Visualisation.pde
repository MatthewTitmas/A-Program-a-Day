int AmountOfBars = 100;
int Length = AmountOfBars;
ArrayList<Bar> Bars = new ArrayList<Bar>();

void setup() {
  size(800,800);
  background(0);
  int HeightDifference = height/AmountOfBars;
  float BarWidth = width/AmountOfBars;
  for (int x = 0; x < height; x += HeightDifference) {
    Bars.add(new Bar(x,random(0,height),BarWidth));
  }
}

void draw() {
  background(0);
  frameRate(60);
  Bar NextBar;
  for (int i = 0; i < Length; i++) {
    Bar CurrentBar = Bars.get(i);
    if (i != Bars.size()-1) {
      NextBar = Bars.get(i+1);
      if (CurrentBar.Height < NextBar.Height) {
        float TempHeight = NextBar.Height;
        float TempColour = NextBar.Colour;
        NextBar.Height = CurrentBar.Height;
        NextBar.Colour = CurrentBar.Colour;
        CurrentBar.Height = TempHeight;
        CurrentBar.Colour = TempColour;
      }
    }
    
  }
  Length -= 1;
  for (Bar CurrentBar : Bars) {
    CurrentBar.Show();
  }
}
