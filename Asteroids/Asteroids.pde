Ship Player;
ArrayList<Asteroid> Asteroids;
ArrayList<Shot> Shots;
boolean Dead;

void setup() {
  size(800, 800);
  Player = new Ship();
  Asteroids = new ArrayList<Asteroid>();

  Shots = new ArrayList<Shot>();
  for (int i = 0; i < 3; i++) {
    Asteroids.add(new Asteroid(true, 0, 0, 0));
  }
  Dead = false;
}

void draw() {
  if (Dead) {
    noLoop();
  }
  background(0);
  Player.Show();
  Player.Update();
  for (Asteroid Current : Asteroids) {
    Current.Show();
    Current.Update();
    if (Current.IntersectsPlayer(Player)) {
      println(Dead);
      Dead = true;
    }
  }

  for (int i = Shots.size() - 1; i >= 0; i--) {
    Shot CurrentShot = Shots.get(i);
    CurrentShot.Show();
    CurrentShot.Update();
    for (int j = Asteroids.size() - 1; j >= 0; j--) {
      Asteroid CurrentAsteroid = Asteroids.get(j);
      if (CurrentShot.Intersects(CurrentAsteroid)) {
        if (CurrentAsteroid.Radius > 25) {
          Asteroids.add(new Asteroid(false, CurrentAsteroid.Radius, CurrentAsteroid.Position.x, CurrentAsteroid.Position.y));
          Asteroids.add(new Asteroid(false, CurrentAsteroid.Radius, CurrentAsteroid.Position.x, CurrentAsteroid.Position.y));
        }
        if (CurrentAsteroid.Parent == true) {
          Asteroids.add(new Asteroid(true, 0, 0, 0));
        }
        Shots.remove(i);
        Asteroids.remove(j);
      }
    }
    if (CurrentShot.Finished) {
      if (Shots.size() != 0) {
        Shots.remove(i);
      }
    }
  }
}

void keyReleased() {
  if (key == 'a' || key == 'd') {
    Player.RotationChange = 0;
  } else if (key == 'w') {
    Player.Moving = false;
  }
}

void keyPressed() {
  if (key == 'd') {
    Player.RotationChange = 0.05;
  } else if (key == 'a') {
    Player.RotationChange = -0.05;
  } else if (key == 'w') {
    Player.Moving = true;
  } else if (key == ' ') {
    if (Shots.size() < 4) {
      Shots.add(new Shot(Player.Position.x, Player.Position.y, Player.Rotation));
    }
  }
}
