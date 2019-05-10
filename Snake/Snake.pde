float Rows = 20;
float Spacing;
Food SnakeFood;
PlayerSnake Player;

void setup() {
  size(800,800);
  background(0);
  Spacing = width/Rows;
  SnakeFood = new Food(Rows,Spacing);
  Player = new PlayerSnake(Rows, Spacing);
}

void draw() {
  frameRate(10);
  background(0);
  stroke(255);
  for (int i = 0; i < Rows; i++) {
    line((i+1)*Spacing,0,(i+1)*Spacing,height);
    line(0,(i+1)*Spacing,width,(i+1)*Spacing);
  }
  SnakeFood.Show();
  Player.Update();
  Player.Show();
  Player.CheckCollisionWithSelf(Player);
  SnakeFood.CheckCollision(Player);
  if (Player.GameOver == true) {
    noLoop();
  }
}

void keyPressed() {
  if (key == 'w' && !(Player.YDirection == 1)) {
    Player.YDirection = -1;
    Player.XDirection = 0;
  } else if (key == 's' && !(Player.YDirection == -1)) {
    Player.YDirection = 1;
    Player.XDirection = 0;
  } else if (key == 'a' && !(Player.XDirection == 1)) {
    Player.XDirection = -1;
    Player.YDirection = 0;
  } else if (key == 'd' && !(Player.XDirection == -1)) {
    Player.XDirection = 1;
    Player.YDirection = 0;
  }
}
