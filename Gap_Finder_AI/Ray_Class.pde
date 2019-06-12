class Ray {
  float Angle;

  Ray(float angle) {
    Angle = angle;
  }

  float GetDistances(float x, float y) {
    float[] Distances = new float[30];
    float ClosestX = x;
    float ClosestY = y;
    stroke(255);
    strokeWeight(2);
    boolean Hit = false;
    while (!Hit) {
      ClosestX += cos(Angle);
      ClosestY += sin(Angle);
      if (ClosestX >= 799) {
        ClosestX = 800;
        Hit = true;
      } else if (ClosestY >= 799) {
        ClosestY = 800;
        Hit = true;
      } else if (ClosestX < 0) {
        ClosestX = 0;
        Hit = true;
      } else if (ClosestY < 0) {
        ClosestY = 0;
        Hit = true;
      } else {
        if (Pixels[int(ClosestX)][int(ClosestY)].Checked == true && Pixels[int(ClosestX)][int(ClosestY)].Hovered == false) {
          Hit = true;
        }
      }
    }
    //line(x, y, ClosestX, ClosestY);
    return dist(x,y,ClosestX,ClosestY);
  }
}
