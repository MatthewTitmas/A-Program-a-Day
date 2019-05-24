ArrayList<Box> Seconds;
ArrayList<Box> Minutes;
int Binary;
int SecondBinary;
int[] HexNumbers = {0x7E,0x30,0x6D,0x79,0x33,0x5B,0x5F,0x70,0x7F,0x7B};
int SecondCount = 0;
int MinuteCount = 0;

void setup() {
  size(420,340);
  background(0);
  Minutes = new ArrayList<Box>(7);
  Minutes.add(new Box("Horizontal",20,100,120,50)); //A
  Minutes.add(new Box("Vertical",20,100,180,110));  //B
  Minutes.add(new Box("Vertical",20,100,180,230));  //C
  Minutes.add(new Box("Horizontal",20,100,120,290));//D
  Minutes.add(new Box("Vertical",20,100,60,230));  //E
  Minutes.add(new Box("Vertical",20,100,60,110));  //F
  Minutes.add(new Box("Horizontal",20,100,120,170));//G
  
  
  Seconds = new ArrayList<Box>(7);
  Seconds.add(new Box("Horizontal",20,100,300,50)); //A
  Seconds.add(new Box("Vertical",20,100,360,110));  //B
  Seconds.add(new Box("Vertical",20,100,360,230));  //C
  Seconds.add(new Box("Horizontal",20,100,300,290));//D
  Seconds.add(new Box("Vertical",20,100,240,230));  //E
  Seconds.add(new Box("Vertical",20,100,240,110));  //F
  Seconds.add(new Box("Horizontal",20,100,300,170));//G
  frameRate(3);
}


void draw() {
  if (frameCount % 3 == 0) {
    SecondCount += 1;
    if (SecondCount == 10) {
      SecondCount = 0;
      MinuteCount += 1;
      if (MinuteCount == 6) {
        MinuteCount = 0;
      }
    }
  }
  Binary = HexNumbers[SecondCount];
  SecondBinary = HexNumbers[MinuteCount];
  background(0);
  for (Box CurrentBox : Seconds) {
    if (binary(Binary,7).charAt(0) == '1') {
      CurrentBox.Show(true);
    } else {
      CurrentBox.Show(false);
    }
    Binary = Binary << 1;
  }
  
  for (Box CurrentBox : Minutes) {
    if (binary(SecondBinary,7).charAt(0) == '1') {
      CurrentBox.Show(true);
    } else {
      CurrentBox.Show(false);
    }
    SecondBinary = SecondBinary << 1;
  }
}
