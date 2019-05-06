int Lives = 100;
int Coins = 500;
PImage BackGround;
Path Track = new Path();
ArrayList<Enemy> Enemies = new ArrayList<Enemy>();
ArrayList<Tower> Towers = new ArrayList<Tower>();
Tower CurrentTower;


void setup() {
  size(1430,800);
  BackGround = loadImage("Map.png");
  CurrentTower = new Tower();
  CurrentTower.Placing = false;
}

void draw() {
  if (random(0,100) < 5) {
    Enemies.add(new Enemy());
  }
  if (Lives <= 0) {
    noLoop();
  }
  //Drawing to screen goes under here
  image(BackGround,0,0);
  rectMode(CORNER);
  fill(#B99C84);
  rect(width-300,0,300,height);
  fill(0);
  ellipse(width-250,50,40,40);
  textSize(32);
  fill(0);
  text(Lives,5,30);
  text(Coins,95,30);
  for (Enemy Current : Enemies) {
    Current.Show();
    Current.Update();
  }
  for (Tower Current : Towers) {
    Current.Show();
    Current.ShootEnemy(Enemies);
  }
  for (int i = Enemies.size() - 1; i >= 0; i--) {
    Enemy Current = Enemies.get(i);
    if (Current.Position.x < -20 || Current.CurrentHealth.HitPoints <= 0) {
      Enemies.remove(i);
      if (Current.CurrentHealth.HitPoints > 0) {
        Lives -= 1;
      } else {
        Coins += 50;
      }
    }
  }
}

void mousePressed() {
  if (CurrentTower.Placing == true) {
    boolean Allowed = true;
    for (Tower Current : Towers) {
      if (((mouseX - (Current.Position.x)) * (mouseX - ((Current.Position.x))) + ((mouseY - Current.Position.y) * (mouseY - Current.Position.y))) < 75*75) {
        
        Allowed = false;
      }
    }
    if (Allowed == true) {
      CurrentTower.Position.x = mouseX;
      CurrentTower.Position.y = mouseY;
      CurrentTower.Placing = false;
      Coins -= 100;
    }
  } else if (((mouseX - (width-250)) * (mouseX - ((width-250))) + ((mouseY - 50) * (mouseY - 50))) < 20*20 && Coins >= 100) {
    Towers.add(new Tower());
    CurrentTower = Towers.get(Towers.size() - 1);
  } else {
    for (Tower Current : Towers) {
      if (((mouseX - Current.Position.x)*(mouseX - Current.Position.x)) + ((mouseY-Current.Position.y) * (mouseY-Current.Position.y)) < 75*75) {
      Current.Contact = true;
      } else {
        Current.Contact = false;
      }
    }
  }
}
