boolean Sorted = false;
int Count;
int i = 1;
int j = 0;
float x = PI;
ArrayList<Bar> Bars;
int Length = 255;
void setup() {
  size(800,800);
  colorMode(HSB);
  Bars = new ArrayList<Bar>();
  translate(width/2,height/2);
  for (float i = 0; i < 255; i += 1) {
    float Position = map(i,0,255,0,360);
    Bars.add(new Bar(Position,i));
  }
  Count = Bars.size();
  Randomize();
}


void draw() {
  Sort();
  background(0);
  noStroke();
  translate(width/2,height/2);
  rotate(x);
  for (Bar Current : Bars) {
    Current.Update();
    Current.Show();
  }
  if (Sorted == true) {
    x+=0.01;
  }
}

void Sort() {
  for (int i = 0; i < Length; i++) {
    Bar CurrentBar = Bars.get(i);
    if (i != Bars.size()-1) {
      Bar NextBar = Bars.get(i+1);
      if (CurrentBar.Colour < NextBar.Colour) {
        float TempHeight = NextBar.Colour;
        float TempColour = NextBar.Colour;
        NextBar.Colour = CurrentBar.Colour;
        NextBar.Colour = CurrentBar.Colour;
        CurrentBar.Colour = TempHeight;
        CurrentBar.Colour = TempColour;
      }
    }
    
  }
  Length -= 1;
  if (Length < 0) {
    Sorted = true;
  }
}

void Randomize() {
  for (int x = 0; x < 100000; x++) {
    int Random1 = int(random(0,Bars.size()));
    int Random2 = int(random(0,Bars.size()));
    Bar First = Bars.get(Random1);
    Bar Second = Bars.get(Random2);
    float Temp = Second.Colour;
    Second.Colour = First.Colour;
    First.Colour = Temp;
  }
}

void mouseClicked(MouseEvent event) {
  Sorted = false;
  Length = 255;
  Randomize();
  i = 1;
  j = 0;
  x = PI;
  loop();
}
  
