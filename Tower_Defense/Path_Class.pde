class Path {
  ArrayList<PVector> Points;
  Path(){
    Points = new ArrayList<PVector>();
    Points.add(new PVector(-20,152));
    Points.add(new PVector(1,152));
    Points.add(new PVector(304,204));
    Points.add(new PVector(631,160));
    Points.add(new PVector(903,63));
    Points.add(new PVector(956,88));
    Points.add(new PVector(974,136));
    Points.add(new PVector(985,268));
    Points.add(new PVector(999,499));
    Points.add(new PVector(981,580));
    Points.add(new PVector(928,632));
    Points.add(new PVector(734,696));
    Points.add(new PVector(435,655));
    Points.add(new PVector(130,599));
    Points.add(new PVector(1,589));
    Points.add(new PVector(-50,589));
  }
  
  void Show() {
    for (PVector Current : Points) {
      ellipse(Current.x,Current.y,10,10);
    }
  }
}
