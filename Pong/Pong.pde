Paddle LeftPaddle;
Paddle RightPaddle;
Ball Pong;

void setup() {
  background(0);
  size(800,600);
  LeftPaddle = new Paddle(0,10,30,100);
  RightPaddle = new Paddle(width-30,10,30,100);
  Pong = new Ball(width/2,height/2);
}

void draw() {
  background(0);
  LeftPaddle.Show();
  RightPaddle.Show();
  Pong.Show();
  Pong.Walls();
  Pong.CheckPoint();
  Pong.CollideWithPaddles(LeftPaddle.YPos,RightPaddle.YPos,LeftPaddle.Width,LeftPaddle.Height);
  Pong.ShowPoints();
}

void keyPressed() {
  if (key == 'a') {
    LeftPaddle.YChange = -4;
  } else if (key == 'z') {
    LeftPaddle.YChange = 4;
  } if (key == 'k') {
    RightPaddle.YChange = -4;
  } else if (key == 'm') {
    RightPaddle.YChange = 4;
  }
}

void keyReleased() {
  if (key == 'a' || key == 'z') {
    LeftPaddle.YChange = 0;
  } else if (key == 'k' || key == 'm') {
    RightPaddle.YChange = 0;
  }
}
