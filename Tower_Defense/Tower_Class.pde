class Tower {
  PVector Position = new PVector();
  boolean Placing;
  boolean Contact;
  float Range = 100;
  float TimeOfLastShot;
  float TimeSinceLastShot = 1000;
  
  Tower() {
    Placing = true;
    Contact = false;
  }
  
  void Show() {
    noStroke();
    if (Placing == true) {
      fill(200,200,200,200);
      ellipse(mouseX,mouseY,300,300);
      fill(#FFF77D);
      ellipse(mouseX,mouseY,75,75);
    } else {
      fill(200,200,200,100);
      if (Contact == true) {
        ellipse(Position.x,Position.y,300,300);
      }
      fill(#FFF77D);
      ellipse(Position.x,Position.y,75,75);
    } 
  }
  
  void ShootEnemy(ArrayList<Enemy> Enemies) {
    if (Placing == false) {
      for (Enemy Current : Enemies) {
        TimeSinceLastShot = millis()  - TimeOfLastShot;
        if (TimeSinceLastShot > 100) {
          if (((Current.Position.x - Position.x) * (Current.Position.x - Position.x)) + ((Current.Position.y - Position.y) * (Current.Position.y - Position.y)) < 150*150) {
            TimeOfLastShot = millis();
            Current.CurrentHealth.HitPoints -= 10;
          }
        }
      }
    }
  }
}
