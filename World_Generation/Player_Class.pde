class Player {
  PVector Position;
  PVector Velocity;
  float Width;
  float Height;
  
  Player(float X, float Y) {
    Position = new PVector(25000,0);
    Velocity = new PVector(0,0);
    Height = 80;
    Width = 40;
  }
  
  void Show() {
    fill(127);
    pushMatrix();
    translate(width/2,height/2);
    rect(0,0,Width,Height);
    popMatrix();
  }
  
  void Update() {
    Position.add(Velocity);
    //Velocity.y += Gravity;
    //if (Velocity.y > 10) {
    //  Velocity.y = 10;
    //}
  }
}
