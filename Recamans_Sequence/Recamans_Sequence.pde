boolean[] Numbers;
int Counter;
int Location;
boolean Down;


float OldX = 0;

ArrayList<Arc> Arcs;

void setup() {
  //frameRate(5);
  
  size(800, 800);


  Numbers = new boolean[1];
  Numbers[0] = true;

  Counter = 1;
  Location = 0;
  Down = false;

  Arcs = new ArrayList<Arc>();
  
}

void draw() {
  background(255);
  for (Arc Current : Arcs) {
    Current.Show();
  }
  if (Location-Counter < 0) {
    Location += Counter;
    while (Numbers.length-1 < Location) {
      Numbers = (boolean[])append(Numbers, false);
    }
    Numbers[Location] = true;
  } else {
    if (Numbers[Location-Counter] == false) {
      Location -= Counter;
      Numbers[Location] = true;
    } else {
      while (Numbers.length-1 < Location+Counter) {
        Numbers = (boolean[])append(Numbers, false);
      }
      Location += Counter;
      Numbers[Location] = true;
    }
  }
  Arcs.add(new Arc(Location, OldX, Down));
  OldX = Location;

  Counter++;
  Down = !Down;
}
