String[] Lines;
String ToScroll;
int AmountScrolled = 0;
ArrayList<Star> Stars;
Logo StarWarsLogo;

void setup() {
  size(800,600,P3D);
  Lines =loadStrings("The Phantom Menace.txt");
  ToScroll = join(Lines, "\n");
  StarWarsLogo = new Logo();
  Stars = new ArrayList<Star>();
  for (int i = 0; i < 300; i++) {
    Stars.add(new Star());
  }
}

void draw() {
  translate(width/2,height/2);
  background(0);
  fill(255);
  for (Star CurrentStar : Stars) {
    CurrentStar.Show();
  }
  if (StarWarsLogo.Opacity > 10) {
    StarWarsLogo.Show();
  }
  rotateX(PI/3);
  fill(238,213,75);
  textAlign(CENTER); 
  for (int i = 0; i < Lines.length; i ++) {
    if (i > 1) {
      textSize(width * 0.04);
      text(Lines[i], 0, (height/2 + i*40) - AmountScrolled + 130);
    } else {
      textSize(width * 0.06);
      text(Lines[i], 0, (height/2 + i*70) - AmountScrolled + 50);
    }
  }
  //text(ToScroll, 0, height/2 - AmountScrolled);
  if (StarWarsLogo.Opacity < 10) {
    AmountScrolled += 1;
  }
}
