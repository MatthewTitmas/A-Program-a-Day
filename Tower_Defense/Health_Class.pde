class Health {
  int MaxHealth;
  int HitPoints;
  
  Health (int HP) {
    MaxHealth = HP;
    HitPoints = HP;
  }
  
  void Show(float XPos, float YPos) {
    float Temp = map(HitPoints,0,MaxHealth,0,50);
    rectMode(CORNER);
    stroke(1);
    fill(0,200,0);
    rect(XPos-25,YPos-50,Temp,10);
  }
}
