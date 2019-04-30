ArrayList<Star> Stars = new ArrayList<Star>();
ArrayList<ShootingStar> ShootingStars = new ArrayList<ShootingStar>();
int Count = int(random(10,20));
int AddStar = 0;

void setup() {
  fullScreen();
  background(0);
}

void draw() {
  int Random = int(random(200));
  if (Random == 5) {
    ShootingStars.add(new ShootingStar());
  }
  if (AddStar % Count == 0) {
    Stars.add(new Star());
    Count = int(random(10,20));
  }
  background(0);
  for (int i = 0; i < Stars.size(); i++) {
    Star part = Stars.get(i);
    if (part.Opacity < 0) {
      Stars.remove(i);
    }
    part.Draw();
  }
  
  for (int i = 0; i < ShootingStars.size(); i++) {
    ShootingStar part = ShootingStars.get(i);
    if (part.Opacity < 0) {
      ShootingStars.remove(i);
    }
    part.Draw();
  }
  AddStar += 1;
}

  
