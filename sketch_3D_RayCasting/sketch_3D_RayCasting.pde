ArrayList<Wall> Walls;
int AmountOfWalls = 15;
Circle Player;

void setup() {
  size(1600,800);
  Player = new Circle(50,50);
  Walls = new ArrayList<Wall>(AmountOfWalls+4);
  Walls.add(new Wall(0,0,width/2,0));
  Walls.add(new Wall(0,0,0,height));
  Walls.add(new Wall(0,height-1,width/2,height-1));
  Walls.add(new Wall(width/2-1,0,width/2-1,height));
  for (int x = 0; x < AmountOfWalls; x++) {
    Walls.add(new Wall(random(width/2),random(height),random(width/2),random(height)));
  }
}


void draw() {
  background(0);
  for (Wall Current : Walls) {
    Current.Show();
  }
  Player.Update();
  Player.Show();
}


void keyReleased() {
  if (key == 'a' || key == 'd') {
    Player.AngleChange = 0;
  } else if (key == 'w' || key == 's') {
    Player.Velocity = 0;
  }
}


void keyPressed() {
  if (key == 'd') {
    Player.AngleChange = 0.05;
  } else if (key == 'a') {
    Player.AngleChange = -0.05;
  } else if (key == 'w') {
    Player.Velocity = 1;
  } else if (key == 's') {
    Player.Velocity = -1;
  }
  
} 
